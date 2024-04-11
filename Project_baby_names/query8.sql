/*
The most years at number one:
This SQL query retrieves the most popular male baby name for each year, along with its count, 
by joining the baby_names table with a subquery MaxNamePerYear which identifies the maximum count
of male names per year. It then filters results to include only male names and orders them by year 
in descending order. The purpose is to analyze the yearly trends in the popularity of male baby 
names, highlighting the most popular name for each year.
*/

WITH TopNamePerYear AS (
  SELECT year, name, RANK() OVER (PARTITION BY year ORDER BY count DESC) AS rank
  FROM names
  WHERE gender = 'M'
),
NumberOneNames AS (
  SELECT name
  FROM TopNamePerYear
  WHERE rank = 1
)
SELECT name, COUNT(*) AS count_top_name
FROM NumberOneNames
GROUP BY name
ORDER BY count_top_name DESC;
