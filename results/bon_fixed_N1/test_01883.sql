SELECT c.Name, COALESCE(pkg_counts.PackageCount, 0) AS NumberOfPackagesReceived
FROM Client c
LEFT JOIN (
    SELECT Recipient, COUNT(*) AS PackageCount
    FROM Package
    GROUP BY Recipient
) pkg_counts ON c.AccountNumber = pkg_counts.Recipient
WHERE COALESCE(pkg_counts.PackageCount, 0) = (
    SELECT MIN(pkg_count)
    FROM (
        SELECT COUNT(*) AS pkg_count
        FROM Package
        GROUP BY Recipient
        UNION ALL
        SELECT 0
        FROM Client c2
        LEFT JOIN Package p2 ON c2.AccountNumber = p2.Recipient
        WHERE p2.Recipient IS NULL
    )
)
