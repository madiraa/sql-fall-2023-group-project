-- Create the airlines table
CREATE TABLE airlines (
    airline_id INT PRIMARY KEY,
    name VARCHAR(255),
    country_base VARCHAR(100)
);

-- Create the hotels table
CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(50),
    stars DECIMAL(2, 1)
);

-- Create the vehicles table
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year SMALLINT,
    daily_rate DECIMAL(5, 2)
);

-- Create the vehicle_availability table
CREATE TABLE vehicle_availability (
    vehicle_id INT,
    available_start DATE,
    available_end DATE,
    PRIMARY KEY (vehicle_id, available_start, available_end),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id)
);

-- Create the car_reservation table
CREATE TABLE car_reservation (
    customer_id INT PRIMARY KEY,
    vehicle_id INT,
    start_date DATE,
    end_date DATE,
    amount_due DECIMAL(10, 2),
    return_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id)
);

-- Create the flights table
CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    flightDate DATE,
    startingAirport VARCHAR(10),
    destinationAirport VARCHAR(10),
    travelDuration INT,
    isNonStop BOOLEAN,
    FOREIGN KEY (airline_id) REFERENCES airlines (airline_id)
);

-- Create the flight_reservations table
CREATE TABLE flight_reservations (
    flight_res_id INT PRIMARY KEY,
    flight_id INT,
    totalFare DECIMAL(10, 2),
    isBasicEconomy VARCHAR(10),
    isRefundable VARCHAR(10),
    FOREIGN KEY (flight_id) REFERENCES flights (flight_id)
);

-- Create the bookings table
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    hotel_id INT,
    flight_id INT,
    vehicle_id INT,
    booked_date DATE,
    FOREIGN KEY (hotel_id) REFERENCES hotels (hotel_id),
    FOREIGN KEY (flight_id) REFERENCES flights (flight_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id)
);

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    phone_number VARCHAR(22),
    booking_id INT,
    age INT,
    gender VARCHAR(12),
    payment_method VARCHAR(10),
    FOREIGN KEY (booking_id) REFERENCES bookings (booking_id)
);

-- Create the reviews table
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    flight_id INT,
    hotel_id INT,
    date TIMESTAMP,
    rating DECIMAL(2, 1),
    review_text VARCHAR(500),
    FOREIGN KEY (flight_id) REFERENCES flights (flight_id),
    FOREIGN KEY (hotel_id) REFERENCES hotels (hotel_id)
);

-- Create the payment_method table
CREATE TABLE payment_method (
    method_id INT PRIMARY KEY,
    payment_type VARCHAR(20),
    card_number VARCHAR(50),
    cvv INT,
    billing_zip INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Create the transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    payment_method VARCHAR(10),
    payment_processor VARCHAR(20),
    transaction_date DATE,
    transaction_amount DECIMAL(6, 2)
);

-- Create the hotel_rooms table
CREATE TABLE hotel_rooms (
    room_id SERIAL PRIMARY KEY,
    hotel_id INT,
    date DATE,
    availability BOOLEAN,
    price DECIMAL(6, 2),
    accomodation_type VARCHAR(100),
    FOREIGN KEY (hotel_id) REFERENCES hotels (hotel_id)
);