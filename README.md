# app-staticsite-lb-peering-multicloud-renanAfs
# Objetivo

Demonstrar o gerenciamento de recursos em multicloud na AWS e na Azure com a ferramenta de Infraestrutura como Código Terraform utilizando pipelines automatizados via GitHub Actions.

# Pré-requisitos

Logue no GitHub com sua conta da FIAP, crie um repositório de código, faça clone desse novo repositório na sua máquina local e inicie a atividade.

# Critérios de Entrega e Avaliação

Poste na atividade do Teams apenas um arquivo pdf contendo:
a url do seu repo no GitHub
a url do pipeline executado para o Item 02 abaixo
(opcional) evidência(s) do bônus

# Desenho da solução

![image](https://github.com/user-attachments/assets/235d8489-3a43-4aa7-92c1-c2d6745ea1fd)


______________________________________________________________________________
Item 01: Desenvolva o código Terraform relativo ao desenho de solução fornecido acima. (4,0 pontos)

______________________________________________________________________________
Item 02: Execute o pipeline via GitHub Actions, criando os recursos na AWS e na Azure, contendo os itens da solução fornecida. (6,0 pontos)

_________________________________________________________________

BÔNUS !!!

Crie uma máquina virtual na sub-rede pública da VPC 10 na AWS e uma máquina virtual na sub-rede privada da VPC 20 na AWS. Evidencie que a máquina virtual na sub-rede pública da VPC 10 possui comunicação com a Internet. Evidencie que a máquina virtual na sub-rede pública da VPC 10 possui comunicação com a máquina virtual na sub-rede privada da VPC 20. (0,5 pontos)

Crie uma máquina virtual na sub-rede pública da vNet 10 na Azure e uma máquina virtual na sub-rede privada da vNet 20 da Azure. Evidencie que a máquina virtual na sub-rede pública da vNet 10 possui comunicação com a Internet. Evidencie que a máquina virtual na sub-rede pública da vNet 10 possui comunicação com a máquina virtual na sub-rede privada da vNet 20. (0,5 pontos)

ATENÇÃO !!!
Itens não evidenciados na entrega terão deflatores na avaliação.
Destrua os recursos criados na AWS para evitar custos desnecessários.
