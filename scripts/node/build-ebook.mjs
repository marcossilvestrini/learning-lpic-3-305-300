import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import MarkdownIt from 'markdown-it';
import anchor from 'markdown-it-anchor';

const projectRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', '..');
const sourcePath = path.join(projectRoot, process.env.EBOOK_SOURCE ?? 'README.md');
const outputDir = path.join(projectRoot, 'build', 'ebook');
const htmlPath = path.join(outputDir, 'ebook.html');
const cssPath = path.join(projectRoot, 'scripts', 'node', 'ebook.css');
const title = process.env.EBOOK_TITLE ?? 'Learning LPIC-3 305-300';
const courseName = process.env.EBOOK_COURSE_NAME ?? 'Virtualization and Containerization';
const author = process.env.EBOOK_AUTHOR ?? 'Marcos Silvestrini';
const language = process.env.EBOOK_LANGUAGE ?? 'English';
const buildDate = process.env.EBOOK_DATE ?? new Date().toISOString().slice(0, 10);

async function imageDataUrl(imagePath) {
  const extension = path.extname(imagePath).toLowerCase();
  const mimeTypes = { '.jpg': 'image/jpeg', '.jpeg': 'image/jpeg', '.png': 'image/png', '.gif': 'image/gif', '.webp': 'image/webp' };
  const mimeType = mimeTypes[extension];
  if (!mimeType) return null;
  const data = await fs.readFile(imagePath);
  return `data:${mimeType};base64,${data.toString('base64')}`;
}

function cleanReadme(markdown) {
  let content = markdown.replace(/^\uFEFF/, '').replace(/\r\n?/g, '\n');

  // Remove the README-only navigation and status elements before Markdown rendering.
  content = content.replace(/^<h1><a name="readme-top"><\/a><\/h1>\s*/i, '');
  content = content.replace(/<details>[\s\S]*?<\/details>\s*/i, '');
  content = content.replace(/^\s*\[!\[[^\n]+\]\([^\n]+\)\]\([^\n]+\)\s*$/gm, '');
  content = content.replace(/^\s*\[!\[[^\n]+\]\[[^\]]+\]\s*$/gm, '');
  content = content.replace(/^\s*\[[^\]]+\]:\s*https?:\/\/img\.shields\.io\/[^\n]+\s*$/gim, '');
  content = content.replace(/<a[^>]*>\s*<img[^>]*(?:badge\.svg|shields\.io)[^>]*>\s*<\/a>/gi, '');
  content = content.replace(/<p>\s*(?:<a[\s\S]*?<img[\s\S]*?>[\s\S]*?<\/a>\s*)+<\/p>/gi, block =>
    /badge\.svg|shields\.io/i.test(block) ? '' : block
  );
  content = content.replace(/^\s*<p align="center">[\s\S]*?<\/p>\s*$/gim, '');
  content = content.replace(/^\s*<p align="right">[\s\S]*?<\/p>\s*$/gim, '');
  content = content.replace(/^\s*<a name="[^"]+"><\/a>\s*$/gim, '');
  content = content.replace(/^\s*---\s*$/gm, '');
  content = content.replace(/^\s*##\s+(?:🗂️\s*)?Summary\s*$/gim, '');

  // Keep the course cover in the generated cover page, not as a duplicate inline image.
  content = content.replace(/^\s*!\[LPIC3-305-300\]\([^\n]+\)\s*$/gim, '');
  content = content.replace(/^\s*# 📚 LEARNING LPIC-3 305-300\s*$/m, '');
  content = content.replace(/^\s*\[!\[[^\n]+\]\([^\n]+\)\]\([^\n]+\)\s*$/gm, '');

  return content.replace(/\n{3,}/g, '\n\n').trim();
}

function createToc(renderedHtml) {
  const entries = [];
  const headingPattern = /<h([23])[^>]*id="([^"]+)"[^>]*>([\s\S]*?)<\/h\1>/g;
  let match;
  while ((match = headingPattern.exec(renderedHtml)) !== null) {
    const label = match[3].replace(/<[^>]+>/g, '').trim();
    entries.push(`<li class="toc-level-${match[1]}"><a href="#${match[2]}">${label}</a></li>`);
  }
  return entries.length === 0 ? '' : `<nav class="toc" aria-label="Table of contents"><h1>Contents</h1><ol>${entries.join('')}</ol></nav>`;
}

const [markdown, css] = await Promise.all([
  fs.readFile(sourcePath, 'utf8'),
  fs.readFile(cssPath, 'utf8')
]);
const cleanedMarkdown = cleanReadme(markdown);
const md = new MarkdownIt({ html: true, breaks: false, linkify: true, typographer: true })
  .use(anchor, { slugify: value => value.trim().toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '') });
let renderedContent = md.render(cleanedMarkdown);
const imageReferences = [...renderedContent.matchAll(/src="(?:\/|\.\/)?images\/([^"#?]+)"/gi)];
for (const [sourceAttribute, imagePath] of imageReferences) {
  const sourceImage = path.join(projectRoot, 'images', imagePath);
  const dataUrl = await imageDataUrl(sourceImage);
  if (dataUrl) renderedContent = renderedContent.replaceAll(sourceAttribute, `src="${dataUrl}"`);
}
const coverImage = await imageDataUrl(path.join(projectRoot, 'images', 'lpic3-305-300.jpg'));
const toc = createToc(renderedContent);
const html = `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${title}</title>
  <style>${css}</style>
</head>
<body>
  <section class="cover">
    <img class="cover-image" src="${coverImage}" alt="LPIC-3 305-300 course cover">
    <div class="cover-rule"></div>
    <p class="cover-kicker">LPIC-3 CERTIFICATION · 305-300</p>
    <h1>${title}</h1>
    <p class="cover-course">${courseName}</p>
    <p class="cover-subtitle">Study guide and practical laboratory reference</p>
    <p class="cover-meta">${language} edition · ${author} · ${buildDate}</p>
  </section>
  ${toc}
  <main class="content">${renderedContent}</main>
</body>
</html>`;

await fs.mkdir(outputDir, { recursive: true });
await fs.writeFile(htmlPath, html, 'utf8');
console.log(`Generated ${htmlPath}`);
