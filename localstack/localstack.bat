@echo off

echo ### Criando Segredos no AWS Secret Manager do LocalStack...
aws --endpoint http://localhost:4566 --profile default secretsmanager create-secret --name /secret/spring-boot-localstack_default --description "Exemplo de Secrets Manager" --secret-string "{\"valor1\":\"Oi Mundo\",\"valor2\":\"Hello World\",\"valor3\":\"Hola Mundo\"}"
aws --endpoint http://localhost:4566 --profile default secretsmanager create-secret --name /secret/spring-boot-localstack --description "Exemplo de Secrets Manager" --secret-string "{\"valor1\":\"Oi Mundo\",\"valor2\":\"Hello World\",\"valor3\":\"Hola Mundo\"}"
aws --endpoint http://localhost:4566 --profile default secretsmanager create-secret --name /secret/application --description "Exemplo de Secrets Manager" --secret-string "{\"valor1\":\"Oi Mundo\",\"valor2\":\"Hello World\",\"valor3\":\"Hola Mundo\"}"
aws --endpoint http://localhost:4566 --profile default secretsmanager create-secret --name /secret/application_default --description "Exemplo de Secrets Manager" --secret-string "{\"valor1\":\"Oi Mundo\",\"valor2\":\"Hello World\",\"valor3\":\"Hola Mundo\"}"

echo ### Criando Chaves no AWS Parameter Store do LocalStack...
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/helloWorld" --value "Hello World Parameter Store" --type String
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/sqsQueueName" --value "sqsHelloWorld" --type String
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/snsNotificationName" --value "snsHelloWorld" --type String
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/s3Bucket" --value "s3-helloworld" --type String
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/dbUrl" --value "jdbc:mysql://localhost:3306/databasedemo?createDatabaseIfNotExist=true" --type String
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/dbUser" --value "admin" --type String
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/dbPass" --value "admin123456789" --type String



echo ### Criando Bucket no S3 do LocalStack...
aws --endpoint http://localhost:4566 --profile default s3 mb s3://s3-helloworld

echo ### Criando Queue(Standard) no SQS do LocalStack...
aws --endpoint http://localhost:4566 --profile default sqs create-queue --queue-name sqsHelloWorld
aws --endpoint http://localhost:4566 --profile default sqs send-message --queue-url http://localhost:4566/000000000000/sqsHelloWorld --message-body "Hello World SQS!!!" --delay-seconds 1
aws --endpoint http://localhost:4566 --profile default sqs receive-message --queue-url http://localhost:4566/000000000000/sqsHelloWorld

