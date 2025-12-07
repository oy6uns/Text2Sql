SELECT process_id
FROM Business_Processes
WHERE process_id NOT IN (
    SELECT DISTINCT process_id
    FROM Documents_Processes
)
