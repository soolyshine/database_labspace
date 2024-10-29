SELECT * 
FROM cities 
WHERE region NOT IN ('E', 'W') 
ORDER BY population DESC 
LIMIT 10 OFFSET 10;
