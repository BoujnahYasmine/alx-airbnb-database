# Index Creation for Performance Optimization

## Objective

The goal of this task is to improve query performance by creating indexes on high-usage columns in the `User`, `Booking`, and `Property` tables. These columns are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

### Steps:
1. Identify high-usage columns in the `User`, `Booking`, and `Property` tables.
2. Create indexes for these columns.
3. Measure the query performance before and after adding indexes using `EXPLAIN` or `ANALYZE`.

---

## 1. High-Usage Columns

After analyzing typical queries used in the application, I identified the following columns that are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses:

### User Table
- `user_id`: Primary key, often used in `JOIN` clauses.
- `email`: Frequently used in `WHERE` clauses for lookups.
- `role_id`: Used for filtering or grouping users by their role.

### Booking Table
- `booking_id`: Primary key, frequently used in `JOIN` and `WHERE` clauses.
- `user_id`: Foreign key, often used in `JOIN` clauses to link users to their bookings.
- `property_id`: Foreign key, used in `JOIN` clauses to link properties to their bookings.
- `status_id`: Frequently used for filtering bookings based on their status.
- `start_date` and `end_date`: Often used in `WHERE` clauses for range filtering.

### Property Table
- `property_id`: Primary key, used in `JOIN` clauses.
- `host_id`: Foreign key, used in `JOIN` clauses to link properties to users.
- `location_id`: Foreign key, used in `JOIN` clauses to link properties to their location.
- `pricepernight`: Often used in `ORDER BY` or range filtering (`WHERE`).

---

## 2. Index Creation

Based on the identified high-usage columns, I will create the following indexes to optimize query performance.

### SQL Commands for Index Creation

```sql
-- Creating an index on the user_id column in the User table (already indexed as PRIMARY KEY)
CREATE INDEX idx_user_email ON User(email);

-- Creating an index on the role_id column in the User table for faster filtering
CREATE INDEX idx_user_role_id ON User(role_id);

-- Creating an index on the user_id column in the Booking table for faster JOIN operations
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Creating an index on the property_id column in the Booking table for faster JOIN operations
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Creating an index on the status_id column in the Booking table for faster filtering
CREATE INDEX idx_booking_status_id ON Booking(status_id);

-- Creating an index on the start_date column in the Booking table for date range queries
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Creating an index on the property_id column in the Property table for faster JOIN operations
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Creating an index on the host_id column in the Property table for faster filtering by host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Creating an index on the location_id column in the Property table for faster location filtering
CREATE INDEX idx_property_location_id ON Property(location_id);

-- Creating an index on the pricepernight column in the Property table for price-based filtering or sorting
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
```

---

## 3. Measuring Query Performance

Before adding indexes, we can measure the query performance using `EXPLAIN` to analyze the execution plan of a query.

### Example of Query Performance Before Indexing

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
```

This command will return the query execution plan, showing how MySQL plans to execute the query without any indexes.

### Example of Query Performance After Indexing

After creating the necessary indexes, we can run the same query again to observe the performance improvement.

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
```

After adding indexes, MySQL should use the created indexes, and we should see a more efficient execution plan. The key indicators to look for include a decrease in the number of rows scanned and a reduction in the query execution time.

---

## Conclusion

By creating indexes on high-usage columns, we expect a significant improvement in query performance, especially for queries involving `JOIN` operations and filtering. The `EXPLAIN` command will help us compare the query performance before and after adding indexes to ensure the optimizations are effective.

---
