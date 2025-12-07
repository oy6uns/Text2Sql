SELECT p.Contents
FROM Package p
JOIN Client c ON p.Sender = c.AccountNumber
WHERE c.Name = 'John Zoidfarb'
