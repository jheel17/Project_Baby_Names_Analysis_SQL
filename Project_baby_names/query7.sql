/*
Top male names over the years:
This SQL query identifies the most popular male baby names for each year by joining the baby_names 
table with a subquery MaxNamePerYear, which computes the maximum count of male names per year. 
It selects the year, first name, and count from table names where the count matches the maximum count
for that year. The purpose is to retrieve the most popular male baby name along with its count for each year, 
providing insight into yearly trends in male baby name popularity.
*/

WITH MaxNamePerYear AS (
  SELECT year, MAX(count) AS max_num
  FROM names
  WHERE gender = 'M'
  GROUP BY year
)
SELECT n.year, n.name, n.count
FROM names AS n
JOIN MaxNamePerYear mnpy ON n.year = mnpy.year AND n.count = mnpy.max_num
WHERE n.gender = 'M'
ORDER BY n.year DESC;
