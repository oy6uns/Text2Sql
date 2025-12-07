SELECT Team FROM team t LEFT JOIN team_driver td ON t.Team_ID = td.Team_ID WHERE td.Driver_ID IS NULL;
