SELECT po.process_outcome_description, ps.process_status_description
FROM Documents_Processes dp
JOIN Process_Outcomes po ON dp.process_outcome_code = po.process_outcome_code
JOIN Process_Status ps ON dp.process_status_code = ps.process_status_code
WHERE dp.document_id = 0;
