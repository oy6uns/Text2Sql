SELECT institution.Institution_Name, COUNT(staff.staff_ID) AS number_of_staff
FROM institution
LEFT JOIN staff ON institution.Institution_ID = staff.Institution_ID
WHERE institution.Founded > 1800
GROUP BY institution.Institution_Name;
