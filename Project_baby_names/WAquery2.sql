--Trendiest Names in Washington
--A "trendy" name might be defined as one that was not popular before but saw a spike in popularity 
-- in more recent years.


SELECT name, year, count
FROM names
WHERE state = 'WA'
ORDER BY year DESC, count DESC
LIMIT 10;
