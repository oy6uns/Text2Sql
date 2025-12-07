SELECT DISTINCT Winning_driver
FROM race
WHERE Pole_Position <> 'Junior Strous' AND Winning_driver IS NOT NULL;
