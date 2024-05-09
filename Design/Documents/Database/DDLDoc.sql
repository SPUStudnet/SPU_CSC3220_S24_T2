--
-- File generated with SQLiteStudio v3.4.4 on Wed May 8 21:24:33 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Dish
CREATE TABLE IF NOT EXISTS Dish (
    DishId            INTEGER   PRIMARY KEY
                                UNIQUE
                                NOT NULL,
    Name              TEXT (50) NOT NULL
                                DEFAULT [Unnamed Dish],
    [Caloric Content] INTEGER
);

INSERT INTO Dish (DishId, Name, "Caloric Content") VALUES (0, 'Fries', 197);

-- Table: Dish_Ingredient_Lookup
CREATE TABLE IF NOT EXISTS Dish_Ingredient_Lookup (
    DishId       INTEGER REFERENCES Dish (DishId) 
                         NOT NULL,
    IngredientId INTEGER REFERENCES Ingredients (IngredientId) ON DELETE CASCADE
                         NOT NULL
);

INSERT INTO Dish_Ingredient_Lookup (DishId, IngredientId) VALUES (0, 0);
INSERT INTO Dish_Ingredient_Lookup (DishId, IngredientId) VALUES (0, 1);

-- Table: Dish_Tags_Lookup
CREATE TABLE IF NOT EXISTS Dish_Tags_Lookup (
    DishId  INTEGER   REFERENCES Dish (DishId) ON DELETE CASCADE
                                               ON UPDATE CASCADE
                      NOT NULL,
    TagName TEXT (20) REFERENCES Tags (Name) ON DELETE CASCADE
                                             ON UPDATE CASCADE
                      NOT NULL
);

INSERT INTO Dish_Tags_Lookup (DishId, TagName) VALUES (0, 'Unhealthy');

-- Table: Ingredients
CREATE TABLE IF NOT EXISTS Ingredients (
    IngredientId      INTEGER PRIMARY KEY
                              UNIQUE
                              NOT NULL,
    Name              TEXT    NOT NULL
                              DEFAULT [Unnamed Ingredient],
    [Caloric Content] INTEGER DEFAULT (150) 
);

INSERT INTO Ingredients (IngredientId, Name, "Caloric Content") VALUES (0, 'Potato', '');
INSERT INTO Ingredients (IngredientId, Name, "Caloric Content") VALUES (1, 'Salt', 0);

-- Table: Meal
CREATE TABLE IF NOT EXISTS Meal (
    MealId      INTEGER    PRIMARY KEY
                           UNIQUE,
    Description TEXT (500),
    MealtimeId  INTEGER    REFERENCES Mealtime (MealtimeId) ON DELETE CASCADE
                                                            ON UPDATE CASCADE
                           DEFAULT (0) 
);

INSERT INTO Meal (MealId, Description, MealtimeId) VALUES (0, 'I ate fries!', 0);

-- Table: Meal_Dish_Lookup
CREATE TABLE IF NOT EXISTS Meal_Dish_Lookup (
    MealId INTEGER REFERENCES Dish (DishId) ON DELETE CASCADE
                                            ON UPDATE CASCADE
                   NOT NULL,
    DishId INTEGER REFERENCES Dish (DishId) ON DELETE CASCADE
                                            ON UPDATE CASCADE
                   NOT NULL
);

INSERT INTO Meal_Dish_Lookup (MealId, DishId) VALUES (0, 0);

-- Table: Mealtime
CREATE TABLE IF NOT EXISTS Mealtime (
    MealtimeId      INTEGER PRIMARY KEY
                            UNIQUE
                            NOT NULL,
    Time            INTEGER,
    Date            INTEGER,
    [Mealtime Name] TEXT
);

INSERT INTO Mealtime (MealtimeId, Time, Date, "Mealtime Name") VALUES (0, 0, 'January 1st 1970', 'Brunch');

-- Table: Tags
CREATE TABLE IF NOT EXISTS Tags (
    Name TEXT (30) PRIMARY KEY
                 UNIQUE
);

INSERT INTO Tags (Name) VALUES ('Unhealthy');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
