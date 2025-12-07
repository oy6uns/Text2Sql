SELECT Model
FROM headphone
WHERE Price < (SELECT AVG(Price) FROM headphone);
