
/*
Picking a baby name:
This SQL query retrieves the total count of babies born with female names ending in "s" after 
the year 2010. It groups the names by their first_name, sums up the counts, and orders the results 
by the total count of babies in descending order. 
The purpose is to identify popular female names ending in "s" in recent years.
*/

SELECT name, SUM(count) AS total_babies
FROM names
WHERE gender = 'F' AND year > 2010 AND name LIKE '%s'
GROUP BY name
ORDER BY total_babies DESC;
