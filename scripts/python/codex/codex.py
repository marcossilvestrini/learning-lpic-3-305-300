import os
import sys
from pathlib import Path
from dotenv import load_dotenv
from openai import OpenAI

# Pasta do script
SCRIPT_DIR = Path(__file__).resolve().parent

def resolve_dotenv() -> Path:
    """
    1) Tenta .env na pasta do script.
    2) Se não existir, sobe diretórios até encontrar um .env.
    3) Retorna o caminho encontrado ou lança erro.
    """
    # 1) Mesmo diretório do script
    candidate = SCRIPT_DIR / ".env"
    if candidate.exists():
        return candidate

    # 2) Ascendência (até a raiz do drive)
    for parent in [*SCRIPT_DIR.parents]:
        candidate = parent / ".env"
        if candidate.exists():
            return candidate

    raise FileNotFoundError(
        "Arquivo .env não encontrado. Crie um .env na pasta do script ou em algum diretório acima."
    )

# Carrega o .env
dotenv_path = resolve_dotenv()
load_dotenv(dotenv_path=dotenv_path)

api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    raise SystemExit(
        f"ERRO: variáveis não encontradas em {dotenv_path}.\n"
        "Inclua no .env:\n"
        "OPENAI_API_KEY=sk-xxxxx_sua_chave_aqui"
    )

client = OpenAI(api_key=api_key)

def codex_chat(prompt: str) -> str:
    resp = client.chat.completions.create(
        model="gpt-5",
        messages=[
            {"role": "system", "content": "Você é um assistente focado em geração e explicação de código."},
            {"role": "user", "content": prompt},
        ],
    )
    return resp.choices[0].message.content

if __name__ == "__main__":
    # one-shot
    if len(sys.argv) > 1:
        prompt = " ".join(sys.argv[1:]).strip()
        if not prompt:
            raise SystemExit("Uso: python codex.py \"<seu prompt>\"")
        print(codex_chat(prompt))
        sys.exit(0)

    # REPL
    try:
        while True:
            user_input = input("Codex> ").strip()
            if user_input.lower() in {"exit", "quit"}:
                break
            if not user_input:
                continue
            print(codex_chat(user_input))
    except (KeyboardInterrupt, EOFError):
        pass
