SELECT process_id, COUNT(DISTINCT document_id) AS document_count
FROM Documents_Processes
GROUP BY process_id;
