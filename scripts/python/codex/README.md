# Codex Chat (GPT-5)

Este projeto fornece um CLI/REPL estilo **Codex**, mas utilizando o modelo **GPT-5** via API da OpenAI.
O script lê a chave da API de um arquivo `.env` e é totalmente portável via `requirements.txt`.

---

## 📦 Pré-requisitos

- **Python 3.12+**
- Conta na [OpenAI](https://platform.openai.com/) com chave de API válida
- Windows PowerShell (recomendado)

---

## 🚀 Instalação

### 1. Clone o repositório

```powershell
git clone <seu-repo>
cd <seu-repo>
```

### 2. Crie um ambiente virtual (opcional, recomendado)

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

### 3. Instale as dependências

```powershell
pip install -r requirements.txt
```

---

## 🔑 Configuração da API Key

Na raiz do projeto, crie um arquivo `.env` com o conteúdo:

```plaintext
OPENAI_API_KEY=sk-xxxxx_sua_chave_aqui
```

---

## ▶️ Execução

### Modo REPL

```powershell
python .\scripts\python\codex.py
```

Saída:

```plaintext
Codex> Explique Kubernetes em 3 bullets
- Orquestrador de containers
- Automatiza deployment, scaling e recovery
- Facilita gestão de workloads distribuídos
```

### Modo one-shot

```powershell
python .\scripts\python\codex.py "gerar um Dockerfile para Flask"
```

---

## ⚡ Alias no PowerShell

Para rodar apenas `codex` em vez de `python .\scripts\python\codex.py`:

1. Abra o perfil do PowerShell:
   ```powershell
   notepad $PROFILE
   ```

2. Adicione:
   ```powershell
   function codex {
       python "K:\CERTIFICACAO\lpic-3-305-300\scripts\python\codex.py" @args
   }
   ```

Agora você pode rodar:

```powershell
codex "listar 5 comandos Linux para troubleshooting"

```

---

## 📑 Requirements

Arquivo `requirements.txt`:

```plaintext
openai=1.51.0
python-dotenv=1.0.1
```

Para instalar:

```powershell
pip install -r requirements.txt
```

---

## 🔍 Troubleshooting

* **`ModuleNotFoundError: No module named 'openai'`**

  → Rode `pip install -r requirements.txt` no Python correto (confira com `python --version`).
* **`OpenAIError: The api_key client option must be set`**

  → Verifique se o `.env` existe e contém `OPENAI_API_KEY`.
* **Permissão para ativar venv**

  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  ```

---

## 📌 Observações

* Este projeto é **didático/experimental** para simular o Codex com GPT-5.
* Em produção, recomenda-se **gestão segura da chave** via Azure Key Vault, AWS Secrets Manager ou HashiCorp Vault.
