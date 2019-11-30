# select-random-row-in-sql

## Select random row in SQL

### MySQL

```sql
SELECT column FROM table
ORDER BY RAND()
LIMIT 1
```

### PostgreSQL

```sql
SELECT column FROM table
ORDER BY RANDOM()
LIMIT 1
```

## References

* [https://stackoverflow.com/questions/580639/how-to-randomly-select-rows-in-sql](https://stackoverflow.com/questions/580639/how-to-randomly-select-rows-in-sql)

