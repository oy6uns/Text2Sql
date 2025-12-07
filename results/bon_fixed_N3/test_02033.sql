SELECT bp_next.process_name
FROM Business_Processes bp_current
JOIN Business_Processes bp_next ON bp_current.next_process_id = bp_next.process_id
WHERE bp_current.process_id = 9;
