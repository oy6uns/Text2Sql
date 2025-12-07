SELECT b.Address, r.Capital
FROM building b
JOIN region r ON b.Region_ID = r.Region_ID;
