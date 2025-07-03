-- Hotel Analytics Dashboard Database Schema
-- Created: June 14, 2025
-- Purpose: Full-stack hotel management and analytics system

-- =====================================================
-- HOTELS TABLE: Master list of properties
-- =====================================================
CREATE TABLE hotels (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL DEFAULT 'USA',
    zip_code VARCHAR(10),
    phone VARCHAR(20),
    email VARCHAR(100),
    website VARCHAR(255),
    star_rating INTEGER CHECK (star_rating >= 1 AND star_rating <= 5),
    total_rooms INTEGER NOT NULL DEFAULT 0,
    amenities TEXT[], -- Array of amenities like ['pool', 'wifi', 'gym']
    description TEXT,
    manager_name VARCHAR(100),
    opening_date DATE,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- ROOM_TYPES TABLE: Different room categories
-- =====================================================
CREATE TABLE room_types (
    id SERIAL PRIMARY KEY,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    type_name VARCHAR(50) NOT NULL, -- 'Standard', 'Deluxe', 'Suite', etc.
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    max_occupancy INTEGER NOT NULL DEFAULT 2,
    size_sqft INTEGER,
    amenities TEXT[], -- Room-specific amenities
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- ROOMS TABLE: Individual room inventory
-- =====================================================
CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    room_type_id INTEGER REFERENCES room_types(id) ON DELETE CASCADE,
    room_number VARCHAR(10) NOT NULL,
    floor_number INTEGER,
    is_available BOOLEAN DEFAULT true,
    maintenance_status VARCHAR(20) DEFAULT 'operational', -- 'operational', 'maintenance', 'out_of_order'
    last_cleaned TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Ensure unique room numbers per hotel
    UNIQUE(hotel_id, room_number)
);

-- =====================================================
-- GUESTS TABLE: Customer information
-- =====================================================
CREATE TABLE guests (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    nationality VARCHAR(50),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(20),
    country VARCHAR(50),
    zip_code VARCHAR(10),
    loyalty_status VARCHAR(20) DEFAULT 'standard', -- 'standard', 'silver', 'gold', 'platinum'
    total_stays INTEGER DEFAULT 0,
    total_spent DECIMAL(12,2) DEFAULT 0.00,
    preferences TEXT[], -- ['non-smoking', 'high-floor', 'ocean-view']
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- RESERVATIONS TABLE: Booking records
-- =====================================================
CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    room_id INTEGER REFERENCES rooms(id) ON DELETE CASCADE,
    guest_id INTEGER REFERENCES guests(id) ON DELETE CASCADE,
    confirmation_number VARCHAR(20) UNIQUE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    adults INTEGER NOT NULL DEFAULT 1,
    children INTEGER DEFAULT 0,
    total_nights INTEGER GENERATED ALWAYS AS (check_out_date - check_in_date) STORED,
    room_rate DECIMAL(10,2) NOT NULL,
    taxes DECIMAL(10,2) DEFAULT 0.00,
    fees DECIMAL(10,2) DEFAULT 0.00,
    total_amount DECIMAL(12,2) NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'confirmed', -- 'confirmed', 'checked_in', 'checked_out', 'cancelled', 'no_show'
    payment_status VARCHAR(20) DEFAULT 'pending', -- 'pending', 'paid', 'partially_paid', 'refunded'
    special_requests TEXT,
    booking_source VARCHAR(30) DEFAULT 'direct', -- 'direct', 'booking.com', 'expedia', 'walk_in'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Business rule constraints
    CHECK (check_out_date > check_in_date),
    CHECK (adults > 0),
    CHECK (children >= 0)
);
-- =====================================================
-- REVIEWS TABLE: Guest feedback and ratings
-- =====================================================
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    guest_id INTEGER REFERENCES guests(id) ON DELETE CASCADE,
    reservation_id INTEGER REFERENCES reservations(id) ON DELETE SET NULL,
    overall_rating INTEGER NOT NULL CHECK (overall_rating >= 1 AND overall_rating <= 5),
    cleanliness_rating INTEGER CHECK (cleanliness_rating >= 1 AND cleanliness_rating <= 5),
    service_rating INTEGER CHECK (service_rating >= 1 AND service_rating <= 5),
    location_rating INTEGER CHECK (location_rating >= 1 AND location_rating <= 5),
    value_rating INTEGER CHECK (value_rating >= 1 AND value_rating <= 5),
    title VARCHAR(200),
    comment TEXT,
    review_date DATE DEFAULT CURRENT_DATE,
    is_verified BOOLEAN DEFAULT false, -- True if guest actually stayed
    helpful_votes INTEGER DEFAULT 0,
    response_from_hotel TEXT,
    response_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- STAFF TABLE: Hotel employees
-- =====================================================
CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    employee_id VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    department VARCHAR(50) NOT NULL, -- 'front_desk', 'housekeeping', 'maintenance', 'management', 'food_service'
    position VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2),
    is_active BOOLEAN DEFAULT true,
    manager_id INTEGER REFERENCES staff(id), -- Self-referencing for org structure
    shift_schedule VARCHAR(20), -- 'morning', 'evening', 'night', 'rotating'
    performance_rating DECIMAL(3,2) CHECK (performance_rating >= 1.0 AND performance_rating <= 5.0),
    last_review_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- OCCUPANCY_ANALYTICS TABLE: Daily performance metrics
