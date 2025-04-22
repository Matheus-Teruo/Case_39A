# Case analise de clientes de serviço de energia

## Estrutura do Projeto

├── n8n/
│ ├── workflows/
│ ├── postman_collection.json
├── postgres/
│ ├── migrations/
│ └── dummy-corpus/ 
├── docker-compose.yml (PostgreSQL + n8n)
├── .env.sample # Exemplo de variáveis de ambiente


## Testando os Workflows

Configurar o um arquivo `.env` com base no arquivo `.env.sample`

Dentro do n8n, as credenciais devem estar de acordo com as do arquivo `.env`. Porem banco de dados utilizado é o `energy_readings_db`, onde ficam os dados do projeto.

Por questão de praticidade, não foi criado outro usuário além do admin no banco de dados; porém, para um projeto em produção, seria ideal utilizar um usuário diferente.

Subir os containers com o seguinte comando
```bash
docker-compose up -d
```

Os workflows estão disponíveis em arquivos .json na pasta n8n/workflows e podem ser importados diretamente pela interface do n8n.

os workflows são os seguintes:

1. Carregamento do Corpus Dummy
Responsável por popular o banco com dados fictícios para teste.
Alternativamente, você também pode executar os scripts SQL manualmente via pgAdmin ou outro cliente PostgreSQL.

2. Workflow Principal do Case
Recebe um JSON contendo os dados de entrada e executa todo o fluxo de análise de consumo energético.

#### Como testar

Você pode testar o funcionamento de duas formas:

- Usando o Postman, com a collection disponível na pasta n8n/.

- Via terminal, usando o comando curl:
```bash
curl -X GET http://localhost:5678/webhook-test/clients-average-energy-usage
```

### Lógica de Cálculo de Outliers

O cálculo dos outliers é realizado com base nas últimas leituras de consumo de energia dos contratos ativos. O fluxo é:

1. Realizar uma consulta no banco para obter os clientes com contratos válidos.

2. Para cada contrato, buscar as 3 leituras de energia mais recentes.

3. Calcular a média de consumo e o desvio padrão em relação aos outros clientes**. 

4. Qualquer valor que esteja fora de dois desvios padrão da média é considerado um outlier*.


nota*: Foi calculada uma média com base nos valores dos contratos que o cliente possui, pois como o status de outlier era atribuído ao cliente, não seria coerente calcular a média por contrato. Embora essa abordagem também possa fazer sentido, caso um contrato resultasse como outlier mas o cliente, no geral, não, as informações poderiam ficar destoantes — com um cliente sinalizado como outlier, mas com uma média dentro do padrão.

nota**: Poderia ser calculado o desvio entre os 3 últimos meses do contrato, para verificar leituras outliers; porém, não achei que fosse esse o caso, mas o código pode ser facilmente modificado para isso.
