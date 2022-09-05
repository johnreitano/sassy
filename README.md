# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- Local deployment:
  ```
  mkdir -p /tmp/sassy/pgdata
  docker run --name postgresql -e POSTGRES_USER=sassy -e POSTGRES_PASSWORD=sassy -p 6432:5432 -v /tmp/sassy/pgdata:/var/lib/postgresql/data -d postgres
  ```
