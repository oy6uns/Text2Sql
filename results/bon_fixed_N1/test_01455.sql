SELECT datestamp, property_name
FROM User_Property_History
JOIN Properties ON User_Property_History.property_id = Properties.property_id
ORDER BY datestamp;
