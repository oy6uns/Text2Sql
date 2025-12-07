SELECT Name, AVG(Year_Profits_billion) AS Avg_Yearly_Profit, MAX(Year_Profits_billion) AS Max_Yearly_Profit
FROM press
GROUP BY Name;
