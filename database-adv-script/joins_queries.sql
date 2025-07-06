-- INNER JOIN: Retrieve all bookings and the respective users
SELECT b.id AS booking_id, u.id AS user_id, u.name, b.start_date, b.end_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Retrieve all properties and their reviews (including properties with no reviews)
SELECT p.id AS property_id, p.name, r.id AS review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: Retrieve all users and bookings (use UNION of LEFT and RIGHT JOIN for MySQL)
SELECT u.id AS user_id, b.id AS booking_id, u.name, b.start_date
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, b.id AS booking_id, u.name, b.start_date
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;