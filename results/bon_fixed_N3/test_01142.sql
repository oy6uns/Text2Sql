SELECT pilot_name, age
FROM PilotSkills
WHERE (plane_name = 'Piper Cub' AND age > 35)
   OR (plane_name = 'F-14 Fighter' AND age < 30);
