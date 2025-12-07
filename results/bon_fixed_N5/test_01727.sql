SELECT Code FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks')
