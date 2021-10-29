USE sakila;


-- TASK 1:
-- Fill in the blanks (denoted by <#>) for the following query to obtain the results that follow
-- Answers: <1> a
-- 			<2> ct.city_id

SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
	INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
WHERE a.district = 'California';


-- TASK 2:
-- Write a query that returns the title of every film in which an actor with the first name JOHN appeared.

SELECT f.title, act.first_name, act.last_name
FROM film f
	INNER JOIN film_actor fa
    ON f.film_id = fa.film_id
    INNER JOIN actor act
    ON fa.actor_id = act.actor_id
 WHERE act.first_name = 'JOHN';
   
-- SOME SANITY CHECKS to verify that the above code is correct - it has returned 29 rows, all films featuring John Suvari
-- By looking up all the actors, I can see that there is only one actor named JOHN (SUVARI), with actor_id 192
SELECT *
FROM actor;

-- By looking up John Suvari by his acting_id in the film_actor table, I can see he appeared in 29 films 
SELECT *
FROM film_actor
WHERE actor_id = 192;   
    
    
-- TASK 3:
-- Construct a query that finds and returns all addresses which are in the same city.
-- You will need to join the address table to itself, and each row should include 2 different addresses.

SELECT a.address Address_1, a2.address Address_2, a.city_id
FROM address a
	INNER JOIN address a2
    ON a.city_id = a2.city_id
WHERE NOT (a.address = a2.address);    
	
    
    
