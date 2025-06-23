-- Sample Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
    ('a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 'Moses', '	Kyle', 'moseskyle@gmail.com', 'hashed_password_1', '1234567890', 'guest'),
    ('b1f7a87d-7549-4b97-bfe4-e881ca2f0fa7', 'James', 'Mwia', 'jamesmwia@gmail.com', 'hashed_password_2', '0987654321', 'host'),
    ('c9be2297-d9b2-44e3-85db-c35c77d9e14b', 'Kerry', 'Maze', 'kerrymaze@gmail.com', 'hashed_password_3', '1122334455', 'admin');

-- Sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
    ('d2a3f4c5-e2d9-4641-b8e5-61ffdb1045a6', 'b1f7a87d-7549-4b97-bfe4-e881ca2f0fa7', 'Sunny Beach House', 'A beautiful beach house with ocean view', 'Miami, FL', 250.00),
    ('e1c3d8b0-bd3f-4325-b96c-5d64c3f1f56d', 'b1f7a87d-7549-4b97-bfe4-e881ca2f0fa7', 'Mountain View Cabin', 'A cozy cabin in the mountains', 'Aspen, CO', 300.00),
    ('f3d1c5e2-a1e9-4e1f-b122-d2d3f674d4db', 'b1f7a87d-7549-4b97-bfe4-e881ca2f:0fa7', 'Urban Loft', 'Modern loft in the city center', 'New York, NY', 200.00);

-- Sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
    ('g3a1d2e9-bfbf-49f4-b65f-cdb34d2d2251', 'd2a3f4c5-e2d9-4641-b8e5-61ffdb1045a6', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', '2024-12-10', '2024-12-15', 1250.00, 'confirmed'),
    ('h3e1d3b2-b68b-4f92-b6a4-5f0b58e1ccfe', 'e1c3d8b0-bd3f-4325-b96c-5d64c3f1f56d', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', '2024-12-20', '2024-12-25', 1500.00, 'pending'),
    ('i9d2f8a0-c2d9-43da-b8fa-5b46c3d4a67d', 'f3d1c5e2-a1e9-4e1f-b122-d2d3f674d4db', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', '2024-12-01', '2024-12-05', 1000.00, 'canceled');

-- Sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
    ('j7d3e6f5-a2d0-43ea-a2db-7db389cb41fd', 'g3a1d2e9-bfbf-49f4-b65f-cdb34d2d2251', 1250.00, 'credit_card'),
    ('k2e1f4d5-b8d3-42ca-b7a7-1cf2a1e90d6b', 'h3e1d3b2-b68b-4f92-b6a4-5f0b58e1ccfe', 1500.00, 'paypal'),
    ('l9f4c2d0-dfd1-4335-b13d-8d5a4b0b0c4c', 'i9d2f8a0-c2d9-43da-b8fa-5b46c3d4a67d', 1000.00, 'stripe');

-- Sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
    ('m8c9e6f1-bd6e-4e92-9465-e3f7de053add', 'd2a3f4c5-e2d9-4641-b8e5-61ffdb1045a6', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 5, 'Great place! Amazing view and clean house.'),
    ('n2f1b3c9-b80a-4022-94df-3a33c9f5e315', 'e1c3d8b0-bd3f-4325-b96c-5d64c3f1f56d', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 4, 'Nice cabin, but a bit far from the ski resort.'),
    ('o7d2e5c0-cdc2-4f31-a080-8e7583df3922', 'f3d1c5e2-a1e9-4e1f-b122-d2d3f674d4db', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 3, 'The loft was okay, but the location was noisy.');

-- Sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
    ('p5f3c4d0-1b02-4b50-90f0-c46a54870a97', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 'b1f7a87d-7549-4b97-bfe4-e881ca2f0fa7', 'Hello, is the Sunny Beach House available for the dates I mentioned?'),
    ('q8e2b0c1-3b0d-4a70-b0cc-2175b22ea5b0', 'b1f7a87d-7549-4b97-bfe4-e881ca2f0fa7', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 'Yes, the property is available. Let me know if you would like to book it!'),
    ('r6c2d0f7-7a7b-42c1-8bc0-8357d348c19d', 'a1e3a60b-e4be-45d6-93b5-1c6b75cdd2b1', 'b1f7a87d-7549-4b97-bfe4-e881ca2f0fa7', 'Great, I will confirm the booking soon. Thanks!');
