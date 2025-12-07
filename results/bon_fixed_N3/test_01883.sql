SELECT c.Name, COALESCE(pkg_count, 0) AS NumberOfPackages
FROM Client c
LEFT JOIN (
    SELECT Recipient, COUNT(*) AS pkg_count
    FROM Package
    GROUP BY Recipient
) p ON c.AccountNumber = p.Recipient
WHERE COALESCE(pkg_count, 0) = (
    SELECT MIN(pkg_counts)
    FROM (
        SELECT COUNT(*) AS pkg_counts
        FROM Package
        GROUP BY Recipient
        UNION ALL
        SELECT 0
        FROM Client
        WHERE AccountNumber NOT IN (SELECT DISTINCT Recipient FROM Package)
    ) AS counts
)
