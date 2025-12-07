SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages);
