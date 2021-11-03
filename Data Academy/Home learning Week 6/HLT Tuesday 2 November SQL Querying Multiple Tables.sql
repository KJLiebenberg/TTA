USE sakila;

-- TASK 1:
-- Create a view definition that can be used by the following query to generate the given results (see slide 28).

-- Create the view combining data from 5 different tables: actor, film_actor, film, film_category and category.
CREATE VIEW film_ctgry_actor
	(title, 
     category_name, 
     first_name, 
     last_name
) AS
SELECT 
	f.title, 
    c.name, 
    a.first_name, 
    a.last_name
FROM actor a
	INNER JOIN film_actor fa
    ON a.actor_id = fa.actor_id
    INNER JOIN film f
    ON fa.film_id = f.film_id
    INNER JOIN film_category fc
    ON f.film_id = fc.film_id
    INNER JOIN category c
    ON fc.category_id = c.category_id;
    
-- Query code:
SELECT title, category_name, first_name, last_name
FROM film_ctgry_actor
WHERE last_name = 'FAWCETT';


-- TASK 2:
-- The film rental company manager would like to have a report that includes the name of every country, along with the total payments for all customers who live in each country.
-- Generate a view definition that queries the country table and uses a scalar subquery to calculate a value for a column named tot_payments.

CREATE VIEW Payments_by_country
	(Country,
    tot_payments
)AS
SELECT cn.country, sum(p.amount)
FROM payment p
	INNER JOIN customer c
	ON p.customer_id = c.customer_id
	INNER JOIN address a
	ON c.address_id = a.address_id
	INNER JOIN city ct
	ON a.city_id = ct.city_id
	INNER JOIN country cn
	ON ct.country_id = cn.country_id
GROUP BY country;

-- View report created by Payment_by_country view
SELECT Country, tot_payments Total_Payments
FROM Payments_by_country;

