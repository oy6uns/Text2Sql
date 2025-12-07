SELECT bp.process_id
FROM Business_Processes bp
LEFT JOIN Documents_Processes dp ON bp.process_id = dp.process_id
WHERE dp.document_id IS NULL;
