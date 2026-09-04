# Stack otel-lgtm

A forma mais limpa e recomendada pela Grafana Labs para ter tudo pronto em um único container é a imagem unificada (grafana/otel-lgtm).

Ela integra nativamente métricas, logs e traces.

## 1. Estrutura de Pastas do Projeto

Antes de iniciar o Docker, crie a seguinte estrutura de arquivos no diretório do seu projeto:

```text
meu-projeto-lgtm/
├── docker-compose.yml
└── grafana-provisioning/
    ├── dashboards.yaml
    └── dashboards-json/
```

### Criando o arquivo de provisionamento

Dentro da pasta grafana-provisioning/, crie o arquivo dashboards.yaml com o seguinte conteúdo para que o Grafana importe os dashboards automaticamente:

```yaml
apiVersion: 1
providers:
  - name: 'dashboards-custom'
    orgId: 1
    folder: 'Observabilidade Geral'
    type: file
    disableDeletion: false
    editable: true
    options:
      path: /var/lib/grafana/dashboards-custom
      foldersFromFilesStructure: false
```

### Baixando os Dashboards Oficiais (JSON)

Execute os comandos abaixo dentro do seu terminal para baixar os painéis prontos do OpenTelemetry, Loki e Tempo diretamente para a pasta correspondente:

```bash
# Para OpenTelemetry Collector (Métricas do OTel - ID 15983)
curl -s "https://grafana.com/api/dashboards/15983/revisions/latest/download" -o apps/otel-lgtm/grafana-provisioning/dashboards-json/opentelemetry.json

# Para Loki (Pesquisa e métricas de Logs - ID 13639)
curl -s "https://grafana.com/api/dashboards/13639/revisions/latest/download" -o apps/otel-lgtm/grafana-provisioning/dashboards-json/loki.json

# Para Tempo / APM (Visão geral de Traces - ID 17175)
curl -s "https://grafana.com/api/dashboards/17175/revisions/latest/download" -o apps/otel-lgtm/grafana-provisioning/dashboards-json/tempo.json

# --- CORREÇÃO AUTOMÁTICA DOS DASHBOARDS ---
# 1. Substitui as variáveis genéricas pelos UIDs das fontes de dados reais do otel-lgtm
sed -i 's/"${DS_LOKI}"/"loki"/g' apps/otel-lgtm/grafana-provisioning/dashboards-json/loki.json apps/otel-lgtm/grafana-provisioning/dashboards-json/tempo.json
sed -i 's/"${DS_PROMETHEUS}"/"prometheus"/g' apps/otel-lgtm/grafana-provisioning/dashboards-json/tempo.json
sed -i 's/"${datasource}"/"prometheus"/g' apps/otel-lgtm/grafana-provisioning/dashboards-json/opentelemetry.json

# 2. Remove o bloco __inputs de todos os JSONs usando jq para permitir o provisionamento
for dash in apps/otel-lgtm/grafana-provisioning/dashboards-json/*.json; do
  jq 'del(.__inputs)' "$dash" > "$dash.tmp" && mv "$dash.tmp" "$dash"
done

```
---

## 2. Docker Compose

O docker-compose.yml abaixo expõe o Grafana, o coletor OpenTelemetry e as portas internas de ingestão de dados diretamente na faixa das portas 90xx.

Ele provisiona também uma API fake para gerar gerar metricas

```yaml
services:
  # --- STACK LGTM UNIFICADA ---
  lgtm:
    image: grafana/otel-lgtm:latest
    container_name: lgtm-stack
    ports:
      - "9000:3000"  # Grafana (Web UI)
      - "9041:4317"  # OTLP gRPC receiver
      - "9042:4318"  # OTLP HTTP receiver
      - "9090:9090"  # Prometheus / Mimir
      - "9010:3100"  # Loki
      - "9020:3200"  # Tempo
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    volumes:
      - lgtm-data:/data
      - ./grafana-provisioning/dashboards.yaml:/etc/grafana/provisioning/dashboards/dashboards.yaml:ro
      - ./grafana-provisioning/dashboards-json:/var/lib/grafana/dashboards:ro
    networks:
      - otelemetry

  # --- API PARA TESTE DE APM COM CURL ---
  api-teste:
    image: nicholasjackson/fake-service:v0.26.2
    container_name: api-instrumentada
    ports:
      - "9080:9090"
    environment:
      - LISTEN_ADDR=0.0.0.0:9090
      - NAME=api-teste-apm
      - MESSAGE="Requisicao HTTP processada e telemetria enviada!"
      - TRACING_OTEL=true
      - OTLP_ENDPOINT=lgtm:4317
    depends_on:
      - lgtm
    networks:
      - otelemetry

volumes:
  lgtm-data:

networks:
  otelemetry:
    driver: bridge
```

---

## 3. Mapeamento de Portas (http://ip_do_servidor:porta)

* http://ip_do_servidor:9000: Interface Web do Grafana (Acesso centralizado).
  * Usuário padrão: admin
  * Senha padrão: admin
* http://ip_do_servidor:9090: Endpoint direto do Mimir (Métricas).
* http://ip_do_servidor:9010: Endpoint direto do Loki (Logs).
* http://ip_do_servidor:9020: Endpoint direto do Tempo (Traces).

---

## 4. Endpoints para Ingestão do OpenTelemetry (Sua Aplicação)

Caso vá configurar o SDK do OpenTelemetry na sua aplicação interna para enviar dados para essa stack, utilize as seguintes portas:
* gRPC: ip_do_servidor:9041
* HTTP: http://ip_do_servidor:9042

---

## 5. Executando o Ambiente

Inicie os containers em segundo plano:
```sh
docker compose up -d
```

### Gerando tráfego de teste na API

Execute requisições contra a API de testes para forçar o envio de telemetria (logs, métricas e traces) ao painel:

```sh
curl http://localhost:9080/
```
>*(Você também pode acessar http://ip_do_servidor:9080/ direto pelo navegador e atualizar a página algumas vezes).*

---

## 6. Visualizando os Dados

1. Acesse o painel em http://ip_do_servidor:9000 e faça o login (admin/admin).
2. No menu esquerdo, navegue até Dashboards -> pasta Observabilidade Geral para visualizar os gráficos automáticos de APM, Loki e Tempo.
3. Para consultas manuais e detalhadas, acesse o menu Explore:
  * Mude o seletor no topo da tela para Loki para inspecionar os logs da API.
  * Mude para Tempo para rastrear a árvore de chamadas e latência detalhada. O filtro identificará a aplicação automaticamente sob o nome api-catalogo-produtos.