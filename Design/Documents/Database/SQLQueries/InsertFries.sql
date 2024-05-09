-- Add a dish with ingredients.
INSERT INTO Ingredients (IngredientId, Name, [Caloric Content]) VALUES ('0','Potato',''), ('1', 'Salt', '0')
ON CONFLICT DO NOTHING;
INSERT INTO Dish (DishId, Name, [Caloric Content]) VALUES ('0', "Fries", '197') ON CONFLICT DO NOTHING;
INSERT INTO Dish_Ingredient_Lookup (DishId, IngredientId) VALUES ('0', '0'), ('0', '1') ON CONFLICT DO NOTHING;

-- Add a unhealthy tag to 
INSERT INTO Tags (Name) VALUES ('Unhealthy') ON CONFLICT DO NOTHING;
INSERT INTO Dish_Tags_Lookup (DishId, TagName) VALUES ('0', 'Unhealthy') ON CONFLICT DO NOTHING;

-- Add the mealtime and meal, associated with mealtime.
INSERT INTO MEALTIME(MealtimeId, Time, Date, [Mealtime Name]) VALUES ('0', '0', 'January 1st 1970', 'Brunch') ON CONFLICT DO NOTHING;
INSERT INTO Meal(MealId, Description, MealtimeId) VALUES ('0', 'I ate fries!', '0') ON CONFLICT DO NOTHING;
INSERT INTO Meal_Dish_Lookup (MealId, DishId) VALUES ('0', '0') ON CONFLICT DO NOTHING;