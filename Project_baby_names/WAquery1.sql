-- Most Popular Names in Washington Over All Time

SELECT name, state, SUM(count) AS total_babies
FROM names
WHERE state = 'WA'
GROUP BY name, state
ORDER BY total_babies DESC
LIMIT 10;
