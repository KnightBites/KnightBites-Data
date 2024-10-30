--
--
-- KnightBites
-- @author lvym5 (Lily McAboy)
-- @version October, 2024

DROP TABLE IF EXISTS diningFood;
DROP TABLE IF EXISTS 

CREATE TABLE diningfood (
	FoodName varchar(50) PRIMARY KEY,
	DiningHall varchar(50),
	MealTime varchar(50),
	Vegan integer,
	Vegetarian integer,
	Halal integer
	);

CREATE TABLE userprofiles (
	Email varchar(50) PRIMARY KEY, 
	Username varchar(50), 
	UserPassword varchar(50)
);

CREATE TABLE diningfoodratings(
	FoodName varchar(50) REFERENCES diningfood(FoodName), 
	DiningHall varchar(50), 
	Rating float(24)
	);

GRANT SELECT ON diningfood TO PUBLIC;
GRANT SELECT ON userprofiles TO PUBLIC;
GRANT SELECT ON diningfoodratings TO PUBLIC;


