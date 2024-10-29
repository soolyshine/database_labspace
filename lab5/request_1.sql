SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region;
