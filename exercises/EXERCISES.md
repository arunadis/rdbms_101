
# Exercises

#### Exercise 1:

Examine the schema carefully and suggest ways of further optimizing the following query. You might have to question the use-cases of running this query.

```sql
SELECT * FROM STORE S LIMIT 100;
```

#### Exercise 2:

The following query has many issues. 

- Re-write the query in a way that utilizes the DB resources optimally. 
- Index the DB to optimize the data access. 
- Calculate the approximate amount of disk seeks that the DB engine has to do to fulfill the result before and after optimizing the query. 

```sql
SELECT SUM(TOTAL) AS 'TOTAL_SALE' 
FROM TRANSACTIONS 
WHERE STORE_ID = 10058794 
  AND YEAR(FROM_UNIXTIME(CREATED_TIME/1000)) = 2019;
```

#### Exercise 3:

Re-write the query in a way that utilizes the DB resources optimally.

```sql
SELECT ID,
    NAME,
    getStoreSettings(S.ID, 'order.delivery') AS 'ORDER_DELIVERY'
FROM STORE S WHERE CREATED_TIME > 1559327400000;
```

