/*
Top-ranked Female Names Since 1920:
This SQL query ranks the top 10 female first names by their total count of babies born since 1920, 
grouping by first name and filtering for female gender. 
The RANK() function assigns a rank to each name based on its total count of babies, ordered in descending order. 
The purpose is to identify the most popular female names since 1910.
*/

SELECT RANK() OVER (ORDER BY SUM(count) DESC) AS name_rank, name, SUM(count) AS total_babies
FROM names
WHERE year >= 1910 AND gender = 'F'
GROUP BY name
ORDER BY total_babies DESC
LIMIT 10;
