SELECT state, COUNT(city_code) AS number_of_cities FROM City GROUP BY state ORDER BY state;
