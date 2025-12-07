SELECT uph.datestamp, p.property_name
FROM User_Property_History uph
JOIN Properties p ON uph.property_id = p.property_id
ORDER BY uph.datestamp;
