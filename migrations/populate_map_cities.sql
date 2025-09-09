-- Populate cities table with major world cities
-- This script adds 50 major cities for the map animation feature

BEGIN;

-- Clear existing test data if needed (optional - comment out if you want to keep existing data)
-- TRUNCATE TABLE cities CASCADE;

-- Insert major world cities with their coordinates
INSERT INTO cities (id, name, location, status) VALUES
(1, 'Shanghai', ST_SetSRID(ST_MakePoint(121.45806, 31.22222), 4326), 'published'),
(2, 'Beijing', ST_SetSRID(ST_MakePoint(116.39723, 39.9075), 4326), 'published'),
(3, 'Shenzhen', ST_SetSRID(ST_MakePoint(114.0683, 22.54554), 4326), 'published'),
(4, 'Guangzhou', ST_SetSRID(ST_MakePoint(113.25, 23.11667), 4326), 'published'),
(5, 'Kinshasa', ST_SetSRID(ST_MakePoint(15.31357, -4.32758), 4326), 'published'),
(6, 'Lagos', ST_SetSRID(ST_MakePoint(3.39467, 6.45407), 4326), 'published'),
(7, 'Istanbul', ST_SetSRID(ST_MakePoint(28.94966, 41.01384), 4326), 'published'),
(8, 'Chengdu', ST_SetSRID(ST_MakePoint(104.06667, 30.66667), 4326), 'published'),
(9, 'Mumbai', ST_SetSRID(ST_MakePoint(72.88261, 19.07283), 4326), 'published'),
(10, 'São Paulo', ST_SetSRID(ST_MakePoint(-46.63611, -23.5475), 4326), 'published'),
(11, 'Mexico City', ST_SetSRID(ST_MakePoint(-99.12766, 19.42847), 4326), 'published'),
(12, 'Karachi', ST_SetSRID(ST_MakePoint(67.0104, 24.8608), 4326), 'published'),
(13, 'Tianjin', ST_SetSRID(ST_MakePoint(117.17667, 39.14222), 4326), 'published'),
(14, 'Delhi', ST_SetSRID(ST_MakePoint(77.23149, 28.65195), 4326), 'published'),
(15, 'Wuhan', ST_SetSRID(ST_MakePoint(114.26667, 30.58333), 4326), 'published'),
(16, 'Moscow', ST_SetSRID(ST_MakePoint(37.61556, 55.75222), 4326), 'published'),
(17, 'Dhaka', ST_SetSRID(ST_MakePoint(90.40744, 23.7104), 4326), 'published'),
(18, 'Seoul', ST_SetSRID(ST_MakePoint(126.9784, 37.566), 4326), 'published'),
(19, 'Dongguan', ST_SetSRID(ST_MakePoint(113.74866, 23.01797), 4326), 'published'),
(20, 'Cairo', ST_SetSRID(ST_MakePoint(31.24967, 30.06263), 4326), 'published'),
(21, 'Xi''an', ST_SetSRID(ST_MakePoint(108.92861, 34.25833), 4326), 'published'),
(22, 'Nanjing', ST_SetSRID(ST_MakePoint(118.77778, 32.06167), 4326), 'published'),
(23, 'Hangzhou', ST_SetSRID(ST_MakePoint(120.16142, 30.29365), 4326), 'published'),
(24, 'Foshan', ST_SetSRID(ST_MakePoint(113.13148, 23.02677), 4326), 'published'),
(25, 'Ho Chi Minh City', ST_SetSRID(ST_MakePoint(106.62965, 10.82302), 4326), 'published'),
(26, 'London', ST_SetSRID(ST_MakePoint(-0.12574, 51.50853), 4326), 'published'),
(27, 'New York', ST_SetSRID(ST_MakePoint(-74.00597, 40.71427), 4326), 'published'),
(28, 'Jakarta', ST_SetSRID(ST_MakePoint(106.84513, -6.21462), 4326), 'published'),
(29, 'Bengaluru', ST_SetSRID(ST_MakePoint(77.59369, 12.97194), 4326), 'published'),
(30, 'Tokyo', ST_SetSRID(ST_MakePoint(139.69171, 35.6895), 4326), 'published'),
(31, 'Hanoi', ST_SetSRID(ST_MakePoint(105.84117, 21.0245), 4326), 'published'),
(32, 'Taipei', ST_SetSRID(ST_MakePoint(121.53185, 25.04776), 4326), 'published'),
(33, 'Lima', ST_SetSRID(ST_MakePoint(-77.02824, -12.04318), 4326), 'published'),
(34, 'Bogotá', ST_SetSRID(ST_MakePoint(-74.08175, 4.60971), 4326), 'published'),
(35, 'Hong Kong', ST_SetSRID(ST_MakePoint(114.17469, 22.27832), 4326), 'published'),
(36, 'Chongqing', ST_SetSRID(ST_MakePoint(106.55771, 29.56026), 4326), 'published'),
(37, 'Baghdad', ST_SetSRID(ST_MakePoint(44.40088, 33.34058), 4326), 'published'),
(38, 'Qingdao', ST_SetSRID(ST_MakePoint(120.38042, 36.06488), 4326), 'published'),
(39, 'Tehran', ST_SetSRID(ST_MakePoint(51.42151, 35.69439), 4326), 'published'),
(40, 'Shenyang', ST_SetSRID(ST_MakePoint(123.43278, 41.79222), 4326), 'published'),
(41, 'Hyderabad', ST_SetSRID(ST_MakePoint(78.45636, 17.38405), 4326), 'published'),
(42, 'Rio de Janeiro', ST_SetSRID(ST_MakePoint(-43.18223, -22.90642), 4326), 'published'),
(43, 'Suzhou', ST_SetSRID(ST_MakePoint(120.59538, 31.30408), 4326), 'published'),
(44, 'Ahmedabad', ST_SetSRID(ST_MakePoint(72.58727, 23.02579), 4326), 'published'),
(45, 'Abidjan', ST_SetSRID(ST_MakePoint(-4.00167, 5.35444), 4326), 'published'),
(46, 'Lahore', ST_SetSRID(ST_MakePoint(74.35071, 31.558), 4326), 'published'),
(47, 'Singapore', ST_SetSRID(ST_MakePoint(103.85007, 1.28967), 4326), 'published'),
(48, 'Johannesburg', ST_SetSRID(ST_MakePoint(28.04363, -26.20227), 4326), 'published'),
(49, 'Dar es Salaam', ST_SetSRID(ST_MakePoint(39.26951, -6.82349), 4326), 'published'),
(50, 'Saint Petersburg', ST_SetSRID(ST_MakePoint(30.31413, 59.93863), 4326), 'published');

-- Reset the sequence to continue from the last inserted ID
SELECT setval('cities_id_seq', (SELECT MAX(id) FROM cities));

COMMIT;

-- Verify the data was inserted
SELECT id, name, ST_AsText(location) as location_text, status 
FROM cities 
ORDER BY id 
LIMIT 10;