-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,                    -- Unique identifier for each user
    first_name VARCHAR(100) NOT NULL,             -- User's first name
    last_name VARCHAR(100) NOT NULL,              -- User's last name
    email VARCHAR(100) NOT NULL UNIQUE,           -- User's email (unique constraint)
    password_hash VARCHAR(255) NOT NULL,          -- Hashed password
    phone_number VARCHAR(15),                     -- Optional phone number
    role ENUM('guest', 'host', 'admin') NOT NULL, -- User's role (ENUM constraint)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of user creation
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,                 -- Unique identifier for each property
    host_id UUID,                                 -- Foreign key referencing User table
    name VARCHAR(255) NOT NULL,                    -- Name of the property
    description TEXT NOT NULL,                     -- Property description
    location VARCHAR(255) NOT NULL,                -- Property location
    pricepernight DECIMAL(10, 2) NOT NULL,         -- Price per night
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of property creation
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Auto-update timestamp
    FOREIGN KEY (host_id) REFERENCES User(user_id) -- Foreign key constraint for host
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,                   -- Unique identifier for each booking
    property_id UUID,                              -- Foreign key referencing Property table
    user_id UUID,                                  -- Foreign key referencing User table
    start_date DATE NOT NULL,                       -- Start date of the booking
    end_date DATE NOT NULL,                         -- End date of the booking
    total_price DECIMAL(10, 2) NOT NULL,            -- Total price for the booking
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL, -- Booking status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of booking creation
    FOREIGN KEY (property_id) REFERENCES Property(property_id), -- Foreign key constraint for property
    FOREIGN KEY (user_id) REFERENCES User(user_id) -- Foreign key constraint for user
);

-- Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,                    -- Unique identifier for each payment
    booking_id UUID,                                -- Foreign key referencing Booking table
    amount DECIMAL(10, 2) NOT NULL,                  -- Payment amount
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of payment
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL, -- Payment method
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) -- Foreign key constraint for booking
);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,                     -- Unique identifier for each review
    property_id UUID,                               -- Foreign key referencing Property table
    user_id UUID,                                   -- Foreign key referencing User table
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL, -- Rating (1 to 5)
    comment TEXT NOT NULL,                          -- Review comment
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of review creation
    FOREIGN KEY (property_id) REFERENCES Property(property_id), -- Foreign key constraint for property
    FOREIGN KEY (user_id) REFERENCES User(user_id) -- Foreign key constraint for user
);

-- Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,                    -- Unique identifier for each message
    sender_id UUID,                                 -- Foreign key referencing User table
    recipient_id UUID,                              -- Foreign key referencing User table
    message_body TEXT NOT NULL,                      -- Message content
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     -- Timestamp of message
    FOREIGN KEY (sender_id) REFERENCES User(user_id), -- Foreign key constraint for sender
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) -- Foreign key constraint for recipient
);

-- Indexes for Performance Optimization
CREATE INDEX idx_user_email ON User(email);              -- Index on email column for User table
CREATE INDEX idx_property_id ON Property(property_id);    -- Index on property_id column for Property table
CREATE INDEX idx_booking_property_id ON Booking(property_id); -- Index on property_id in Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);     -- Index on user_id in Booking table
CREATE INDEX idx_payment_booking_id ON Payment(booking_id); -- Index on booking_id in Payment table
CREATE INDEX idx_review_property_id ON Review(property_id); -- Index on property_id in Review table
CREATE INDEX idx_review_user_id ON Review(user_id);        -- Index on user_id in Review table
CREATE INDEX idx_message_sender_id ON Message(sender_id);   -- Index on sender_id in Message table
CREATE INDEX idx_message_recipient_id ON Message(recipient_id); -- Index on recipient_id in Message table
