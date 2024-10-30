--
--
-- KnightBites
-- @author lvym5 (Lily McAboy)
-- @version October, 2024

DROP TABLE IF EXISTS diningFood;

CREATE TABLE diningFood (
	FoodName varchar(50),
	DiningHall varchar(50),
	MealTime varchar(50),
	Vegan integer,
	Vegetarian integer,
	Halal integer
	);

GRANT SELECT ON diningFood TO PUBLIC;