-- =====================================================
CREATE TABLE occupancy_analytics (
    id SERIAL PRIMARY KEY,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    total_rooms INTEGER NOT NULL,
    occupied_rooms INTEGER NOT NULL DEFAULT 0,
    available_rooms INTEGER GENERATED ALWAYS AS (total_rooms - occupied_rooms) STORED,
    occupancy_rate DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE 
            WHEN total_rooms > 0 THEN (occupied_rooms::DECIMAL / total_rooms) * 100 
            ELSE 0 
        END
    ) STORED,
    revenue DECIMAL(12,2) DEFAULT 0.00,
    average_room_rate DECIMAL(10,2) GENERATED ALWAYS AS (
        CASE 
            WHEN occupied_rooms > 0 THEN revenue / occupied_rooms 
            ELSE 0 
        END
    ) STORED,
    revpar DECIMAL(10,2) GENERATED ALWAYS AS (
        CASE 
            WHEN total_rooms > 0 THEN revenue / total_rooms 
            ELSE 0 
        END
    ) STORED, -- Revenue Per Available Room (key hotel metric)
    walk_ins INTEGER DEFAULT 0,
    cancellations INTEGER DEFAULT 0,
    no_shows INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Ensure one record per hotel per date
    UNIQUE(hotel_id, date),
    
    -- Business constraints
    CHECK (occupied_rooms >= 0),
    CHECK (occupied_rooms <= total_rooms),
    CHECK (revenue >= 0)
);

-- =====================================================
-- INDEXES for Performance Optimization
-- =====================================================
-- Frequently queried columns get indexes for faster lookups
CREATE INDEX idx_reservations_dates ON reservations(check_in_date, check_out_date);
CREATE INDEX idx_reservations_hotel ON reservations(hotel_id);
CREATE INDEX idx_reservations_guest ON reservations(guest_id);
CREATE INDEX idx_reservations_status ON reservations(status);
CREATE INDEX idx_reviews_hotel ON reviews(hotel_id);
CREATE INDEX idx_reviews_rating ON reviews(overall_rating);
CREATE INDEX idx_occupancy_hotel_date ON occupancy_analytics(hotel_id, date);
CREATE INDEX idx_staff_hotel_dept ON staff(hotel_id, department);
CREATE INDEX idx_guests_email ON guests(email);
CREATE INDEX idx_rooms_hotel_type ON rooms(hotel_id, room_type_id);

-- =====================================================
-- SAMPLE DATA VIEWS for Analytics
-- =====================================================
-- View: Hotel Performance Summary
CREATE VIEW hotel_performance_summary AS
SELECT 
    h.name as hotel_name,
    h.city,
    h.star_rating,
    COUNT(DISTINCT r.id) as total_reservations,
    AVG(rev.overall_rating) as avg_rating,
    COUNT(DISTINCT rev.id) as total_reviews,
    AVG(oa.occupancy_rate) as avg_occupancy_rate,
    SUM(oa.revenue) as total_revenue
FROM hotels h
LEFT JOIN reservations r ON h.id = r.hotel_id
LEFT JOIN reviews rev ON h.id = rev.hotel_id
LEFT JOIN occupancy_analytics oa ON h.id = oa.hotel_id
WHERE h.is_active = true
GROUP BY h.id, h.name, h.city, h.star_rating;

-- View: Current Hotel Availability
CREATE VIEW current_availability AS
SELECT 
    h.name as hotel_name,
    h.city,
    rt.type_name,
    rt.base_price,
    COUNT(r.id) as total_rooms,
    COUNT(CASE WHEN r.is_available = true THEN 1 END) as available_rooms
FROM hotels h
JOIN room_types rt ON h.id = rt.hotel_id
JOIN rooms r ON rt.id = r.room_type_id
WHERE h.is_active = true AND r.maintenance_status = 'operational'
GROUP BY h.id, h.name, h.city, rt.id, rt.type_name, rt.base_price
ORDER BY h.name, rt.base_price;