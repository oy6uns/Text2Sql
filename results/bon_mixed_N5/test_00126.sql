SELECT d.Name, d.Age
FROM director d
JOIN program p ON d.Director_ID = p.Director_ID
GROUP BY d.Director_ID, d.Name, d.Age
HAVING COUNT(*) = (
    SELECT MAX(program_count) FROM (
        SELECT COUNT(*) AS program_count
        FROM program
        GROUP BY Director_ID
    ) AS counts
)
