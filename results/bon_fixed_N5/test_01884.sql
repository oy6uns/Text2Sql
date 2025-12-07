SELECT Recipient, COUNT(*) AS PackageCount
FROM Package
GROUP BY Recipient
ORDER BY PackageCount ASC
LIMIT 1;
