SELECT name FROM countries WHERE id NOT IN (SELECT DISTINCT country_id FROM official_languages);
