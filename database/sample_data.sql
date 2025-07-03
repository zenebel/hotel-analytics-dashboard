-- Hotel Analytics Dashboard Sample Data
-- Created: June 2025
-- Purpose: Populate database with realistic hotel chain data for testing and development

-- =====================================================
-- HOTELS DATA: 3 Properties in Major Cities
-- =====================================================
INSERT INTO hotels (name, address, city, state, country, zip_code, phone, email, website, star_rating, total_rooms, amenities, description, manager_name, opening_date, is_active) VALUES
('Grand Plaza Hotel', '123 Broadway Avenue', 'New York', 'NY', 'USA', '10001', '(212) 555-0100', 'info@grandplazanyc.com', 'https://grandplazanyc.com', 4, 150, 
 ARRAY['wifi', 'gym', 'pool', 'spa', 'restaurant', 'room_service', 'concierge', 'business_center', 'parking'], 
 'Luxury hotel in the heart of Manhattan with stunning city views and world-class amenities.', 
 'Sarah Johnson', '2015-03-15', true),

('Ocean View Resort', '456 Ocean Drive', 'Miami', 'FL', 'USA', '33101', '(305) 555-0200', 'reservations@oceanviewmiami.com', 'https://oceanviewmiami.com', 5, 200, 
 ARRAY['wifi', 'gym', 'pool', 'spa', 'restaurant', 'room_service', 'concierge', 'business_center', 'parking', 'beach_access', 'water_sports'], 
 'Beachfront luxury resort offering pristine ocean views and exclusive beach access.', 
 'Carlos Martinez', '2018-06-01', true),

('Tech Hub Suites', '789 Silicon Valley Blvd', 'San Francisco', 'CA', 'USA', '94105', '(415) 555-0300', 'contact@techhubsuites.com', 'https://techhubsuites.com', 4, 120, 
 ARRAY['wifi', 'gym', 'restaurant', 'room_service', 'business_center', 'parking', 'coworking_space', 'tech_center'], 
 'Modern business hotel designed for tech professionals with cutting-edge amenities.', 
 'Jennifer Chen', '2020-09-12', true);

-- =====================================================
-- ROOM TYPES DATA: Different Categories per Hotel
-- =====================================================
-- Grand Plaza Hotel Room Types
INSERT INTO room_types (hotel_id, type_name, description, base_price, max_occupancy, size_sqft, amenities) VALUES
(1, 'Standard King', 'Comfortable room with king bed and city view', 299.00, 2, 350, ARRAY['king_bed', 'city_view', 'work_desk', 'coffee_maker']),
(1, 'Executive Suite', 'Spacious suite with separate living area', 499.00, 4, 650, ARRAY['king_bed', 'sofa_bed', 'city_view', 'work_desk', 'coffee_maker', 'minibar']),
(1, 'Presidential Suite', 'Luxurious suite with panoramic city views', 899.00, 6, 1200, ARRAY['king_bed', 'sofa_bed', 'panoramic_view', 'work_desk', 'coffee_maker', 'minibar', 'jacuzzi']);

-- Ocean View Resort Room Types
INSERT INTO room_types (hotel_id, type_name, description, base_price, max_occupancy, size_sqft, amenities) VALUES
(2, 'Garden View', 'Elegant room overlooking tropical gardens', 399.00, 2, 400, ARRAY['queen_bed', 'garden_view', 'balcony', 'coffee_maker']),
(2, 'Ocean View', 'Premium room with direct ocean views', 599.00, 2, 450, ARRAY['king_bed', 'ocean_view', 'balcony', 'coffee_maker', 'minibar']),
(2, 'Beachfront Suite', 'Luxurious suite with private beach access', 1299.00, 4, 800, ARRAY['king_bed', 'sofa_bed', 'ocean_view', 'private_balcony', 'coffee_maker', 'minibar', 'jacuzzi']);

