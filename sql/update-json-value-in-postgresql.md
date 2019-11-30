# update-json-value-in-postgresql

## Update JSON value in PostgreSQL

```sql
UPDATE test SET data = jsonb_set(data, '{name}', '"my-other-name"') WHERE id = 123;
```

## References

* \*\*\*\*[**How to perform update operations on columns of type JSONB in Postgres 9.4 \| StackOverflow**](https://stackoverflow.com/questions/26703476/how-to-perform-update-operations-on-columns-of-type-jsonb-in-postgres-9-4) ****

