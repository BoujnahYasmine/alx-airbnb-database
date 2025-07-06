-- 1. Query using INNER JOIN to retrieve all bookings and the respective users who made those bookings

SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.user_name
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id;

-- Explanation:
-- The INNER JOIN ensures that only bookings with associated users are returned. 
-- If a booking doesn't have a corresponding user, it will not appear in the result.

-- 2. Query using LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews

SELECT 
    p.property_id,
    p.property_name,
    r.review_id,
    r.review_text
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id;

-- Explanation:
-- The LEFT JOIN ensures that all properties are included, even if they have no reviews. 
-- For properties without reviews, NULL values will be returned for review_id and review_text.

-- 3. Query using FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

SELECT 
    u.user_id,
    u.user_name,
    b.booking_id,
    b.booking_date
FROM 
    users u
FULL OUTER JOIN 
    bookings b ON u.user_id = b.user_id;

-- Explanation:
-- The FULL OUTER JOIN returns all users and all bookings. If there is no matching record in one of the tables, NULL values will be returned.
-- This ensures that no data is omitted from either the users or bookings tables.
