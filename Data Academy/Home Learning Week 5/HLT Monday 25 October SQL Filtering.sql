USE sakila;

-- TASK 1: 
-- Which of the payment IDs would be returned by the following filter conditions?
-- customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23')

-- Answer:  All payment ID's that correspond to any customer ID number other than 5, AND
--          where either the payment amount is larger than 8 OR the payment date is 2005-08-23

SELECT payment_id, customer_id, amount, DATE(payment_date)
FROM payment
WHERE customer_id <> 5 AND (amount > 8 OR DATE(payment_date) = '2005-08-23');


-- TASK 2:
-- Which of the payments IDs would be returned by the following filter condition?
-- customer_id = 5 AND NOT(amount > 6 OR date(payment_date) = '2005-06-19')

-- Answer:  Only payment IDs that correspond to the customer ID number 5, but EXCLUDING those payment IDs where
--          the amount is greater than 6 OR
--          the payment date is 2005-06-19

SELECT payment_id, customer_id, amount, DATE(payment_date)
FROM payment
WHERE customer_id = 5 AND NOT(amount > 6 OR DATE(payment_date) = '2005-06-19');


-- TASK 3:
-- Construct a query that retrieves all rows from the Payment table where the amount is either 1.98, 7.98 or 9.98.

SELECT *
FROM payment
WHERE amount IN (1.98,7.98,9.98);


-- TASK 4:
-- Construct a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.

SELECT first_name, last_name
FROM customer
WHERE last_name LIKE '_A%W%';