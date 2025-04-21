\connect energy_readings_db

-- Inserir clientes
INSERT INTO clients (uuid, client_name) VALUES
('e0d608a2-1a8d-4bf2-b363-7372d3f1bd3c', 'Alice Energia'),
('c38cb42e-a57d-4b3f-bb0f-6ef661609493', 'Bob Solar'),
('65c8322c-7a31-47d1-9e8b-741744336c9e', 'Carlos Volt'),
('35c76e68-0e3e-4336-ac8d-8b91a1197773', 'Diana Power'),
('abf01ba9-8b77-48da-8e2f-806e6537f0a5', 'Elena Watt'),
('46ebb242-6dc0-4905-9fa6-eaed593bc8c4', 'Felipe Luz'),
('b0a53c9a-053a-4b3d-83c2-f09b302073e6', 'Gustavo Ampere');

-- Inserir contratos
INSERT INTO contracts (uuid, client_uuid, time_stamp_contract, valid) VALUES
-- Alice Energia
('1a9aa87b-ca39-48c5-a341-96b91e8a8e70', 'e0d608a2-1a8d-4bf2-b363-7372d3f1bd3c', '2025-01-01', true),
('8cfa65ba-38a0-4b3d-91e3-fa69151c6e1b', 'e0d608a2-1a8d-4bf2-b363-7372d3f1bd3c', '2024-02-01', false),
-- Bob Solar
('1e324a82-5dc1-4944-8745-17404bc7f784', 'c38cb42e-a57d-4b3f-bb0f-6ef661609493', '2024-12-01', true),
('72413ce7-829f-48a7-a3fc-16d05986d96a', 'c38cb42e-a57d-4b3f-bb0f-6ef661609493', '2025-01-05', true),
-- Carlos Volt
('a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '65c8322c-7a31-47d1-9e8b-741744336c9e', '2024-09-03', true),
('97ffbf75-6634-4003-b2db-ec19cf65edab', '65c8322c-7a31-47d1-9e8b-741744336c9e', '2024-12-07', true),
-- clientes com 1 contrato
('33f76f33-6de4-4404-a221-2017b687bfab', '35c76e68-0e3e-4336-ac8d-8b91a1197773', '2024-05-20', true),
('c7baa459-db4a-48f1-afa3-cf8a43657927', 'abf01ba9-8b77-48da-8e2f-806e6537f0a5', '2024-08-15', true),
('1329347b-b77d-4af1-bf5f-c89db3b2c972', '46ebb242-6dc0-4905-9fa6-eaed593bc8c4', '2023-10-05', true),
('b98de044-3ec2-4b82-9e94-3f707157307e', 'b0a53c9a-053a-4b3d-83c2-f09b302073e6', '2024-03-01', true);

-- Inserir leituras para cada contrato
-- Alice Energia
INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('2278d52f-f2e6-4724-b98a-7dc23a0a4cc5', '1a9aa87b-ca39-48c5-a341-96b91e8a8e70', '2025-01-10', 120.4),
('72dc8450-06c6-4a98-955a-85caa9cf3e9d', '1a9aa87b-ca39-48c5-a341-96b91e8a8e70', '2025-02-10', 115.2),
('cefbbac5-a573-471d-ab58-1c0939466a75', '1a9aa87b-ca39-48c5-a341-96b91e8a8e70', '2025-03-10', 132.0),
('39e12076-f913-4bc3-879f-46bdeae4464b', '1a9aa87b-ca39-48c5-a341-96b91e8a8e70', '2025-04-10', 128.7);

-- Alice Energia contrato desativado
INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('790de656-cf71-4806-9c4a-0001b66cb806', '8cfa65ba-38a0-4b3d-91e3-fa69151c6e1b', '2024-02-10', 120.4),
('e33b037a-0ea5-4dd4-a1a1-b38c09fcda28', '8cfa65ba-38a0-4b3d-91e3-fa69151c6e1b', '2024-03-10', 115.2),
('c0f3aab6-9f16-4dbb-956d-4bd78a56417b', '8cfa65ba-38a0-4b3d-91e3-fa69151c6e1b', '2024-04-10', 132.0),
('c558ae93-7849-4104-bb75-4f31c3b5b7df', '8cfa65ba-38a0-4b3d-91e3-fa69151c6e1b', '2024-05-10', 128.7);

-- Bob Solar
INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('98717da5-ad26-4a62-a59f-426e758551ea', '1e324a82-5dc1-4944-8745-17404bc7f784', '2024-12-25', 98.1),
('05c910a6-0908-4d1c-a369-6326fa1f9368', '1e324a82-5dc1-4944-8745-17404bc7f784', '2025-01-25', 102.4),
('003a1c9d-ca36-4f97-93e6-74d6a4f16245', '1e324a82-5dc1-4944-8745-17404bc7f784', '2025-02-25', 97.6),
('eefbbe15-345b-4886-b4c0-9386213191a0', '1e324a82-5dc1-4944-8745-17404bc7f784', '2025-03-25', 105.0);

-- Bob Solar
INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('ad46cbf0-84bb-4093-95d2-4792175a5435', '72413ce7-829f-48a7-a3fc-16d05986d96a', '2025-01-17', 104.4),
('6f48b7b1-2008-49a9-9735-202a92491331', '72413ce7-829f-48a7-a3fc-16d05986d96a', '2025-02-17', 110.2),
('c94227c0-3324-4a34-a48f-d316a234cfbf', '72413ce7-829f-48a7-a3fc-16d05986d96a', '2025-03-17', 97.7),
('f77614c3-0a9e-4234-abe3-96a3c903a9c1', '72413ce7-829f-48a7-a3fc-16d05986d96a', '2025-04-17', 106.9);

-- Carlos Volt
INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('51ba60ff-f6c6-4dec-a99f-b4b6f32fb995', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2024-09-12', 91.4),
('bdad1e17-60ac-4a2b-b412-8447a38e703d', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2024-10-12', 94.2),
('80036f02-ff9d-4c37-853f-b149712f6abf', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2024-11-12', 96.7),
('14fcb1d0-728b-4807-a2ee-9e854cbb8e33', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2024-12-12', 99.8),
('58d4b182-d72c-437b-b40d-dbbd7cb828e6', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2025-01-12', 87.1),
('c6bfcb97-39eb-43f6-919d-86d8d532545e', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2025-02-12', 90.6),
('e0c7e611-b7fd-4904-a089-62fd6f62b01f', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2025-03-12', 95.5),
('6d87afd5-ddff-4c9d-90fe-a4844aaa8986', 'a4eb12f4-35bc-4f5b-abee-aec2d4b35a8b', '2025-04-12', 93.3);

INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('0201c4c4-7545-418b-b915-d7b6402cc239', '97ffbf75-6634-4003-b2db-ec19cf65edab', '2025-01-12', 98.7),
('4dd8e3c1-605c-4092-b6ff-e1ebfb668a53', '97ffbf75-6634-4003-b2db-ec19cf65edab', '2025-02-12', 101.3),
('f755b847-6b53-4f29-83b0-933f7cb71fea', '97ffbf75-6634-4003-b2db-ec19cf65edab', '2025-03-12', 99.5),
('ffc326ca-c38f-4724-974b-e9656ca92f88', '97ffbf75-6634-4003-b2db-ec19cf65edab', '2025-04-12', 103.1);

-- Clientes com 1 contrato
INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('a68dc0ba-6f32-410f-b122-61d2fe10bb78', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-06-12', 93.5),
('22ef558a-c6a1-48b9-94fb-6d45be651717', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-07-12', 91.8),
('df7bb285-2472-4454-a283-34ecfbd85002', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-08-12', 94.1),
('2b097bdf-878e-40e7-bfdf-569f8ff55f12', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-09-12', 96.3),
('b26e5f6b-4880-4dac-bf81-eb83987b444f', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-10-12', 92.7),
('cd65724e-ca95-404e-aca6-4cdd8b4f9854', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-11-12', 89.4),
('4dde719d-51e4-4c1b-b5f8-a5f325652761', '33f76f33-6de4-4404-a221-2017b687bfab', '2024-12-12', 95.2),
('d19baa71-c4f0-4382-86ae-46859e3fe7d2', '33f76f33-6de4-4404-a221-2017b687bfab', '2025-01-12', 97.6),
('919a6bc1-38c2-4b26-9934-6cfac7d217ad', '33f76f33-6de4-4404-a221-2017b687bfab', '2025-02-12', 90.9),
('5e4ccaa3-a93e-4f94-890c-225d1a0d6962', '33f76f33-6de4-4404-a221-2017b687bfab', '2025-03-12', 88.7),
('7b4cfc91-5929-4812-aac1-ffb9cd4abfed', '33f76f33-6de4-4404-a221-2017b687bfab', '2025-04-12', 91.3);

INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('93d116de-c9f8-4ef4-8dfa-3fa9d52015eb', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2024-09-09', 87.4),
('1c722a40-954e-4ac6-a339-2aaf2c3cfa4d', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2024-10-09', 90.2),
('79793d9a-64c8-456f-9c35-d6bebbf7f057', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2024-11-09', 85.9),
('7890027c-d7ea-402e-94f3-44f89b26cfe7', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2024-12-09', 89.6),
('50026b70-3c97-4cdf-950d-7c043ba5e4c7', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2025-01-09', 92.1),
('a903c32a-737b-45e9-a9a0-786befcb0171', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2025-02-09', 88.3),
('160f8d06-d84b-4fa8-b21b-5feb86f87d38', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2025-03-09', 91.7),
('92687cd1-63d3-4246-92f9-6c8e3cb208e7', 'c7baa459-db4a-48f1-afa3-cf8a43657927', '2025-04-09', 90.5);

INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('a03c42b5-441d-4cab-ad3c-091f0e11c719', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2023-11-13', 93.5),
('b39a8391-7187-4167-a9a7-ef2a7e14fc5b', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2023-12-13', 89.2),
('180e969a-34ce-4b95-994a-4c948a35d83d', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-01-13', 91.6),
('c91ae559-addb-4c4c-a1d9-993578ef3e23', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-02-13', 87.9),
('54c48578-9327-4daa-80f4-e379d98978f6', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-03-13', 94.1),
('9e4ab510-8807-4471-bb0b-869d7de795c3', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-04-13', 90.0),
('9e36e93a-34fe-4105-a3fd-32e93dd63b1c', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-05-13', 92.3),
('80c96d70-d4af-4b63-8bf4-23c8e9f79dde', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-06-13', 88.7),
('d0460ae7-99f5-443a-a948-8067bd3b03cc', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-07-13', 90.9),
('b7d9764b-4e37-4f32-91a6-1a3abd04940e', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-08-13', 91.4),
('3ff30910-f6c1-4c6a-9e1a-4d11ddb9680c', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-09-13', 89.6),
('e68f0c1e-11ec-42e4-945c-7108a4c811fa', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-10-13', 92.0),
('ee406c5b-e5a1-4e25-b2c3-6f44b0926896', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-11-13', 87.3),
('44bdef23-79dc-4cd1-b6d0-bc0c25dd89e0', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2024-12-13', 90.5),
('75befd2b-3ba5-4d52-a8b1-b57474014b85', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2025-01-13', 93.0),
('f25fed85-42be-48d1-a466-2b72e38f66ca', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2025-02-13', 51.1),
('d99127b8-536f-4cf9-b0f1-2c1f4f7ed0c7', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2025-03-13', 54.9),
('dcc14e10-794a-4705-996d-7a863cb20534', '1329347b-b77d-4af1-bf5f-c89db3b2c972', '2025-04-13', 56.7);

INSERT INTO energy_readings (uuid, contract_uuid, time_stamp_read, energy_usage) VALUES
('b9fed606-3039-4bf8-9e34-2c30ca39619c', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-03-13', 127.4),
('0a404cb8-5627-481e-a708-a5e3cf8861aa', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-04-13', 122.1),
('8e002a5b-5ff0-4cd2-9eed-b595c2b0efb9', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-05-13', 128.7),
('a6d4ee05-86c1-4fde-8cff-f389c6a3a72c', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-06-13', 121.3),
('97b3d446-2b90-4d7c-873e-6aaa4daebc22', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-07-13', 129.1),
('2d40a0ad-faef-487e-9ac6-fb2e47b53532', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-08-13', 124.8),
('dcc08541-20c7-4708-8f5b-43f1cfd11710', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-09-13', 126.0),
('b04257ab-cc1f-49ff-889c-1d7c97769984', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-10-13', 123.9),
('4d91858f-38ce-4174-9ea9-65fe9f0df330', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-11-13', 125.7),
('db9e6ad1-7c35-4a6b-998b-00057f444253', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2024-12-13', 122.6),
('96b12a4b-55be-4be4-afaa-c017428fc16a', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2025-01-13', 240.9),
('48c2d98a-305f-4014-a3e5-10ad5a7f3a11', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2025-02-13', 250.2),
('fd9116bc-66d9-4eff-9621-8bb61f37242d', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2025-03-13', 243.4),
('2c3bcdf6-c142-4ab8-bd24-2e31f250cf62', 'b98de044-3ec2-4b82-9e94-3f707157307e', '2025-04-13', 246.8);
