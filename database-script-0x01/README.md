# Task 2: Design Database Schema (DDL)

## Overview

In this task, we are creating the database schema for the ALX Airbnb-like database. The schema is designed to store data for users, properties, bookings, payments, reviews, and messages. This schema uses relational database principles with tables, primary keys, foreign keys, constraints, and indexes to ensure data integrity and optimize performance.

### **Entities**

The schema contains the following key entities:

1. **User**: Represents users of the platform, including both guests and hosts. Each user has a unique identifier, name, email, password, and role (guest, host, or admin).
2. **Property**: Represents properties listed by hosts. Each property is associated with a host and contains information about the property such as its name, description, location, and price.
3. **Booking**: Represents the bookings made by guests for properties. Each booking is linked to a property and a user (guest).
4. **Payment**: Represents payments made for bookings. Each payment is associated with a booking.
5. **Review**: Represents reviews left by users (guests) for properties they stayed in. A review includes a rating (1-5) and a comment.
6. **Message**: Represents private messages between users, either between guests and hosts or other users.

---

## **Schema Design**

Below is the SQL schema that defines the structure of the tables in the database:

### **SQL Code for Database Schema**

```sql
-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,                    
    first_name VARCHAR(100) NOT NULL,             
    last_name VARCHAR(100) NOT NULL,              
    email VARCHAR(100) NOT NULL UNIQUE,           
    password_hash VARCHAR(255) NOT NULL,          
    phone_number VARCHAR(15),                     
    role ENUM('guest', 'host', 'admin') NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,                 
    host_id UUID,                                 
    name VARCHAR(255) NOT NULL,                    
    description TEXT NOT NULL,                     
    location VARCHAR(255) NOT NULL,                
    pricepernight DECIMAL(10, 2) NOT NULL,         
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,                   
    property_id UUID,                              
    user_id UUID,                                  
    start_date DATE NOT NULL,                       
    end_date DATE NOT NULL,                         
    total_price DECIMAL(10, 2) NOT NULL,            
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (property_id) REFERENCES Property(property_id), 
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,                    
    booking_id UUID,                                
    amount DECIMAL(10, 2) NOT NULL,                  
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL, 
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,                     
    property_id UUID,                              
    user_id UUID,                                  
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL, 
    comment TEXT NOT NULL,                          
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (property_id) REFERENCES Property(property_id), 
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,                    
    sender_id UUID,                                 
    recipient_id UUID,                              
    message_body TEXT NOT NULL,                     
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    FOREIGN KEY (sender_id) REFERENCES User(user_id), 
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

-- Indexes for Performance Optimization
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
