-- Airport Management System Database Schema

-- Create database
CREATE DATABASE IF NOT EXISTS airport_management;
USE airport_management;

-- Users table (for both passengers and admins)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('passenger', 'admin') DEFAULT 'passenger',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Flights table
CREATE TABLE flights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) UNIQUE NOT NULL,
    source VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departure_date DATE NOT NULL,
    departure_time TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    class ENUM('economy', 'business') DEFAULT 'economy',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bookings table
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    flight_id INT NOT NULL,
    passenger_count INT NOT NULL,
    class ENUM('economy', 'business') NOT NULL,
    pnr VARCHAR(10) UNIQUE NOT NULL,
    status ENUM('confirmed', 'cancelled') DEFAULT 'confirmed',
    booked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE
);

-- Insert sample admin user
INSERT INTO users (name, email, password, role) VALUES 
('Admin User', 'admin@airport.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin');
-- Password is 'password' hashed

-- Insert sample flights
INSERT INTO flights (flight_number, source, destination, departure_date, departure_time, price, class) VALUES
('AI101', 'Delhi', 'Mumbai', '2024-04-01', '10:00:00', 5000.00, 'economy'),
('AI102', 'Mumbai', 'Delhi', '2024-04-01', '14:00:00', 5000.00, 'economy'),
('AI201', 'Delhi', 'Bangalore', '2024-04-02', '08:00:00', 7000.00, 'business'),
('AI202', 'Bangalore', 'Delhi', '2024-04-02', '12:00:00', 7000.00, 'business');