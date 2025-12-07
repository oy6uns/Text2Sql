SELECT c.Name, COALESCE(pkg_count.PackageCount, 0) AS NumberOfPackagesReceived
FROM Client c
LEFT JOIN (
    SELECT Recipient, COUNT(*) AS PackageCount
    FROM Package
    GROUP BY Recipient
) pkg_count ON c.AccountNumber = pkg_count.Recipient
WHERE COALESCE(pkg_count.PackageCount, 0) = (
    SELECT MIN(COALESCE(pcount.PackageCount, 0)) FROM (
        SELECT Recipient, COUNT(*) AS PackageCount
        FROM Package
        GROUP BY Recipient
    ) pcount
    RIGHT JOIN Client cl ON pcount.Recipient = cl.AccountNumber
)
