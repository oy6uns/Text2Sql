SELECT countries.name AS country_name, languages.name AS official_language
FROM countries
JOIN official_languages ON countries.id = official_languages.country_id
JOIN languages ON official_languages.language_id = languages.id;
