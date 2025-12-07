SELECT Uph.datestamp, P.property_name
FROM User_Property_History Uph
JOIN Properties P ON Uph.property_id = P.property_id
ORDER BY Uph.datestamp;
