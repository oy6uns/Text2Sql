SELECT i.Institution_ID, s.name
FROM institution i
JOIN staff s ON i.Institution_ID = s.Institution_ID
WHERE i.Founded > 1800;
