SELECT institution.Name, Championship.Nickname
FROM institution
JOIN Championship ON institution.Institution_ID = Championship.Institution_ID;
