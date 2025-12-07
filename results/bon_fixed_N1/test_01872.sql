SELECT DISTINCT PackageNumber
FROM Package
WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
   OR Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
