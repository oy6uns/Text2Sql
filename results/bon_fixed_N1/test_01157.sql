SELECT plane_name, pilot_name
FROM (
  SELECT plane_name, pilot_name, age,
         ROW_NUMBER() OVER (PARTITION BY plane_name ORDER BY age DESC) AS rn
  FROM PilotSkills
) sub
WHERE rn = 1
ORDER BY plane_name;
