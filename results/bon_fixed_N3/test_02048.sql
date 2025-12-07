SELECT document_id FROM Documents
WHERE document_id NOT IN (SELECT DISTINCT document_id FROM Documents_Processes);
