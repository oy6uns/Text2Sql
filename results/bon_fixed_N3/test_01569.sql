SELECT Id FROM goods WHERE Food = 'Cookie' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Croissant')
