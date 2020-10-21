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

## Start Server

In order to start the server on http://localhost:3000/ you will need to run:

```sh
docker-compose up
```

## Use Console

```sh
docker-compose run web rails c
```

[4]:https://gitlab.com/bookbnb/book-bnb-ws
