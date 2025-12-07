SELECT pilot_name
FROM PilotSkills
WHERE age < (SELECT AVG(age) FROM PilotSkills)
ORDER BY age ASC;
