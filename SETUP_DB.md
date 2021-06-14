
# Setting up the database

**NOTE:**

The database schema and the data files were generated from MySql 8. Therefore, you may find some incompatibilities if you try to restore the DB with older versions of MySql

**Prerequisits: MySql 8**

### Database Schema

![](https://github.com/arunadis/rdbms_fundamentals/blob/main/schema/store_schema.png)


### Installing the DB

### Step 1:

Clone the repository and cd to the root directory. 

    $ git clone https://github.com/arunadis/rdbms_fundamentals.git
    $ cd rdbms_fundamentals.git

### Step 2:

Log into the MysSql console.

    $ mysql -u<user_name> -p<password>

Create a database named `STORE`

	mysq> CREATE DATABASE STORE;

#### Step 3: 

Switcht the the `STORE` db.

	mysql> USE STORE;

Source the schema.

	mysql> SOURCE ./schema/store_schema.sql;

Source the functions.

	mysql> SOURCE ./schema/custom_functions.sql;

#### Step 4: 

Unzipt the` data/store_data.sql.zip`

	mysql> SOURCE ./data/store_data.sql;
