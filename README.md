
# Introduction

Almost all the enterprise software that we develop generates some sort of data and ultimately those are being stored in a database. In the majority of cases, it will be a relational database. 

Database again a piece of software specially designed for efficient data access. Though it is specially designed, it is also constrained by the general limitations that our applications face such as hardware I/O limitations and network bandwidth limitations.

But, if we look at some of the queries that we have written and some of the database designs that are available in our systems, it is fair to assume that many of us think that databases are capable of retrieving the data that we want in some magical way. Unfortunately, that is not true.

The main objective of this exercise is to give a basic understanding of some of the core concepts that RDBMS commonly uses and apply that knowledge to model the database and effectively query the data. 


## Let's Get Started.

First, you need a database to start with. Either you can use the docker container, or use the instructions given[ here ](https://github.com/arunadis/rdbms_fundamentals/blob/main/SETUP_DB.md " here ")to set up the sample database if already have a MySql installation. We use MySql 8 here

### Running in a docker Container. 

```
docker run --name rdbms101 -p 3307:3306 arunadis/rdbms_fundementals:latest
```
Then use any database client application, or MySql command line client to access the database. 

```
mysql -uroot -P3307 -h127.0.0.1 -prdbms101 STORE
```

If you don't have a database client, you can connect to the container and access the database 

```
docker exec -it rdbms101 bash
mysql -uroot -prdbms101 STORE
```

This is the schema that we are going to work with.

![](https://github.com/arunadis/rdbms_fundamentals/blob/main/schema/store_schema.png)

Then, let's learn some basics about how databases work. Just follow [this presentation](https://github.com/arunadis/rdbms_fundamentals/blob/main/presentations/RDBMS_Fundamentals.pptx "this presentation").

Let's try to optimize some queries without looking at the answers. See whether you can optimize the queries given [here](https://github.com/arunadis/rdbms_fundamentals/blob/main/exercises/EXERCISES.md "here") without any help. Please use commands like `EXPLAIN` and tools like `PROFILING` to see what's happening there. 

Finally, you can check your answers with the detailed explanations given here [will update soon]
