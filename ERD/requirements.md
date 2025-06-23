# Task 0: Define Entities and Relationships in ER Diagram

## Objective
Create an Entity-Relationship (ER) diagram to represent the database design for the Airbnb-like application. This diagram should clearly define entities, their attributes, and the relationships between them.

---

## Entities and Attributes

### 1. **User**
Represents users of the application, including guests, hosts, and admins.
- **Attributes:**
  - `user_id` (Primary Key, UUID)
  - `first_name` (VARCHAR, NOT NULL)
  - `last_name` (VARCHAR, NOT NULL)
  - `email` (VARCHAR, UNIQUE, NOT NULL)
  - `password_hash` (VARCHAR, NOT NULL)
  - `phone_number` (VARCHAR, NULL)
  - `role` (ENUM: guest, host, admin, NOT NULL)
  - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 2. **Property**
Represents properties listed by hosts for bookings.
- **Attributes:**
  - `property_id` (Primary Key, UUID)
  - `host_id` (Foreign Key, references `User.user_id`)
  - `name` (VARCHAR, NOT NULL)
  - `description` (TEXT, NOT NULL)
  - `location` (VARCHAR, NOT NULL)
  - `price_per_night` (DECIMAL, NOT NULL)
  - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

### 3. **Booking**
Represents reservations made by guests for properties.
- **Attributes:**
  - `booking_id` (Primary Key, UUID)
  - `property_id` (Foreign Key, references `Property.property_id`)
  - `user_id` (Foreign Key, references `User.user_id`)
  - `start_date` (DATE, NOT NULL)
  - `end_date` (DATE, NOT NULL)
  - `total_price` (DECIMAL, NOT NULL)
  - `status` (ENUM: pending, confirmed, canceled, NOT NULL)
  - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 4. **Payment**
Represents payments made for bookings.
- **Attributes:**
  - `payment_id` (Primary Key, UUID)
  - `booking_id` (Foreign Key, references `Booking.booking_id`)
  - `amount` (DECIMAL, NOT NULL)
  - `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - `payment_method` (ENUM: credit_card, PayPal, Stripe, NOT NULL)

---

### 5. **Review**
Represents reviews left by users for properties.
- **Attributes:**
  - `review_id` (Primary Key, UUID)
  - `property_id` (Foreign Key, references `Property.property_id`)
  - `user_id` (Foreign Key, references `User.user_id`)
  - `rating` (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
  - `comment` (TEXT, NOT NULL)
  - `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 6. **Message**
Represents messages exchanged between users.
- **Attributes:**
  - `message_id` (Primary Key, UUID)
  - `sender_id` (Foreign Key, references `User.user_id`)
  - `recipient_id` (Foreign Key, references `User.user_id`)
  - `message_body` (TEXT, NOT NULL)
  - `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships

1. **User to Booking**
   - One user (guest) can have multiple bookings.
   - Relationship: `1:N`

2. **User to Property**
   - One user (host) can own multiple properties.
   - Relationship: `1:N`

3. **Property to Booking**
   - One property can have multiple bookings.
   - Relationship: `1:N`

4. **Booking to Payment**
   - Each booking can have one payment.
   - Relationship: `1:1`

5. **User to Review**
   - One user can leave multiple reviews.
   - Relationship: `1:N`

6. **Property to Review**
   - One property can have multiple reviews.
   - Relationship: `1:N`

7. **User to Message**
   - One user can send multiple messages to another user.
   - Relationship: `1:N`

---

## ER Diagram

### Description
The ER diagram visually represents the entities, their attributes, and the relationships between them. Use the following guidelines to create the diagram:
- **Tools:** Use [Draw.io](https://draw.io), Lucidchart, or any ERD-specific software.
- Represent entities as rectangles.
- Represent relationships as diamonds connecting entities.
- Use lines with cardinalities to show the type of relationship (1:1, 1:N).

### Diagram Preview
Upload the ER Diagram to the repository in the `ERD/` directory and link it here:
![ER Diagram](./erd-diagram.png)

---

## Submission

Ensure the following:
1. The ER diagram is uploaded to the `ERD/` directory.
2. The `requirements.md` file is complete and up to date.
3. The relationships and attributes are clearly defined and consistent with the project specification.
