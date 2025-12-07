SELECT institution.Name
FROM institution
LEFT JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
ORDER BY COALESCE(Championship.Number_of_Championships, 0) DESC;
