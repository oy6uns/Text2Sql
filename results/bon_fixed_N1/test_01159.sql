SELECT plane_name, pilot_name
FROM PilotSkills ps1
WHERE age = (
  SELECT MAX(age)
  FROM PilotSkills ps2
  WHERE ps2.plane_name = ps1.plane_name
)
