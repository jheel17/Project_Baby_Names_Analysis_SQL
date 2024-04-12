/*Names Unique to Washington
This SQL query identifies the top 10 names in Washington state with the highest total count of 
babies, filtering out names that appear in other states. It achieves this by first calculating the 
total count of babies for each name in Washington (WA), then joining it with the total count of 
babies for each name in other states (Other). Finally, it selects names that only appear in
Washington by filtering out those where the name is null in the Other table, and orders the 
results by total babies count in descending order. The purpose is to determine the most unique 
and popular names specifically in Washington state.
*/
SELECT WA.name, WA.total_babies
FROM (
  SELECT name, SUM(count) AS total_babies
  FROM names
  WHERE state = 'WA'
  GROUP BY name
) AS WA
LEFT JOIN (
  SELECT name, SUM(count) AS total_babies
  FROM names
  WHERE state <> 'WA'
  GROUP BY name
) AS Other ON WA.name = Other.name
WHERE Other.name IS NULL
ORDER BY WA.total_babies DESC;
