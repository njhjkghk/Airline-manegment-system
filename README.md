# Airport Management System (MVP)

A simple PHP-based airport management system for flight booking and administration.

## Features

### Passenger Features
- User registration and login
- Flight search by source, destination, and date
- Ticket booking with passenger count and class selection
- PNR status checking
- Downloadable PDF tickets

### Admin Features
- Admin login
- Add, edit, and delete flights
- View all passenger bookings
- Dashboard with flight and booking statistics

## Installation

1. Place the project in your XAMPP htdocs folder: `C:\xampp\htdocs\airport management`

2. Create the database:
   - Open phpMyAdmin
   - Create a database named `airport_management`
   - Import the `schema.sql` file

3. Install FPDF library for PDF generation (optional):
   - Download FPDF from http://www.fpdf.org/
   - Extract to `vendor/fpdf/` folder
   - Or use Composer: `composer require fpdf/fpdf`
   - Note: The current implementation uses HTML output that can be saved/printed as PDF

4. Update database credentials in `config/db.php` if needed (default: root, no password)

5. Access the application at `http://localhost/airport management/public/index.php`

## Project Structure

```
airport management/
├── config/
│   ├── auth.php          # Authentication functions
│   └── db.php            # Database connection
├── public/               # Public pages
│   ├── index.php         # Home page
│   ├── login.php         # Login page
│   ├── register.php      # Registration page
│   ├── search.php        # Flight search
│   ├── book.php          # Booking page
│   ├── pnr_check.php     # PNR status check
│   ├── download_ticket.php # PDF ticket download
│   └── logout.php        # Logout
├── admin/                # Admin pages
│   ├── dashboard.php     # Admin dashboard
│   ├── add_flight.php    # Add flight
│   ├── edit_flight.php   # Edit flight
│   ├── delete_flight.php # Delete flight
│   └── view_bookings.php # View bookings
├── assets/               # Static assets
│   ├── css/
│   │   └── style.css     # Stylesheet
│   └── js/
│       └── script.js     # JavaScript
├── vendor/               # Third-party libraries
│   └── fpdf/             # FPDF library
└── schema.sql            # Database schema
```

## Security Features

- Password hashing using bcrypt
- Prepared SQL statements to prevent SQL injection
- Session-based authentication
- Role-based access control
- Input validation

## Sample Data

The schema includes:
- Admin user: admin@airport.com / password
- Sample flights between major Indian cities

## Future Enhancements

- Online payments integration
- Seat selection
- Boarding pass QR codes
- Flight delay notifications
- Analytics dashboard
- Mobile application
- Email notifications

## Technologies Used

- PHP 7+
- MySQL
- HTML5
- CSS3
- JavaScript
- FPDF (for PDF generation)