SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region);
