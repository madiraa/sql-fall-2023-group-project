-- Create Flights table
CREATE TABLE Flights (
    flight_id serial PRIMARY KEY,
    airline_id int,
    flightDate date,
    startingAirport varchar(10),
    destinationAirport varchar(10),
    travelDuration int,
    isNonStop varchar(10)
);

-- Create Flight_reservations table
CREATE TABLE Flight_reservations (
    flight_id int,
    customer_id int,
    totalFare decimal(10,2),
    isBasicEconomy varchar(10),
    isRefundable varchar(10)
);

-- Create Airlines table
CREATE TABLE Airlines (
    airline_id serial PRIMARY KEY,
    name varchar(255),
    country_base varchar(100)
);

-- Create Reviews table
CREATE TABLE Reviews (
    booking_id int,
    customer_id int,
    date timestamp,
    rating decimal(2,1),
    review_text varchar(500)
);

-- Create Vehicle_type table
CREATE TABLE Vehicle_type (
    vehicle_id serial PRIMARY KEY,
    weekly_rate decimal(5,2),
    daily_rate decimal(5,2),
    car_type varchar(20)
);

-- Create Vehicles table
CREATE TABLE Vehicles (
    vehicle_id serial PRIMARY KEY,
    make varchar(50),
    model varchar(50),
    year smallint
);

-- Create Vehicle_availability table
CREATE TABLE Vehicle_availability (
    vehicle_id int,
    available_start date,
    available_end date
);

-- Create Car_rentals table
CREATE TABLE Car_rentals (
    customer_id int,
    vehicle_id int,
    start_date date,
    return_date date,
    amount_date decimal(10,2),
    days_rented int
);

-- Create Bookings table
CREATE TABLE Bookings (
    booking_id serial PRIMARY KEY,
    hotel_id int,
    flight_id int,
    vehicle_id int,
    booked_date date
);

-- Create Customer table
CREATE TABLE Customer (
    customer_id serial PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(255),
    phone_number varchar(22),
    booking_id int,
    age int,
    gender varchar(12),
    payment_method serial
);

-- Create Payment_method table
CREATE TABLE Payment_method (
    customer_id int,
    payment_type varchar(20),
    card_number varchar(50),
    cvv int,
    billing_zip int
);

-- Create Transactions table
CREATE TABLE Transactions (
    booking_id int,
    customer_id int,
    payment_method varchar(10),
    payment_processor varchar(20),
    transaction_date date,
    transaction_amount decimal(6,2)
);

-- Create Hotels table
CREATE TABLE Hotels (
    hotel_id serial PRIMARY KEY,
    name varchar(100),
    accomodation_type varchar(100),
    country varchar(100),
    city varchar(100),
    state varchar(50),
    stars decimal(2,1)
);

-- Create Hotel_prices table
CREATE TABLE Hotel_prices (
    hotel_id int,
    year smallint,
    month smallint,
    weekend boolean,
    holiday boolean,
    nights int,
    price decimal(6,2)
);
