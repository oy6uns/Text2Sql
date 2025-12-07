SELECT bp.process_name
FROM Documents d
JOIN Documents_Processes dp ON d.document_id = dp.document_id
JOIN Business_Processes bp ON dp.process_id = bp.process_id
WHERE d.document_name = 'Travel to Brazil';
