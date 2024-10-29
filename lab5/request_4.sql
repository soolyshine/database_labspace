SELECT region, SUM(population) AS total_population
FROM cities
WHERE population > 300000
GROUP BY region;
