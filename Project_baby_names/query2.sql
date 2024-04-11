/*
Timeless or trendy?

This SQL query calculates the total count of babies for each unique first name in the names 
table and categorizes them based on their historical popularity. 

Names appearing in over 80 years are labeled as "Classic", between 50 and 80 years as "Semi-classic", between 20 and 49 years as 
"Semi-trendy", and any name appearing in fewer than 20 years is labeled as "Trendy". 
The purpose is to analyze the historical popularity trends of different names.
*/

SELECT Name, SUM(Count) AS total_babies,
  CASE
    WHEN COUNT(DISTINCT Year) > 80 THEN 'Classic'
    WHEN COUNT(DISTINCT Year) BETWEEN 50 AND 80 THEN 'Semi-classic'
    WHEN COUNT(DISTINCT Year) BETWEEN 20 AND 49 THEN 'Semi-trendy'
    ELSE 'Trendy'
  END AS popularity_type
FROM names
GROUP BY Name
ORDER BY Name;

