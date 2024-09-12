##BANCOS DE DADOS II##

QUESTÃO

Você foi contratado para criar um sistema de gerenciamento de hospedagens hoteleiras. O sistema deve ser capaz de armazenar informações sobre hotéis, quartos, clientes e hospedagens. Os clientes podem se hospedar em quartos de hotéis diferentes, e é importante manter um registro das reservas/hospedagens.

O sistema deve conter as seguintes tabelas:
Tabela "Hotel":
hotel_id (Chave primária, INT): Identificador único do hotel.
nome (VARCHAR, não nulo): Nome do hotel.
cidade (VARCHAR, não nulo): Cidade onde o hotel está localizado.
uf (VARCHAR, não nulo): Estado onde o hotel está localizado, com dois dígitos.
classificacao (INT, não nulo): Classificação do hotel em estrelas (1 até 5).
Tabela "Quarto":
quarto_id (Chave primária, INT): Identificador único do quarto.
hotel_id (Chave estrangeira não nula para "Hotel"): Identificador do hotel ao qual o quarto pertence.
número (INT, não nulo): Número do quarto.
tipo (VARCHAR, não nulo): Tipo de quarto (por exemplo, "Standard", "Deluxe", "Suíte").
preco_diaria (DECIMAL, não nulo): Preço da diária do quarto.
Tabela "Cliente":
cliente_id (Chave primária, INT): Identificador único do cliente.
nome (VARCHAR, não nulo): Nome do cliente.
email (VARCHAR, não nulo e único): Endereço de e-mail do cliente.
telefone (VARCHAR, não nulo): Número de telefone do cliente.
cpf (VARCHAR, não nulo e único): Número de CPF do cliente.
Tabela "Hospedagem":
hospedagem_id (Chave primária, INT): Identificador único da hospedagem.
cliente_id (Chave estrangeira não nula para "Cliente"): Identificador do cliente que fez a reserva.
quarto_id (Chave estrangeira não nula para "Quarto"): Identificador do quarto reservado.
dt_checkin (DATE): Data de check-in da hospedagem (não nula).
dt_checkout (DATE): Data de check-out da hospedagem (não nula).
Valor_total_hosp(FLOAT, não nulo): Custo total da hospedagem, calculado quando a hospedagem é finalizada.
status_hosp (VARCHAR, não nulo): status_hosp da hospedagem, podendo receber os seguintes valores: “reserva”, reservado pelo cliente; “finalizada”, hospedagem concluida; “hospedado”, o cliente está atualmente hospedado no hotel; “cancelada”, a hospedagem (reserva) foi cancelada.

Para esta atividade mapa você deve criar código SQL, usando MySQL ou PostgreSQL:
1. Crie o esquema de banco de dados para o sistema de gerenciamento e hospedagens hoteleiras nomeado “hospedar_db”.

2. Crie as tabelas "Hotel", "Quarto", "Cliente" e "Hospedagem" com as colunas especificadas anteriormente.

3. Insira dados artificiais nas tabelas "Hotel" (2 hotéis), "Quarto"(5 para cada hotel), "Cliente"(3 clientes) e "Hospedagem" (20 hospedagens, 5 para cada um dos “Status_hosp”) para simular hotéis, quartos, clientes e hospedagens.

4. Escreva as seguintes consultas e comandos SQL:
a. Listar todos os hotéis e seus respectivos quartos, apresentando os seguintes campos: para hotel, nome e cidade; para quarto, tipo e preco_diaria;
b. ​Listar todos os clientes que já realizaram hospedagens (status_hosp igual á “finalizada”), e os respectivos quartos e hotéis;
c. ​Mostrar o histórico de hospedagens em ordem cronológica de um determinado cliente;
d. ​Apresentar o cliente com maior número de hospedagens (não importando o tempo em que ficou hospedado);
e. ​Apresentar clientes que tiveram hospedagem “cancelada”, os respectivos quartos e hotéis.
f. ​Calcular a receita de todos os hotéis (hospedagem com status_hosp igual a “finalizada”), ordenado de forma decrescente;
g. ​Listar todos os clientes que já fizeram uma reserva em um hotel específico;
h. ​Listar o quanto cada cliente que gastou em hospedagens (status_hosp igual a “finalizada”), em ordem decrescente por valor gasto.
i. ​Listar todos os quartos que ainda não receberam hóspedes.
j. ​Apresentar a média de preços de diárias em todos os hotéis, por tipos de quarto.
l. ​Criar a coluna checkin_realizado do tipo booleano na tabela Hospedagem (via código). E atribuir verdadeiro para as Hospedagens com status_hosp “finalizada” e “hospedado”, e como falso para Hospedagens com status_hosp “reserva” e “cancelada”.
m. ​Mudar o nome da coluna “classificacao” da tabela Hotel para “ratting” (via código).

5. Efetue a criação dos seguintes procedimentos usando PL/MySQL:
a. Criar uma procedure chamada "RegistrarCheckIn" que aceita hospedagem_id e data_checkin como parâmetros. A procedure deve atualizar a data de check-in na tabela "Hospedagem" e mudar o status_hosp para "hospedado".​
b. Criar uma procedure chamada "CalcularTotalHospedagem" que aceita hospedagem_id como parâmetro. A procedure deve calcular o valor total da hospedagem com base na diferença de dias entre check-in e check-out e o preço da diária do quarto reservado. O valor deve ser atualizado na coluna valor_total_hosp.​
c. Criar uma procedure chamada "RegistrarCheckout" que aceita hospedagem_id e data_checkout como parâmetros. A procedure deve atualizar a data de check-out na tabela "Hospedagem" e mudar o status_hosp para "finalizada".​

6. Efetue a criação das seguintes funções utilizando PL/MySQL:
a. Criar uma function chamada "TotalHospedagensHotel" que aceita hotel_id como parâmetro. A função deve retornar o número total de hospedagens realizadas em um determinado hotel.​
b. Criar uma function chamada "ValorMedioDiariasHotel" que aceita hotel_id como parâmetro. A função deve calcular e retornar o valor médio das diárias dos quartos deste hotel.
c. Criar uma function chamada "VerificarDisponibilidadeQuarto" que aceita quarto_id e data como parâmetros. A função deve retornar um valor booleano indicando se o quarto está disponível ou não para reserva na data especificada.​

7. Efetue a criação das seguintes triggers utilizando PL/MySQL:
a. Criar um trigger chamado "AntesDeInserirHospedagem" que é acionado antes de uma inserção na tabela "Hospedagem". O trigger deve verificar se o quarto está disponível na data de check-in. Se não estiver, a inserção deve ser cancelada.
b.Cria um trigger chamado "AposDeletarCliente" que é acionado após a exclusão de um cliente na tabela "Cliente". O trigger deve registrar a exclusão em uma tabela de log.​
