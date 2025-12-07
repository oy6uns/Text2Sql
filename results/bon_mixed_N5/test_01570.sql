SELECT Id FROM goods WHERE Food = 'cookie' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'croissant')
