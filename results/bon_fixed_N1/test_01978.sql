SELECT Name, AVG(Year_Profits_billion) AS Average_Yearly_Profit, MAX(Year_Profits_billion) AS Maximum_Yearly_Profit
FROM press
GROUP BY Name;
