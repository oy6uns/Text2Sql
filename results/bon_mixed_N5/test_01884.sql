SELECT Client.Name, COUNT(*) AS PackageCount
FROM Package
JOIN Client ON Package.Recipient = Client.AccountNumber
GROUP BY Client.Name
HAVING COUNT(*) = (
    SELECT MIN(PackageCounts)
    FROM (
        SELECT COUNT(*) AS PackageCounts
        FROM Package
        GROUP BY Recipient
    ) AS Counts
)
