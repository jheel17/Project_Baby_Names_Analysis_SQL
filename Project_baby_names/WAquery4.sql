/* Washington's Unique Name Trends Over the Decades:
This SQL query identifies names that have experienced significant increases in popularity in 
Washington state over each decade. It achieves this by first grouping the data by first name and
decade, calculating the total count of babies for each combination. Then, it assigns ranks to 
names within each decade based on their total count of babies. Finally, it selects the top 10 
ranked names for each decade and orders the results by decade and rank. The purpose is to track 
and analyze trends in the popularity of baby names over different decades specifically in 
Washington state.
*/

WITH DecadePopularity AS (
  SELECT name, (year / 10) * 10 AS decade, SUM(count) AS total_babies
  FROM names
  WHERE state = 'WA'
  GROUP BY name, decade
),
DecadeRank AS (
  SELECT name, decade, total_babies,
         RANK() OVER (PARTITION BY decade ORDER BY total_babies DESC) AS rank
  FROM DecadePopularity
)
SELECT decade, name, total_babies
FROM DecadeRank
WHERE rank <= 10
ORDER BY decade, rank;


