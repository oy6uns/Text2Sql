SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages);
