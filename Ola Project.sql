USE Ola;

-- Q1: Retrieve all successful bookings:
SELECT * FROM bookings 
WHERE booking_status = 'Success';

-- Q2: Find the average ride distance from each vechicle type:
SELECT 
	vehicle_type, 
	AVG(ride_distance) AS avg_ride_distance 
FROM bookings 
GROUP BY vehicle_type;

-- Q3: Get the total number of canceled rides by customers
SELECT COUNT(*) FROM bookings 
WHERE booking_status = 'Canceled by Customer';

-- Q4: List the top 5 Customers who booked the highest number of rides:
SELECT 
	customer_id, 
	COUNT(booking_id) AS total_rides
FROM bookings 
GROUP BY customer_id 
ORDER BY total_rides DESC LIMIT 5;

-- Q5: Get the number of rides canceled by drivers due to personal and car-related issues:
SELECT 
    COUNT(*) AS total_rides
FROM bookings 
WHERE canceled_rides_by_driver = 'personal & car related issue';

-- Q6: Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT 
	MAX(customer_rating) AS Maximum_rating,
    MIN(customer_rating) AS Minimum_rating 
FROM bookings 
WHERE vehicle_type = 'Prime Sedan';

-- Q7: Retrieve all rides where payment was made up using UPI:
SELECT * FROM bookings 
WHERE payment_method = 'UPI';

-- Q8: Find the average customer rating per vehicle type:
SELECT 
	vehicle_type, 
	AVG(customer_rating) AS average_customer_rating
FROM bookings
GROUP BY vehicle_type;

-- Q9: Calculate the total booking value of rides completed successfully:
SELECT 
	SUM(booking_value) AS total_successful_value
FROM bookings 
WHERE booking_status = 'Success';

-- Q10: List all incomplete rides along with the reason:
SELECT 
	booking_id,
	incomplete_rides_reason 
	FROM bookings 
WHERE incomplete_rides = 'Yes';