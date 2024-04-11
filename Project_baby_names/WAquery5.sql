/*
Most Popular Gender-Neutral Names in Washington:
This SQL query retrieves the total count of babies by gender for names that are recorded for both 
genders in Washington state. It first identifies names that are present for both genders by using 
a subquery with a HAVING clause to filter for names with distinct genders greater than one. 
Then, it groups the data by first name and gender, summing up the counts, and orders the results 
by the total count of babies in descending order. The purpose is to analyze the distribution of 
these gender-neutral or unisex names in Washington state.
*/

SELECT name, gender, SUM(count) AS total_babies
FROM names
WHERE state = 'WA' AND name IN (
  SELECT name
  FROM names
  WHERE state = 'WA'
  GROUP BY name
  HAVING COUNT(DISTINCT gender) > 1
)
GROUP BY name, gender
ORDER BY total_babies DESC;