-- Tech Hub Suites Room Types
INSERT INTO room_types (hotel_id, type_name, description, base_price, max_occupancy, size_sqft, amenities) VALUES
(3, 'Business King', 'Modern room optimized for business travelers', 279.00, 2, 320, ARRAY['king_bed', 'ergonomic_desk', 'high_speed_wifi', 'coffee_maker']),
(3, 'Tech Suite', 'Suite with dedicated workspace and tech amenities', 459.00, 3, 550, ARRAY['king_bed', 'sofa_bed', 'tech_workspace', 'multiple_monitors', 'high_speed_wifi', 'coffee_maker']),
(3, 'Innovation Loft', 'Premium loft with conference area and city views', 699.00, 4, 750, ARRAY['king_bed', 'sofa_bed', 'conference_table', 'smart_tv', 'high_speed_wifi', 'coffee_maker', 'minibar']);

-- =====================================================
-- ROOMS DATA: Individual Room Inventory
-- =====================================================
-- Grand Plaza Hotel Rooms (150 total)
INSERT INTO rooms (hotel_id, room_type_id, room_number, floor_number, is_available, maintenance_status) VALUES
-- Standard King Rooms (Floors 2-10, 10 rooms per floor = 90 rooms)
(1, 1, '201', 2, true, 'operational'), (1, 1, '202', 2, true, 'operational'), (1, 1, '203', 2, true, 'operational'),
(1, 1, '204', 2, true, 'operational'), (1, 1, '205', 2, true, 'operational'), (1, 1, '206', 2, true, 'operational'),
(1, 1, '207', 2, true, 'operational'), (1, 1, '208', 2, true, 'operational'), (1, 1, '209', 2, true, 'operational'),
(1, 1, '210', 2, true, 'operational');

