-- Feature ENgineering --
-- time_of_day --

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales
SET time_of_day = (CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
		ELSE "Evening"
        END);


-- day_name --
SELECT 
	date, 
    DAYNAME(date) as day_name
from sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);
select * from sales;

SELECT 
	date,
    MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);
select * from sales;




