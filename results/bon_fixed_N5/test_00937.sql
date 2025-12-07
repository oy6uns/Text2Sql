SELECT DISTINCT h1.Class
FROM headphone h1
JOIN headphone h2 ON h1.Class = h2.Class
WHERE h1.Earpads = 'Bowls' AND h2.Earpads = 'Comfort Pads'
