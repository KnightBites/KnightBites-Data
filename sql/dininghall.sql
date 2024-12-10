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
	Image varchar(500),
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

CREATE TABLE uppercrustdetail (
	ingredient varchar(50),
	category varchar(50)
);

CREATE TABLE prayers (
	prayerTitle varchar(250)
	prayer varchar(500)
);

'''
CREATE TABLE uppercrustcreations (
	creator varchar(250),
	sandwichName varchar(250),
	comment varchar(250),
	grilled boolean,
	date timestamp,
	"Club Rolls" boolean,
	"White Bread" boolean,
	"Sourdough Bread" boolean,
	"Multigrain Sourdough Bread" boolean,
	"Cheese & Jalapeño Bread" boolean,
	"Tomato Basil Tortilla" boolean,
	"Wheat Bread" boolean,
	"Pretzel Bread Buns" boolean,
	"Spinach Tortilla" boolean,
	"Flour Tortilla" boolean,
	"Gluten Free Tortilla" boolean,
	"Ham" boolean,
	"Turkey" boolean,
	"Roast Beef" boolean,
	"Salami" boolean,
	"Buffalo Chicken" boolean,
	"Pepperoni" boolean,
	"Bacon" boolean,
	"Capicola" boolean,
	"American Cheese" boolean,
	"Provolone Cheese" boolean,
	"Swiss Cheese" boolean,
	"Cheddar Cheese" boolean,
	"Pepper Jack Cheese" boolean,
	"Mozzarella Cheese" boolean,
	"Gouda Cheese" boolean,
	"Muenster Cheese" boolean,
	"Colby Jack Cheese" boolean,
	"Tuna Salad" boolean,
	"Chicken Salad" boolean,
	"Shredded Lettuce" boolean,
	"Spinach" boolean,
	"Hot Pepper Relish" boolean,
	"Red Onions" boolean,
	"Sliced Pickle" boolean,
	"Sliced Cucumber" boolean,
	"Sliced Tomato" boolean,
	"Avocado Spread" boolean,
	"Carrots" boolean,
	"Olive" boolean,
	"Hummus Spread" boolean,
	"Mayo" boolean,
	"Mustard" boolean,
	"Ketchup" boolean,
	"Balsamic Vinegar" boolean,
	"Pesto Mayo"boolean,
	"Spicy Mayo" boolean,
	"Ranch" boolean,
	"Honey Mustard" boolean,
	"Garlic Parmesan" boolean,
	"Italian Dressing" boolean,
	"BBQ Sauce" boolean,
	"Olive Oil" boolean,
	"Balsamic Vinaigrette" boolean

);
'''

CREATE TABLE uppercrustcreations (
	creator varchar(250),
	sandwichName varchar(250),
	comment varchar(250),
	date timestamp,
	sammy JSON
);


GRANT SELECT ON diningfood TO PUBLIC;
GRANT SELECT ON userprofiles TO PUBLIC;
GRANT SELECT ON diningfoodratings TO PUBLIC;


