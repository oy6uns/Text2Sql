SELECT DISTINCT ps1.pilot_name
FROM PilotSkills ps1
LEFT JOIN PilotSkills ps2 ON ps1.pilot_name = ps2.pilot_name AND ps2.plane_name = 'B-52 Bomber'
WHERE ps1.plane_name = 'Piper Cub' AND ps2.pilot_name IS NULL
