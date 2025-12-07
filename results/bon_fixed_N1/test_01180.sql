SELECT Area_km, Government_website FROM district WHERE Population = (SELECT MIN(Population) FROM district);
