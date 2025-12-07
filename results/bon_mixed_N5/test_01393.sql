SELECT name FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id WHERE ol.language_id IS NULL;
