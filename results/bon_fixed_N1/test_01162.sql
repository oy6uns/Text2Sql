SELECT pilot_name, MAX(age) AS max_age
FROM PilotSkills
GROUP BY pilot_name;
