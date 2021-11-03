use sakila;


-- TASK 1:
-- Construct a query that counts the number of rows in the payment table.

SELECT COUNT(*)
FROM payment;


-- TASK 2:
-- Modify your query from question 1 to count the number of payments made by each customer.
-- Show the customer ID and the total amount paid for each customer.

SELECT customer_id, 
	SUM(amount) Customer_Total,
    COUNT(*) Number_of_payments
FROM payment
GROUP BY customer_id;


-- TASK 3:
-- Modify your query from question 2 to include only those customers having made at least 5 payments.

SELECT customer_id, 
	SUM(amount) Customer_Total,
    COUNT(*) Number_of_payments
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 5;	-- The same 599 rows are returned as all customers made more than 5 payments.


-- TASK 4:
-- Create the table Sales_Fact. 
-- Write a query that retrieves every row from Sales_Fact, and add a column to generate a ranking based on the tot_sales column values.
-- The highest value should reveive the ranking of 1, and the lowest a ranking of 24.

CREATE TABLE Sales_Fact (
    year_no YEAR,
    month_no SMALLINT UNSIGNED,
    tot_sales INT,
    CONSTRAINT pk_Sales_Fact PRIMARY KEY (year_no, month_no)
);

INSERT INTO Sales_Fact (
	year_no, month_no, tot_sales)
VALUES (2019, 1, 19228),
    (2019, 2, 18554),
    (2019, 3, 17325),
    (2019, 4, 13221),
    (2019, 5, 9964),
    (2019, 6, 12658),
    (2019, 7, 14233),
    (2019, 8, 17342),
    (2019, 9, 16853),
    (2019, 10, 17121),
    (2019, 11, 19095),
    (2019, 12, 21436),
    (2020, 1, 20347),
    (2020, 2, 17434),
    (2020, 3, 16225),
    (2020, 4, 13853),
    (2020, 5, 14589),
    (2020, 6, 13248),
    (2020, 7, 8728),
    (2020, 8, 9378),
    (2020, 9, 11467),
    (2020, 10, 13842),
    (2020, 11, 15742),
    (2020, 12, 18636);
    
    SELECT *
    FROM Sales_Fact;   -- Confirm table has been created successfully and correctly populated

SELECT year_no, 
	month_no,
	tot_sales,
    RANK() OVER (ORDER BY tot_sales DESC) sales_rank
FROM Sales_Fact;


-- TASK 5:
-- Modify the query from question 4 to generate two sets of rankings from 1 to 12, one for 2019 data and one for 2020.

SELECT year_no, 
	month_no,
	tot_sales,
    RANK() OVER (PARTITION BY (year_no) ORDER BY tot_sales DESC) sales_rank
FROM Sales_Fact;


-- TASK 6: 
-- Write a query that retrieves all 2020 data, and include a column which will contain the tot_sales value from the previous month.
    
SELECT *,
	LAG(tot_sales, 1) 
    OVER (ORDER BY month_no) Previous_Month_Total_Sales
FROM Sales_Fact
WHERE year_no = 2020;

 