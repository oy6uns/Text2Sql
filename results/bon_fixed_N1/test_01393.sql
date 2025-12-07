SELECT name FROM languages WHERE id NOT IN (SELECT DISTINCT language_id FROM official_languages);
