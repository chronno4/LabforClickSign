# Lab for ClickSign
Lab for ClickSign


## Documentação

O projeto foi baseado na seguinte estrutura:

Branch Main para develop e TAG com o prefixo "v" para aplicação e "iac-v" para iac em produção

[terraform](https://github.com/chronno4/LabforClickSign/blob/main/iac/README.md)

## Explicação

```bash
1- Realizar o clone do repo, após a alteração ou novo desenvolvimento em front-end ou back-end realizar um push para a branch Main.
```

```bash
2- Após a alteração a pipeline irá Buildar, fazer o Push da imagem Docker no AWS ECR e Deployar na infra para o ambiente de desenvolvimento.
```

```bash
3- O deploy no ambiente é realizar atravez de uma alteração no arquivo variables.tf, o valor de versão é trocado por uma nova.
```

```bash
4- Assim que o valor é alterado, inicia a pipeline para a subida da nova versão no ambiente.
```

```bash
5- No ambiente de produção, é necessário criar uma tag para a aplicação com o prefixo "v" exemplo: v1.0.0.
```

```bash
6- Criado a tag para o app, a pipeline irá  rá Buildar, fazer o Push da imagem Docker no AWS ECR e Deployar na infra para o ambiente de produção.
```

```bash
7- A subida no ambiente de produção irá iniciar automaticamente. A pipeline irá criar uma TAG "iac-v" baseado na versão do app, exemplo: iac-v1.0.0
```

```bash
8- Deploy em dev e prd realizado!!!
```

## Comunicação entre os micro serviços
Ambos os ms contém ALB, porém somente o front-end é aberto para a internet, o ALB de back-end está aberto somente para a rede interna. Front-end se conecta a porta 3000 do ALB de back-end.
