/*
Many males with the same name: 
This SQL query retrieves the maximum count of babies born in a given year with a male gender. 
It groups the data by year and calculates the maximum count for each year. 
The purpose is to identify the top 10 number of male births in each year, providing insights into 
 trends or fluctuations in male baby names popularity over time.
*/

SELECT
    Year,
    MAX(Count) as max_num
FROM names
WHERE Gender = 'M'
GROUP BY Year
ORDER BY max_num desc
LIMIT 10;
