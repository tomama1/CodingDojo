SELECT name, language, percentage FROM countries
LEFT JOIN languages
ON languages.country_code = countries.code
WHERE language = 'Slovene'
ORDER BY percentage DESC;

SELECT countries.name, COUNT(cities.name) AS counts
FROM countries
JOIN cities
ON cities.country_code = countries.code
GROUP BY (countries.name);

SELECT countries.name, cities.name, cities.population 
FROM countries
LEFT JOIN cities
ON cities.country_code = countries.code
WHERE cities.population > 500000 AND countries.name = 'Mexico'
ORDER BY population DESC;

SELECT name, language, percentage
FROM countries
LEFT JOIN languages
ON languages.country_code = countries.code
WHERE percentage > 89
ORDER BY percentage DESC;

SELECT name 
FROM countries
WHERE surface_area < 501 AND population > 100000

SELECT name 
FROM countries
WHERE government_form = "Constitutional Monarchy" AND life_expectancy > 75 AND capital > 200

SELECT countries.name, cities.name AS city, cities.district, cities.population
FROM countries
LEFT JOIN cities
ON cities.country_code = countries.code
WHERE countries.name = "Argentina" AND cities.district = "Buenos Aires" AND cities.population > 500000;

SELECT region, COUNT(name)
FROM countries
GROUP BY region
ORDER BY COUNT(name) DESC;

