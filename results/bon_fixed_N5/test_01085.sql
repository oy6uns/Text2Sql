SELECT DISTINCT s.name
FROM staff s
JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID
JOIN conference c1 ON cp1.Conference_ID = c1.Conference_ID
JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID
JOIN conference c2 ON cp2.Conference_ID = c2.Conference_ID
WHERE c1.Conference_Name = 'ACL'
  AND c2.Conference_Name = 'Naccl'
