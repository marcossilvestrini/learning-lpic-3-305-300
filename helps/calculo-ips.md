# Cálculo de Redes IPv4 Utilizando Número Mágico

📖 Guia de Bolso: Cálculo de Redes IPv4

Este guia ensina a descobrir o **ID de Rede, Máscara, Total de IPs, Primeiro IP Útil, Último IP Útil e Broadcast** de qualquer IP usando o  **Método do Número Mágico** .

## PASSO 1: Analisar a Entrada (Identificar a Barra `/`)

Antes de qualquer conta, você precisa da barra (CIDR).

* **Se o IP já veio com a barra (Ex: `10.50.20.5/9`):** **Esqueça as classes.** A barra informada é a ordem soberana. Siga direto para o  **Passo 2** **.**
* **Se o IP veio sozinho, sem barra (Ex: `10.50.20.5`):** Você é obrigado a usar o "padrão de fábrica" (Classe Padrão). Olhe apenas para o **primeiro octeto** do IP:
  * **De ****1 a 126** ➔ Classe A ➔ Defina como **`/8`**
  * **De ****128 a 191** ➔ Classe B ➔ Defina como **`/16`**
  * **De ****192 a 223** ➔ Classe C ➔ Defina como **`/24`**

## 📌 PASSO 2: Localizar o Octeto de Divisão

Descubra em qual dos 4 blocos do IP a barra está estacionada. É nele que faremos as contas:

* **Entre **`/1` e `/8` ➔ **1º octeto**
* **Entre **`/9` e `/16` ➔ **2º octeto**
* **Entre **`/17` e `/24` ➔ **3º octeto**
* **Entre **`/25` e `/32` ➔ **4º octeto**

## 📌 PASSO 3: O Coração do Método – O Número Mágico

Para achar o  **Número Mágico** , use a regra do próximo múltiplo de 8 (8, 16, 24 ou 32):

1. **Se a barra JÁ FOR um múltiplo exato de 8 (`/8`, `/16`, `/24`):**
   * **O "alvo" é o próprio número da barra. A subtração dá **`0`.
   * **Número Mágico:** \(2^0 = 1\).
2. **Se a barra NÃO FOR múltiplo de 8 (Ex: `/9`, `/20`, `/26`):**
   * **Subtraia o valor da barra do próximo múltiplo de 8 logo acima dela.**
   * **Número Mágico:** Eleve 2 ao resultado da subtração \(2^resultado\).

Tabela Rápida de Potências para o Número Mágico:

* **Subtração deu ****1** \(2^1 =\) **2**
* **Subtração deu ****2** \(2^2 =\) **4**
* **Subtração deu ****3** \(2^3 =\) **8**
* **Subtração deu ****4** \(2^4 =\) **16**
* **Subtração deu ****5** \(2^5 =\) **32**
* **Subtração deu ****6** \(2^6 =\) **64**
* **Subtração deu ****7** \(2^7 =\) **128**

## 📌 PASSO 4: Extrair os Dados Extremos (Máscara e Quantidade de IPs)

A) Descobrir a Máscara de Sub-rede

Subtraia o seu Número Mágico de  **256** . O resultado vai exatamente no octeto de divisão (achado no Passo 2).

* **Todos os octetos ****anteriores** viram `255`.
* **Todos os octetos ****posteriores** viram `0`.

B) Descobrir o Total de IPs

* **Pegue o seu Número Mágico e multiplique por ****256** para cada octeto restante que ficou à direita dele.
* *Dica de ouro:* Lembre-se que um octeto livre vale x256, e dois octetos livres valem x65.536.
* **IPs Úteis:** Subtraia 2 do total (remove ID e Broadcast).

## 📌 PASSO 5: Montar o Bloco da Sub-rede (Onde o IP cai?)

Olhe para o número que está no octeto de divisão do seu IP original. Descubra entre quais múltiplos do seu **Número Mágico** (pulos) ele está.
*(Ex: Se o Número Mágico é 128, os pulos são `0` e `128`. Se for 16, os pulos são `0, 16, 32, 48, 64...`)*

Com isso em mente, preencha o esqueleto da rede respeitando os **octetos trancados** (à esquerda) e os **livres** (à direita):

1. **ID da Rede (Início):**
   * **No octeto de divisão: coloque o **pulo anterior mais próximo**.
   * **Nos octetos à direita (livres): preencha com ** **`0`** **.**
2. **IP de Broadcast (Fim Absoluto):**
   * **No octeto de divisão: coloque um número a menos que o ***próximo* pulo.
   * **Nos octetos à direita (livres): preencha com o valor máximo ** **`255`** **.**
3. **Bloco Inicial (Primeiro IP Útil):**
   * **É o ID da Rede + 1 (muda apenas o último octeto para**`.1`).
4. **Bloco Final (Último IP Útil):**
   * **É o IP de Broadcast - 1 (muda apenas o último octeto para**`.254`).

## 🧠 EXEMPLO PRÁTICO PARA FIXAR (O Caso do `/9`)

**Entrada:** `10.50.20.5/9`

1. **Barra definida?** Sim, `/9`.
2. **Qual octeto?** O 9 está entre 9 e 16, **2º octeto** . (O primeiro bloco **`10.`** está trancado).
3. **Número Mágico:** Próximo múltiplo de 8 é 16. Conta: \(16 - 9 = 7\). Potência: \(2^7 = 128\).
4. **Máscara:** \(256 - 128 = 128\) no 2º octeto **`255.128.0.0`.**
5. **Total de IPs:** Número mágico é 128. Restam dois octetos livres à direita (x256 x 256).
   * **\(128 x 65.536 = 8.388.608 IPs\).**
6. **Descobrir a Sub-rede:**
   * **Os pulos no 2º octeto são de 128 em 128 (**`0` e `128`).
   * **O 2º octeto do nosso IP é ** **50** **. O 50 está entre **`0` e `128`. O pulo anterior é o `0`.
   * **ID da Rede:** `10.0.0.0/9` (Trancou o 10, usou o pulo 0, zerou o resto).
   * **Broadcast:** `10.127.255.255` (Trancou o 10, usou um número antes do próximo pulo [128-1=127], encheu o resto com 255).
   * **Primeiro IP Útil:** `10.0.0.1`
   * **Último IP Útil:** `10.127.255.254`
