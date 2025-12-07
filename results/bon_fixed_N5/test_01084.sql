SELECT DISTINCT s.name
FROM staff s
JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID AND cp1.role = 'speaker'
JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID AND cp2.role = 'sponsor'
WHERE cp1.Conference_ID = cp2.Conference_ID;
