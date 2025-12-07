SELECT Driver_Name
FROM driver
WHERE Driver_ID NOT IN (
    SELECT Driver_ID
    FROM race
    WHERE Pole_Position = 'James Hinchcliffe'
)
