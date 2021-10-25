USE sakila;

-- TASK 1:
-- Retrieve the actor ID, first name and last name for all actors.
-- Sort by last name and then by first name.

SELECT actor_id, first_name, last_name
FROM actor
ORDER BY last_name, first_name;


-- TASK 2:
-- Retrieve the actor ID, first name and last name for all actors whose last name equals 'WILLIAMS' or 'DAVIS'.

SELECT actor_id, first_name, last_name
FROM actor
WHERE (last_name = 'WILLIAMS' OR last_name = 'DAVIS')
ORDER BY last_name, first_name;


-- TASK 3:
-- Write a query against the rental table that returns the IDs of the customers who rented a film on July 5th 2005.
-- Use the rental.rental_date column, and you can use the date() function to ignore the time component.
-- Include a single row for each distinct customer ID.alter

SELECT DISTINCT customer_id, DATE(rental_date)
FROM rental
WHERE DATE(rental_date) = '2005-07-05'
ORDER BY customer_id;


-- TASK 4:
-- Fill in the blanks for this multi-table query to achieve the results shown below
-- <1> r
-- <2> r.customer_id
-- <3> DATE(r.return_date) DESC

SELECT c.email, r.return_date
FROM customer c
	INNER JOIN rental r
    ON c.customer_id = r.customer_id
	WHERE DATE(r.rental_date) = '2005-06-14'
ORDER BY DATE(r.return_date) DESC, TIME(r.return_date) DESC;
