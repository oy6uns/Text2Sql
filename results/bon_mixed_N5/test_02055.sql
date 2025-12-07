SELECT staff_role_code, COUNT(*) AS document_process_count
FROM Staff_in_Processes
GROUP BY staff_role_code
ORDER BY staff_role_code;
