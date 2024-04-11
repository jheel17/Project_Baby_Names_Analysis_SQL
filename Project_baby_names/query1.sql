/*
Classic American Names:
This SQL query aims to identify TOP 10 popular baby names by calculating the total count of babies with 
each name from 1910 to 2014, filtering for names consistently present across all 105 years, 
and sorting the results by total count in descending order.
*/

SELECT Name, SUM(Count) AS total_babies
FROM names
WHERE year BETWEEN 1910 AND 2014
GROUP BY Name 
HAVING COUNT(DISTINCT Year) = 105
ORDER BY total_babies DESC
LIMIT 10;


