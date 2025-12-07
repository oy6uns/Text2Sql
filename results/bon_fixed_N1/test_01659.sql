SELECT Nickname FROM Championship WHERE Institution_ID = (SELECT Institution_ID FROM institution ORDER BY Enrollment ASC LIMIT 1)
