[![Build Status](https://travis-ci.org/ul2002/rails-rest-api.svg?branch=master)](https://travis-ci.org/ul2002/rails-rest-api)

# Rails Blog API

## Project Setup

**Install all gems**:

```console
$ bundle install
```

**Update the database with new data model**:

```console
$ rake db:migrate
```

**Feed the database with default seeds**:

```console
$ rake db:seed
```

**Start the web server on `http://localhost:3000/api/v1` by default**:

```console
$ rails server
```

**Run all RSpec tests and Rubocop**:

```console
$ rake test
```

## Usage

| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| POST | /register| Create a user|
| POST | /login   | Authenticate a user |
| GET | /users    | List all users|
## Use Case Examples

### Authentication

**Create a new user**:

```console
$ curl -X POST -H 'Content-type: application/json' -d '{"username": "john", "password": "testuser123"}' localhost:3000/api/v1/register
```

**Authenticate a user**:

```console
$ curl -X POST -H 'Content-type: application/json' -d '{"username": "john", "password": "testuser123"}' localhost:3000/api/v1/login
```

On successful login, `{"auth_token": <token>}` will be returned. This token will be expired after 24 hours.

### CRUD

