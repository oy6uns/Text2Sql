SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship WHERE Number_of_Championships > 0);
