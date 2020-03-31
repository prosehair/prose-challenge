# Prose Challenge

## Objectives

- Design a database schema to store Salon informations
- Parse documents and load data in the database schema
- Build a Restful API to expose this data with Django Restframework


## Details

The `data` folder contains all the documents you'll need to parse and inject into a database.  

- A list of beauty salons with their respective provided services (eg. haircut, hair color, ...).
- A list of providers (people working for these salons) and what services they can provide.
- A list of location from where these providers work

The design of the database should be as clean as possible, following best practices as closely as possible.  
It doesn't necessarily need to match the documents structure.

> Data files has been truncated to 10-20K lines only. There will be orphaned records.

A barebone Django skeleton is provided, just a basic setup to get you started, really.

The app should expose at least the following endpoints:

- **Salons list**: fetch salons.
  This endpoint should allow some basic filtering (eg. salon's name).
- **Salon detail**: fetch a salon and all its details by id
- **Salon services**: a list of services provided by the salon


> The dataset contains lots of interesting data. Please be as creative as you'd like! :)


## Environment

Docker images are provided, with some tools and a basic app to get you started.

> You'll need a running Docker services for this environment to work.  
> Installation instruction here: <https://store.docker.com/search?offering=community&type=edition>  
> You're free to setup your own environment, of course: you'll need a Postgres server and Python 3.

2 Docker containers:

- **app**: a python interpreter serving the application on port 8000
- **db**: a postgresql server listening on port 5432, with a default empty `prose-challenge` database.

> The database doesn't expose its port to the host machine, so Postgres isn't accessible directly.
> Export the port from `docker-compose.yml` if you need to.

A simple Django RestFramework app skeleton is provided in the `prose` package with a `core` app.  
Feel free to replace it as you see fit!

> Test the app with `http://localhost:8000/`. It should reply with a default Django page.

Useful commands:

* Create a local virtual env with project dependencies (useful for code completion:  
  `make init`  (you'll need a local Python 3)
* Run the container and get a shell into it:
  `make shell`
* List all available commands
  `make help`
* From the container shell, launch the app:
  `./manage.py runserver 0.0.0.0:8000`
* From the container shell, connect to the database:
  `psql`


## Configuration

If you need to further configure your application, use environment variables:

* Declare your variables in docker-compose.yml
* Stop/Start the app, as shown above


## Libraries

If you need some additional dependencies, add them to the `requirements.txt` file.  
You'll need to rebuild the Docker container to install them: `docker-compose up --build`


## Questions?

We're available to help you succeed this challenge anytime: <nicolas@prose.com>
