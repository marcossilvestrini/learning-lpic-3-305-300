import express from 'express';
import pg from 'pg';

const {
  PGHOST = 'postgres',
  PGPORT = '5432',
  PGDATABASE = 'appdb',
  PGUSER = 'app',
  PGPASSWORD = 'secret',
  MCP_LISTEN_HOST = '0.0.0.0',
  MCP_LISTEN_PORT = '8080',
  MCP_QUERY_ALLOW = '^\\s*select\\b',                 // SELECT-only (regex)
  MCP_EXEC_ALLOW  = '^\\s*(insert|update|delete|with)\\b' // DML permission
} = process.env;

const app = express();
app.use(express.json({ limit: '1mb' }));

const pool = new pg.Pool({
  host: PGHOST,
  port: Number(PGPORT),
  database: PGDATABASE,
  user: PGUSER,
  password: PGPASSWORD,
  max: 10,
  idleTimeoutMillis: 30000
});

// Utility function to allow/deny SQL patterns via regex
const allow = (sql, pattern) => {
  try {
    const re = new RegExp(pattern, 'i');
    return re.test(sql || '');
  } catch {
    return false;
  }
};

app.get('/health', async (_req, res) => {
  try {
    const r = await pool.query('select 1 as ok');
    return res.json({ status: 'ok', db: 'connected', probe: r.rows[0].ok === 1 });
  } catch (e) {
    return res.status(500).json({ status: 'error', error: String(e) });
  }
});

/**
 * POST /query
 * Body: { "sql": "select ...", "params": [ ... ] } 
 * Restrictions: SELECT-only (configurable via MCP_QUERY_ALLOW)
 */
app.post('/query', async (req, res) => {
  const { sql, params = [] } = req.body || {};
  if (!sql || !allow(sql, MCP_QUERY_ALLOW)) {
    return res.status(400).json({ error: 'SQL not allowed for /query (enforce SELECT).' });
  }
  try {
    const r = await pool.query(sql, params);
    return res.json({ rows: r.rows, rowCount: r.rowCount, fields: r.fields?.map(f => f.name) });
  } catch (e) {
    return res.status(400).json({ error: String(e) });
  }
});

/**
 * POST /exec
 * Body: { "sql": "insert/update/delete ...", "params": [ ... ] } 
 * Restrictions: Basic DML (INSERT/UPDATE/DELETE/WITH)
 */
app.post('/exec', async (req, res) => {
  const { sql, params = [] } = req.body || {};
  if (!sql || !allow(sql, MCP_EXEC_ALLOW)) {
    return res.status(400).json({ error: 'SQL not allowed for /exec (enforce DML).' });
  }
  try {
    const r = await pool.query(sql, params);
    return res.json({ rowCount: r.rowCount });
  } catch (e) {
    return res.status(400).json({ error: String(e) });
  }
});

//Example "high-level query" for your demo schema (optional)
app.get('/demo/users', async (_req, res) => {
  try {
    const r = await pool.query('select id, full_name, email, created_at from demo.users order by created_at desc limit 25');
    return res.json(r.rows);
  } catch (e) {
    return res.status(400).json({ error: String(e) });
  }
});

app.listen(Number(MCP_LISTEN_PORT), MCP_LISTEN_HOST, () => {
  console.log(`[MCP] listening on http://${MCP_LISTEN_HOST}:${MCP_LISTEN_PORT}`);
});
