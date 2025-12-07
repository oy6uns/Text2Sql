SELECT Code, Contents 
FROM Boxes 
WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
