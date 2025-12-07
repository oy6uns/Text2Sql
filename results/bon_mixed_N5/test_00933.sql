SELECT Model, Class, Construction
FROM headphone
WHERE Price = (SELECT MIN(Price) FROM headphone);
