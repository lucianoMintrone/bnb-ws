# Book BNB - WS

## Requirements

- _Docker_

## Set up project

```sh
git clone git@gitlab.com:bookbnb/book-bnb-ws.git
cd book-bnb-ws
docker-compose build
docker-compose up
```

## Run Migrations

To run the migrations you must execute the next command:

```sh
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

## Run Seed

To run the seeds you must execute the next command:

```sh
docker-compose run web rails db:seed
```

## Start Server

In order to start the server on http://localhost:3000/ you will need to run:

```sh
docker-compose up
```

## Use Console

```sh
docker-compose run web rails c
```

## Deploy

```sh
docker-compose build
heroku login
heroku container:login
heroku container:push web -a intense-springs-34933
heroku container:release web -a intense-springs-34933
heroku run rake db:migrate -a intense-springs-34933
```

## Run seeds in the server
```sh
heroku run rake db:seed -a intense-springs-34933
```

## Run console in the server
```sh
heroku run rails c -a intense-springs-34933
```

[4]:https://gitlab.com/bookbnb/book-bnb-ws
