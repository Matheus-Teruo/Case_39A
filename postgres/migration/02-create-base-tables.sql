-- 02-create-base-tables.sql

\connect energy_readings_db

--  Table for clients
-- tabela de clientes com a chave e nome unico
CREATE TABLE clients (
    uuid UUID PRIMARY KEY,
    client_name VARCHAR(255) UNIQUE NOT NULL
);

--  Table for contracts
-- tabela de contratos com chave, a realção com a chave para identificar a que cliente pertence,
-- o tempo que ela o carimbo de momento de criação do contrato
-- e verificação se o contrato está ativo.
CREATE TABLE contracts (
    uuid UUID PRIMARY KEY,
    client_uuid UUID NOT NULL,
    time_stamp_contract TIMESTAMP UNIQUE NOT NULL,
    valid BOOLEAN NOT NULL,
    FOREIGN KEY (client_uuid) REFERENCES clients(uuid)
);

--  Table for energy_readings
-- tabela de leitura de energia com a chave, a relação com o contrato pertencente,
-- o tempo do momento da medição (ou cadastro da leitura) e o valor de consumo.
CREATE TABLE energy_readings (
    uuid UUID PRIMARY KEY,
    contract_uuid UUID NOT NULL,
    time_stamp_read TIMESTAMP NOT NULL,
    energy_usage DOUBLE PRECISION NOT NULL,
    FOREIGN KEY (contract_uuid) REFERENCES contracts(uuid)
);

-- as chaves foram escolhidas em uuid por ser o padrão do postgres e por questões de segurança