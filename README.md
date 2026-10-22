# desafio-final-omnichannel
Sistema de Gestão OmniChannel - Projeto SENAI

# Sistema de Gestão OmniChannel

## Sobre o projeto

Este projeto tem como objetivo desenvolver um sistema de gestão OmniChannel para integrar informações de clientes, lojas, produtos, pedidos e vendas, utilizando banco de dados relacional e não relacional.

## Tecnologias utilizadas

- MySQL
- MongoDB Atlas
- JavaScript
- brModelo
- GitHub

## Estrutura do projeto

- `scripts/`: scripts SQL e código de integração com o MongoDB.
- `docs/`: diagrama do banco de dados e documentação.
- `backup_omnichannel.sql`: backup do banco de dados relacional.

## Banco de dados relacional

O banco de dados utilizado é `omnichannel_db`, com tabelas para armazenar clientes, lojas, produtos, pedidos, itens dos pedidos e auditoria de preços.

O projeto também inclui uma rotina para registrar vendas, atualizar o estoque e verificar produtos com estoque baixo, além de um mecanismo de auditoria para alterações de preços.

## Banco de dados não relacional

O banco `omnichannel_nosql`, no MongoDB Atlas, utiliza a coleção `logs_navegacao` para registrar informações de navegação.

## Segurança

O projeto prevê um usuário com permissões restritas de leitura para consultar dados de clientes e produtos.

## Documentação

Os diagramas e demais documentos do projeto ficam na pasta `docs/`.

## Autor

Pedro Henrique Santos Peixoto
