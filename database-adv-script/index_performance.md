# Index Performance Optimization Report

## Objective
The goal of this task was to identify high-usage columns in the `User`, `Booking`, and `Property` tables and create appropriate indexes to optimize query performance. We then compared the query execution times before and after the indexes were applied to assess their impact.

## Identifying High-Usage Columns
High-usage columns are those frequently involved in filtering (`WHERE`), joining (`JOIN`), or sorting (`ORDER BY`) operations. Based on query patterns and common database operations, the following columns were identified as candidates for indexing:

### **User Table**
- `user_id` – Frequently used in `WHERE` clauses to filter user records.
- `email` – Often used in searches and filters.
- `date_joined` – Used in sorting or filtering users by their registration date.

### **Booking Table**
- `user_id` – Used in `JOIN` operations to link bookings to users.
- `property_id` – Used in `JOIN` operations to link bookings to properties.
- `booking_date` – Used in filtering and sorting bookings by date.

### **Property Table**
- `property_id` – Used in `JOIN` operations to link properties to bookings.
- `location` – Used for searching and filtering properties based on location.
- `price` – Frequently used for filtering properties based on price ranges.

## Created Indexes
To optimize query performance, the following indexes were created on the identified columns:

### **Indexes on the User Table**
```sql
CREATE INDEX idx_user_id ON User(user_id);  -- For faster lookup by user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);  -- For faster JOINs between Booking and User tables
CREATE INDEX idx_booking_property_id ON Booking(property_id);  -- For faster JOINs between Booking and Property tables
CREATE INDEX idx_booking_date ON Booking(booking_date);  -- For faster date range queries on booking_date
CREATE INDEX idx_property_location ON Property(location);  -- For faster filtering by location
CREATE INDEX idx_property_price_location ON Property(price, location);  -- For optimized filtering and sorting by price and location
