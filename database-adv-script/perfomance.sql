-- Initial Query: Retrieving all bookings, user details, property details, and payment details
SELECT b.booking_id, u.user_id, u.user_name, p.property_id, p.property_name, pay.payment_id, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- EXPLAIN ANALYZE: Analyze performance of the initial query to check for inefficiencies
EXPLAIN SELECT b.booking_id, u.user_id, u.user_name, p.property_id, p.property_name, pay.payment_id, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- Refactored Query: Optimized query with filters and indexing
SELECT b.booking_id, u.user_id, u.user_name, p.property_id, p.property_name, pay.payment_id, pay.amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date BETWEEN '2024-01-01' AND '2024-12-31'; -- Filter to reduce rows processed
