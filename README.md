🧩 # Ong-educar-para-mudar-SQL

📌 Sobre o Projeto
Este projeto foi desenvolvido como parte das Experiências Práticas da disciplina de Banco de Dados, envolvendo modelagem conceitual, lógica e física, normalização (1FN, 2FN, 3FN) e manipulação de dados usando SQL (DML).
O sistema simula o gerenciamento de uma ONG que trabalha com projetos sociais, atividades, voluntários e beneficiários.

________________________________________
📘 1. Descrição do Projeto
O projeto consiste no desenvolvimento completo de um sistema de gerenciamento para uma ONG fictícia chamada Educar para Mudar, que atua com:
•	Cadastro de voluntários
•	Gerenciamento de projetos sociais
•	Registro de atividades
•	Beneficiários atendidos
•	Participação de voluntários e beneficiários nas atividades
O trabalho envolve modelagem conceitual, modelo lógico, normalização (1FN, 2FN e 3FN), implementação SQL e roteiros de testes no MySQL Workbench.
________________________________________
🧭 2. Minimundo (Resumo)
A ONG desenvolve projetos e atividades sociais.
Voluntários atuam nessas atividades e beneficiários participam delas.
Regras principais:
•	Um projeto possui várias atividades.
•	Um voluntário pode participar de várias atividades.
•	Um beneficiário pode participar de várias atividades.
•	A presença dos beneficiários é registrada.
•	Informações de cadastro são armazenadas para todos.
________________________________________
🗂️ 3. Modelo de Dados
📌 3.1 Estrutura das Tabelas (Modelo Lógico)
voluntario
•	id_voluntario (PK)
•	nome
•	email
•	telefone
•	data_entrada
projeto
•	id_projeto (PK)
•	nome
•	descricao
•	status
beneficiario
•	id_beneficiario (PK)
•	nome
•	idade
•	endereco
•	data_cadastro
atividade
•	id_atividade (PK)
•	titulo
•	descricao
•	data
•	id_projeto (FK → projeto.id_projeto)
voluntario_atividade
•	id_voluntario (PK, FK)
•	id_atividade (PK, FK)
beneficiario_participacao
•	id_beneficiario (PK, FK)
•	id_atividade (PK, FK)
•	presenca
________________________________________
🖼️ 3.2 Diagrama Entidade-Relacionamento (DER)
A imagem do DER utilizada no projeto pode ser encontrada em:
/diagramas/der.png
(ou caminho equivalente no seu repositório)
________________________________________
🧩 4. Normalização
Todo o modelo foi analisado e atende:
✔ 1FN (valores atômicos, sem listas, sem colunas repetidas)
✔ 2FN (nenhum atributo depende parcialmente de chave composta)
✔ 3FN (sem dependências transitivas)
As análises completas encontram-se no documento Experiência Prática 3.
________________________________________
🗄️ 5. Scripts SQL
Todo o script foi centralizado em um único arquivo: script-completo.sql
Inclui:
📥 INSERTS Principais
Voluntários, beneficiários, atividades, projetos e participações.
🔍 Consultas SELECT
•	JOIN entre tabelas
•	SELECT com WHERE
•	ORDER BY
•	LIMIT
•	Consultas relacionais
✏️ UPDATE
Atualizações de telefone, endereço e status.
🗑️ DELETE
Remoção de participações e beneficiários.

🧠 Tecnologias Utilizadas
•	MySQL 8+
•	MySQL Workbench
•	XAMPP / WampServer
•	Modelo Entidade-Relacionamento
•	Normalização (1FN, 2FN, 3FN)
________________________________________
🧪 6. Como Executar o Projeto (MySQL Workbench)
1.	Abrir o MySQL Workbench
2.	Ir em File → Open SQL Script
3.	Selecionar:
script-completo.sql
4.	Clicar em Execute (⚡)
5.	Banco criado e populado automaticamente
________________________________________
🌐 7. Versionamento e GitHub
O repositório inclui:
•	Script SQL completo
•	Documentação PDF (EP1, EP2, EP3)
•	DER em PNG
•	README.md
•	Históricos organizados de commits
•	Estrutura limpa e padronizada
________________________________________
📝 8. Licença
Projeto licenciado sob Licença MIT.
________________________________________
🙋 Autor
Wellington Bertoso Santos
Projeto acadêmico — Faculdade
📦 Repositório GitHub - https://wellbcode.github.io/Ong-educar-para-mudar-SQL/

