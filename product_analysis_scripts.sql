-- Product --
-- Unique lines in product --
SELECT distinct product_line FROM sales;

-- Highest payment method used
SELECT payment_method, COUNT(payment_method) as pay_count
FROM sales
GROUP BY payment_method
ORDER BY pay_count DESC;

-- Cash is the most frequently used payment method with 344 records --

-- Most selling product line --
SELECT product_line, COUNT(product_line) as pl_count
FROM sales
GROUP BY product_line
ORDER BY pl_count DESC; 

-- Fashion Accessories is the most selling product line with 178 records --

-- Total Revenue by month --
SELECT
	month_name as month,
    SUM(total) as total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- January has the highest toal revenue of "116291.9680" $. --

-- What month has the largest COGs ? --
SELECT
	month_name as month,
    SUM(cogs) as total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- January has the highest COGs of "110754.16" $. --

-- Product line with largest revenue --
SELECT
	product_line,
    SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- Food and Beverages generated the highest revenue of "56144.844"$ --

-- City with the largest revenue --
SELECT
	branch,
	city,
    SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- Naypitaw is the city with the largest revenue of "110490.775" $ --

-- Product line with largest VAT --
SELECT
	product_line,
    AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- Home and lifestyle has the highest average VAT% of 16.03033% --

-- Which branch sold more products than average product sold? --
SELECT
	branch,
    SUM(quantity) as qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- Branch A has highest product sales of 1849  which is higher than average product sold. --

-- What is the most common product line by gender? --
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC; 

-- Fashion Accessories is the most common product line for females and Health and Beauty is the most common productline for Health and Beauty --

-- What is the average rating of each product line? --
SELECT
	product_line,
	ROUND(AVG(rating), 2) as avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- Food and beverages is the product line with the highest average rating of 7.11. --

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales --


