SELECT COUNT(*) 
FROM Staff s
WHERE NOT EXISTS (
    SELECT 1 
    FROM Staff_in_Meetings sim 
    WHERE sim.staff_id = s.staff_id
);
