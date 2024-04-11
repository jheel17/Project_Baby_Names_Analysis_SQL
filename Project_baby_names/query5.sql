/*
The Alexis expansion:
- This SQL query retrieves the count of babies named Alexis each year, alongside a cumulative count 
of Alexis over the years. 
- It utilizes the SUM(count) OVER (ORDER BY year) window function to calculate the cumulative total. 
- The purpose is to track the popularity trend of the name Alexis over time by examining its yearly 
counts and cumulative count.
*/

SELECT year, name, count, SUM(count) OVER (ORDER BY year) AS cumulative_olivias
FROM names
WHERE name = 'Alexis'
ORDER BY year;
    