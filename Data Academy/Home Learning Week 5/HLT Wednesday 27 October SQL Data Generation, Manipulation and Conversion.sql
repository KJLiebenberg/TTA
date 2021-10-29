-- TASK 1:
-- Write a query that returns the 17 through 25 characters of the string 'Please find the substring'.

SELECT SUBSTRING('Please find the substring in this string', 17, 9) String_Portion;


-- TASK 2:
-- Write a query that returns the absolute value and sign(-1, 0 or 1) of the number -25.76823.alter

SELECT abs(-25.76823) absolute_value, sign(-25.76823) sign;


-- TASK 3:
-- Write a query to return just the month portion of the current date.alter

-- Gives month as a number:
SELECT EXTRACT(MONTH FROM CURRENT_DATE()) Current_Month;

-- Gives month name:
SELECT MONTHNAME(CURRENT_DATE()) Current_Month;
