SELECT * 
FROM cities 
WHERE population > 150000 
AND population <= 350000 
AND region IN ('E', 'W', 'N') 
ORDER BY name 
LIMIT 20;
