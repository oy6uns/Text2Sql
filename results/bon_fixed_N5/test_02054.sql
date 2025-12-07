SELECT staff_id, COUNT(*) AS document_process_count
FROM Staff_in_Processes
GROUP BY staff_id;
