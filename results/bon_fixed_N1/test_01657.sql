SELECT institution.Name, Championship.Nickname
FROM institution
LEFT JOIN Championship ON institution.Institution_ID = Championship.Institution_ID;
