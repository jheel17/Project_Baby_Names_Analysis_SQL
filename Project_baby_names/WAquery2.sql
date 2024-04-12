/*Trendiest Names in Washington:
A "trendy" name might be defined as one that was not popular before but saw a spike in popularity  
in more recent years.
The query calculates the average count of each name over all years before 2014 and compares it to 
the count in 2014 to find names that have become trendy.
This query creates three Common Table Expressions (CTEs):
RecentPopularity: to get the count of each name in 2014.
HistoricalPopularity: to get the average count of each name before 2014.
Trendiness: to combine the recent and historical counts and calculate the "trendiness factor", 
which is the difference between the recent count and the historical average count.
Finally, it selects names from the Trendiness CTE, orders them by their trendiness factor in 
descending order, and limits the results to the top 10. This would give you the names that are 
most trendy based on the criteria defined.
*/

WITH RecentPopularity AS (
  SELECT name, count
  FROM names
  WHERE year = 2014 AND state = 'WA'
),
HistoricalPopularity AS (
  SELECT name, AVG(count) as avg_count
  FROM names
  WHERE year < 2014 AND state = 'WA'
  GROUP BY name
),
Trendiness AS (
  SELECT rp.name, rp.count as recent_count, COALESCE(hp.avg_count, 0) as historical_avg
  FROM RecentPopularity rp
  LEFT JOIN HistoricalPopularity hp ON rp.name = hp.name
)
SELECT 
    name, 
    recent_count, 
    ROUND(historical_avg, 2) as historical_avg_count, 
    ROUND((recent_count - historical_avg), 2) AS trendiness_factor
FROM Trendiness
ORDER BY trendiness_factor DESC, recent_count DESC
LIMIT 10;
