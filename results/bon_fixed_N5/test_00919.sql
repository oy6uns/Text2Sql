SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone);
