--
--
-- KnightBites
-- @author lvym5 (Lily McAboy)
-- @version October, 2024


/*
DROP TABLE IF EXISTS diningFood;
DROP TABLE IF EXISTS userprofiles;
DROP TABLE IF EXISTS diningfoodratings;
*/


CREATE TABLE diningfood (
	FoodName varchar(50) PRIMARY KEY,
	DiningHall varchar(50),
	Breakfast boolean,
	Lunch boolean,
	Dinner boolean,
	MealTime varchar(50),
	Vegan boolean,
	Vegetarian boolean,
	Halal boolean,
	Description varchar(250)
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