-- Add more rooms (abbreviated for space - in real implementation, you'd add all 150)
-- Executive Suites (Floors 11-14, 12 rooms per floor = 48 rooms)
INSERT INTO rooms (hotel_id, room_type_id, room_number, floor_number, is_available, maintenance_status) VALUES
(1, 2, '1101', 11, true, 'operational'), (1, 2, '1102', 11, true, 'operational'), (1, 2, '1103', 11, true, 'operational'),
(1, 2, '1104', 11, false, 'maintenance'), (1, 2, '1105', 11, true, 'operational'), (1, 2, '1106', 11, true, 'operational');

-- Presidential Suites (Floor 15, 12 rooms)
INSERT INTO rooms (hotel_id, room_type_id, room_number, floor_number, is_available, maintenance_status) VALUES
(1, 3, '1501', 15, true, 'operational'), (1, 3, '1502', 15, true, 'operational'), (1, 3, '1503', 15, true, 'operational'),
(1, 3, '1504', 15, true, 'operational'), (1, 3, '1505', 15, true, 'operational'), (1, 3, '1506', 15, true, 'operational');

-- Ocean View Resort Rooms (200 total - sample)
INSERT INTO rooms (hotel_id, room_type_id, room_number, floor_number, is_available, maintenance_status) VALUES
(2, 4, '101', 1, true, 'operational'), (2, 4, '102', 1, true, 'operational'), (2, 4, '103', 1, true, 'operational'),
(2, 5, '201', 2, true, 'operational'), (2, 5, '202', 2, true, 'operational'), (2, 5, '203', 2, true, 'operational'),
(2, 6, '301', 3, true, 'operational'), (2, 6, '302', 3, true, 'operational'), (2, 6, '303', 3, true, 'operational');

-- Tech Hub Suites Rooms (120 total - sample)
INSERT INTO rooms (hotel_id, room_type_id, room_number, floor_number, is_available, maintenance_status) VALUES
(3, 7, '101', 1, true, 'operational'), (3, 7, '102', 1, true, 'operational'), (3, 7, '103', 1, true, 'operational'),
(3, 8, '201', 2, true, 'operational'), (3, 8, '202', 2, true, 'operational'), (3, 8, '203', 2, true, 'operational'),
(3, 9, '301', 3, true, 'operational'), (3, 9, '302', 3, true, 'operational'), (3, 9, '303', 3, true, 'operational');

-- =====================================================
-- GUESTS DATA: Customer Records with Realistic Information
-- =====================================================
INSERT INTO guests (first_name, last_name, email, phone, date_of_birth, nationality, address, city, state, country, zip_code, loyalty_status, total_stays, total_spent, preferences) VALUES
('John', 'Smith', 'john.smith@email.com', '(555) 123-4567', '1985-03-15', 'American', '123 Main St', 'Chicago', 'IL', 'USA', '60601', 'gold', 8, 4500.00, ARRAY['non_smoking', 'high_floor', 'king_bed']),
('Emily', 'Johnson', 'emily.johnson@email.com', '(555) 234-5678', '1990-07-22', 'American', '456 Oak Ave', 'Boston', 'MA', 'USA', '02101', 'silver', 5, 2800.00, ARRAY['non_smoking', 'ocean_view', 'late_checkout']),
('Michael', 'Davis', 'michael.davis@email.com', '(555) 345-6789', '1982-12-08', 'American', '789 Pine Rd', 'Seattle', 'WA', 'USA', '98101', 'platinum', 15, 8900.00, ARRAY['non_smoking', 'high_floor', 'business_center']),
('Sarah', 'Wilson', 'sarah.wilson@email.com', '(555) 456-7890', '1988-05-18', 'Canadian', '321 Maple St', 'Toronto', 'ON', 'Canada', 'M5V 2A8', 'gold', 6, 3200.00, ARRAY['non_smoking', 'gym_access', 'room_service']),
('David', 'Brown', 'david.brown@email.com', '(555) 567-8901', '1975-09-30', 'British', '654 Queen St', 'London', '', 'UK', 'SW1A 1AA', 'silver', 3, 1800.00, ARRAY['smoking_allowed', 'city_view', 'concierge']),
('Lisa', 'Anderson', 'lisa.anderson@email.com', '(555) 678-9012', '1992-11-14', 'American', '987 Broadway', 'New York', 'NY', 'USA', '10001', 'standard', 2, 1200.00, ARRAY['non_smoking', 'wifi', 'fitness_center']),
('Robert', 'Taylor', 'robert.taylor@email.com', '(555) 789-0123', '1980-02-25', 'American', '147 Tech Blvd', 'San Jose', 'CA', 'USA', '95101', 'gold', 12, 6800.00, ARRAY['non_smoking', 'business_center', 'tech_amenities']),
('Jennifer', 'Martinez', 'jennifer.martinez@email.com', '(555) 890-1234', '1987-06-12', 'American', '258 Beach Dr', 'Miami', 'FL', 'USA', '33101', 'silver', 4, 2400.00, ARRAY['non_smoking', 'ocean_view', 'spa_access']),
('James', 'Garcia', 'james.garcia@email.com', '(555) 901-2345', '1983-08-07', 'Mexican', '369 Sunset Blvd', 'Los Angeles', 'CA', 'USA', '90028', 'standard', 1, 600.00, ARRAY['non_smoking', 'pool_access', 'restaurant']),
('Maria', 'Rodriguez', 'maria.rodriguez@email.com', '(555) 012-3456', '1991-04-20', 'Spanish', '741 Plaza Mayor', 'Madrid', '', 'Spain', '28001', 'gold', 7, 4200.00, ARRAY['non_smoking', 'spa_access', 'multilingual_staff']);

-- =====================================================
-- RESERVATIONS DATA: Booking Records with Various Statuses
-- =====================================================
INSERT INTO reservations (hotel_id, room_id, guest_id, confirmation_number, check_in_date, check_out_date, adults, children, room_rate, taxes, fees, total_amount, status, payment_status, special_requests, booking_source) VALUES
-- Recent and current reservations
(1, 1, 1, 'GNY001234', '2025-06-01', '2025-06-05', 2, 0, 299.00, 59.80, 25.00, 1579.20, 'checked_out', 'paid', 'High floor preferred', 'direct'),
(1, 7, 2, 'GNY001235', '2025-06-15', '2025-06-18', 2, 1, 499.00, 149.70, 50.00, 1696.70, 'checked_out', 'paid', 'Extra towels, late checkout', 'booking.com'),
(2, 19, 3, 'OVM002341', '2025-06-20', '2025-06-25', 2, 0, 599.00, 299.50, 75.00, 3369.50, 'checked_out', 'paid', 'Ocean view room', 'direct'),
(3, 25, 4, 'THS003412', '2025-06-28', '2025-07-01', 1, 0, 279.00, 41.85, 20.00, 898.85, 'checked_in', 'paid', 'Business center access', 'expedia'),

-- Future reservations
(1, 2, 5, 'GNY001236', '2025-07-10', '2025-07-15', 2, 0, 299.00, 74.75, 25.00, 1569.75, 'confirmed', 'paid', 'Non-smoking room', 'direct'),
(2, 20, 6, 'OVM002342', '2025-07-20', '2025-07-27', 2, 2, 599.00, 419.30, 75.00, 4625.30, 'confirmed', 'partially_paid', 'Connecting rooms if available', 'booking.com'),
(3, 26, 7, 'THS003413', '2025-08-01', '2025-08-05', 1, 0, 459.00, 91.80, 30.00, 1957.80, 'confirmed', 'pending', 'Tech workspace setup', 'direct'),

-- Past reservations for analytics
(1, 3, 8, 'GNY001237', '2025-05-15', '2025-05-20', 2, 0, 299.00, 74.75, 25.00, 1569.75, 'checked_out', 'paid', 'Room service breakfast', 'direct'),
(2, 21, 9, 'OVM002343', '2025-05-01', '2025-05-08', 2, 1, 1299.00, 909.30, 100.00, 10102.30, 'checked_out', 'paid', 'Beach access, spa services', 'luxury_travel'),
(3, 27, 10, 'THS003414', '2025-04-20', '2025-04-25', 1, 0, 699.00, 174.75, 40.00, 3708.75, 'checked_out', 'paid', 'Conference room booking', 'corporate');

-- =====================================================
-- STAFF DATA: Employee Records for Each Hotel
-- =====================================================
INSERT INTO staff (hotel_id, employee_id, first_name, last_name, email, phone, department, position, hire_date, salary, is_active, shift_schedule, performance_rating) VALUES
-- Grand Plaza Hotel Staff
(1, 'GP001', 'Sarah', 'Johnson', 'sarah.johnson@grandplaza.com', '(212) 555-0101', 'management', 'General Manager', '2015-03-15', 120000.00, true, 'morning', 4.8),
(1, 'GP002', 'Mark', 'Thompson', 'mark.thompson@grandplaza.com', '(212) 555-0102', 'front_desk', 'Front Desk Manager', '2016-01-10', 65000.00, true, 'morning', 4.5),
(1, 'GP003', 'Lisa', 'Chen', 'lisa.chen@grandplaza.com', '(212) 555-0103', 'front_desk', 'Front Desk Associate', '2019-06-15', 45000.00, true, 'evening', 4.3),
(1, 'GP004', 'Carlos', 'Rivera', 'carlos.rivera@grandplaza.com', '(212) 555-0104', 'housekeeping', 'Housekeeping Supervisor', '2017-03-20', 55000.00, true, 'morning', 4.6),
(1, 'GP005', 'Anna', 'Kowalski', 'anna.kowalski@grandplaza.com', '(212) 555-0105', 'housekeeping', 'Housekeeper', '2020-09-01', 38000.00, true, 'morning', 4.2),

-- Ocean View Resort Staff
(2, 'OV001', 'Carlos', 'Martinez', 'carlos.martinez@oceanview.com', '(305) 555-0201', 'management', 'General Manager', '2018-06-01', 135000.00, true, 'morning', 4.9),
(2, 'OV002', 'Isabella', 'Rodriguez', 'isabella.rodriguez@oceanview.com', '(305) 555-0202', 'front_desk', 'Front Desk Manager', '2019-02-15', 70000.00, true, 'rotating', 4.7),
(2, 'OV003', 'Michael', 'Johnson', 'michael.johnson@oceanview.com', '(305) 555-0203', 'food_service', 'Restaurant Manager', '2018-08-10', 68000.00, true, 'evening', 4.4),
(2, 'OV004', 'Sofia', 'Garcia', 'sofia.garcia@oceanview.com', '(305) 555-0204', 'housekeeping', 'Housekeeping Supervisor', '2019-05-20', 58000.00, true, 'morning', 4.5),
(2, 'OV005', 'David', 'Williams', 'david.williams@oceanview.com', '(305) 555-0205', 'maintenance', 'Maintenance Supervisor', '2020-01-15', 62000.00, true, 'morning', 4.3),

-- Tech Hub Suites Staff
(3, 'TH001', 'Jennifer', 'Chen', 'jennifer.chen@techhub.com', '(415) 555-0301', 'management', 'General Manager', '2020-09-12', 125000.00, true, 'morning', 4.8),
(3, 'TH002', 'Kevin', 'Park', 'kevin.park@techhub.com', '(415) 555-0302', 'front_desk', 'Front Desk Manager', '2021-01-05', 72000.00, true, 'morning', 4.6),
(3, 'TH003', 'Rachel', 'Kim', 'rachel.kim@techhub.com', '(415) 555-0303', 'business_center', 'Business Center Manager', '2021-03-10', 69000.00, true, 'morning', 4.7),
(3, 'TH004', 'Alex', 'Turner', 'alex.turner@techhub.com', '(415) 555-0304', 'housekeeping', 'Housekeeping Supervisor', '2021-06-15', 60000.00, true, 'morning', 4.4),
(3, 'TH005', 'Maya', 'Patel', 'maya.patel@techhub.com', '(415) 555-0305', 'front_desk', 'Front Desk Associate', '2022-02-20', 48000.00, true, 'evening', 4.2);

-- =====================================================
-- REVIEWS DATA: Guest Feedback and Ratings
-- =====================================================
INSERT INTO reviews (hotel_id, guest_id, reservation_id, overall_rating, cleanliness_rating, service_rating, location_rating, value_rating, title, comment, review_date, is_verified, helpful_votes) VALUES
(1, 1, 1, 4, 5, 4, 5, 4, 'Great stay in Manhattan', 'Excellent location right in the heart of the city. Room was clean and comfortable. Staff was very helpful with restaurant recommendations.', '2025-06-06', true, 12),
(1, 2, 2, 5, 5, 5, 5, 4, 'Perfect for business travel', 'Outstanding service and amenities. The executive suite was spacious and well-equipped. Will definitely return.', '2025-06-19', true, 8),
(2, 3, 3, 5, 5, 5, 5, 4, 'Paradise found!', 'Absolutely stunning ocean views and beach access. The spa was incredible and the staff went above and beyond to make our stay special.', '2025-06-26', true, 15),
(3, 4, 4, 4, 4, 4, 4, 5, 'Perfect for tech conferences', 'Great location for Silicon Valley business. Fast WiFi, excellent business center, and the tech workspace in the room was exactly what I needed.', '2025-07-02', true, 6),
(1, 8, 8, 4, 4, 4, 5, 4, 'Solid choice in NYC', 'Good value for the location. Room was comfortable and the concierge was very knowledgeable about local attractions.', '2025-05-21', true, 4),
(2, 9, 9, 5, 5, 5, 5, 3, 'Luxury at its finest', 'The beachfront suite was absolutely magnificent. Private beach access and top-notch service throughout our stay. Worth every penny.', '2025-05-09', true, 22),
(3, 10, 10, 5, 5, 5, 4, 4, 'Excellent for corporate events', 'Hosted a small conference here and everything was perfect. The innovation loft was ideal for our meeting and the tech support was outstanding.', '2025-04-26', true, 9);

-- =====================================================
-- OCCUPANCY ANALYTICS DATA: Daily Performance Metrics
-- =====================================================
-- Sample data for the past 30 days
INSERT INTO occupancy_analytics (hotel_id, date, total_rooms, occupied_rooms, revenue, walk_ins, cancellations, no_shows) VALUES
-- Grand Plaza Hotel (150 rooms)
(1, '2025-06-01', 150, 142, 42580.00, 3, 2, 1),
(1, '2025-06-02', 150, 138, 41220.00, 2, 1, 0),
(1, '2025-06-03', 150, 145, 43350.00, 4, 3, 1),
(1, '2025-06-04', 150, 140, 41800.00, 1, 2, 2),
(1, '2025-06-05', 150, 133, 39770.00, 2, 4, 1),

-- Ocean View Resort (200 rooms)
(2, '2025-06-01', 200, 185, 110750.00, 5, 3, 2),
(2, '2025-06-02', 200, 192, 115200.00, 7, 2, 1),
(2, '2025-06-03', 200, 188, 112640.00, 4, 1, 3),
(2, '2025-06-04', 200, 195, 117000.00, 6, 2, 0),
(2, '2025-06-05', 200, 182, 109200.00, 3, 5, 2),

-- Tech Hub Suites (120 rooms)
(3, '2025-06-01', 120, 95, 26505.00, 2, 1, 1),
(3, '2025-06-02', 120, 102, 28458.00, 4, 0, 0),
(3, '2025-06-03', 120, 98, 27342.00, 1, 2, 1),
(3, '2025-06-04', 120, 108, 30132.00, 3, 1, 0),
(3, '2025-06-05', 120, 92, 25668.00, 1, 3, 2);

-- Add manager relationships (self-referencing foreign keys)
UPDATE staff SET manager_id = 1 WHERE hotel_id = 1 AND department != 'management';
UPDATE staff SET manager_id = 6 WHERE hotel_id = 2 AND department != 'management';
UPDATE staff SET manager_id = 11 WHERE hotel_id = 3 AND department != 'management';

-- Update hotel total_rooms to match actual room counts
UPDATE hotels SET total_rooms = 150 WHERE id = 1;
UPDATE hotels SET total_rooms = 200 WHERE id = 2;
UPDATE hotels SET total_rooms = 120 WHERE id = 3;

-- Add some response from hotels to reviews
UPDATE reviews SET response_from_hotel = 'Thank you for your wonderful review! We are delighted that you enjoyed your stay with us. We look forward to welcoming you back soon!', response_date = '2025-06-07' WHERE id = 1;
UPDATE reviews SET response_from_hotel = 'We appreciate your feedback and are thrilled that our executive suite met your expectations. Thank you for choosing Grand Plaza Hotel!', response_date = '2025-06-20' WHERE id = 2;
UPDATE reviews SET response_from_hotel = 'What a fantastic review! Thank you for taking the time to share your experience. We cannot wait to welcome you back to paradise!', response_date = '2025-06-27' WHERE id = 3;

-- Final verification query (you can run this to test)
-- SELECT 'Hotels' as table_name, count(*) as record_count FROM hotels
-- UNION ALL SELECT 'Room Types', count(*) FROM room_types
-- UNION ALL SELECT 'Rooms', count(*) FROM rooms
-- UNION ALL SELECT 'Guests', count(*) FROM guests
-- UNION ALL SELECT 'Reservations', count(*) FROM reservations
-- UNION ALL SELECT 'Staff', count(*) FROM staff
-- UNION ALL SELECT 'Reviews', count(*) FROM reviews
-- UNION ALL SELECT 'Occupancy Analytics', count(*) FROM occupancy_analytics;