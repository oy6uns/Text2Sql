SELECT UPH.datestamp, P.property_name
FROM User_Property_History UPH
JOIN Properties P ON UPH.property_id = P.property_id
ORDER BY UPH.datestamp;
