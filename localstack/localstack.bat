@echo off
aws --endpoint http://localhost:4566 --profile default ssm put-parameter --name "/config/spring-boot-localstack_default/helloWorld" --value "Hello World Parameter Store" --type String