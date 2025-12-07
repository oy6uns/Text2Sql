SELECT agency_id, agency_details 
FROM Agencies 
WHERE agency_id IN (SELECT DISTINCT agency_id FROM Clients);
