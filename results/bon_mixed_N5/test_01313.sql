SELECT DISTINCT location FROM Paintings WHERE year < 1885 AND (mediumOn IS NULL OR LOWER(mediumOn) != 'canvas');
