SELECT Institution_Name, COUNT(staff_ID) AS number_of_staff
FROM institution
LEFT JOIN staff ON institution.Institution_ID = staff.Institution_ID
WHERE Founded > 1800
GROUP BY Institution_Name;
