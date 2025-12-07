SELECT c.Name, COALESCE(pkg_count.NumPackages, 0) AS NumPackages
FROM Client c
LEFT JOIN (
    SELECT Recipient, COUNT(*) AS NumPackages
    FROM Package
    GROUP BY Recipient
) pkg_count ON c.AccountNumber = pkg_count.Recipient
WHERE COALESCE(pkg_count.NumPackages, 0) = (
    SELECT MIN(COALESCE(pkg_count_inner.NumPackages, 0))
    FROM (
        SELECT Recipient, COUNT(*) AS NumPackages
        FROM Package
        GROUP BY Recipient
    ) pkg_count_inner
    RIGHT JOIN Client c2 ON c2.AccountNumber = pkg_count_inner.Recipient
    OR pkg_count_inner.Recipient IS NULL
)
