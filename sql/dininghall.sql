--
--
-- KnightBites
-- @author lvym5 (Lily McAboy)
-- @version October, 2024



DROP TABLE IF EXISTS diningFood;
DROP TABLE IF EXISTS userprofiles;
DROP TABLE IF EXISTS diningfoodratings;

/*
To add an integer primary key
ALTER TABLE table_name 
ADD COLUMN id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY;
*/
CREATE TABLE diningfood (
	ID integer GENERATED ALWAYS AS IDENTITY,
	PRIMARY KEY(ID),
	FoodName varchar(50),
	DiningHall varchar(50),
	Breakfast boolean,
	Lunch boolean,
	Dinner boolean,
	MealTime varchar(50),
	Vegan boolean,
	Vegetarian boolean,
	Halal boolean,
	Description varchar(500),
	overallRating float(24)
	);

CREATE TABLE userprofiles (
	ID integer GENERATED ALWAYS AS IDENTITY,
	PRIMARY KEY(ID),
	Email varchar(50), 
	Username varchar(50), 
	UserPassword varchar(50),
	veganRestriction boolean,
	vegetarianRestriction boolean,
	halalRestriction boolean
);

CREATE TABLE diningfoodratings(
	UserID integer,
	FoodID integer,
	FOREIGN KEY(UserID) REFERENCES userprofiles(ID), 
	FOREIGN KEY(FoodID) REFERENCES diningfood(ID),
	userRating float(24),
	userComment varchar(250),
	date timestamp
	);

GRANT SELECT ON diningfood TO PUBLIC;
GRANT SELECT ON userprofiles TO PUBLIC;
GRANT SELECT ON diningfoodratings TO PUBLIC;


