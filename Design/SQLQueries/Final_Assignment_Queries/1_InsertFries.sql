-- DEMO INSERT STATEMENT, Adding the most complicated object.


-- Add basic measurements
INSERT INTO Measurement_Lookup (MeasurementName) VALUES ('Count') ON CONFLICT DO NOTHING;
INSERT INTO Measurement_Lookup (MeasurementName) VALUES ('Tbsp') ON CONFLICT DO NOTHING;


-- Add a dish with ingredients.
INSERT INTO Ingredients (IngredientId, IngredientName, CaloriesPerMeasurement, MeasurementId) VALUES ('0','Potato', '150', '1'), ('1', 'Salt', '0', '2') ON CONFLICT DO NOTHING;
INSERT INTO Dish (DishId, Name, Calories) VALUES ('0', "Fries", '197') ON CONFLICT DO NOTHING;
INSERT INTO Dish_Ingredient_Lookup (DishId, IngredientId, MeasurementAmount) VALUES ('0', '0', '3'), ('0', '1', '2') ON CONFLICT DO NOTHING;

-- Add a unhealthy tag to 
INSERT INTO Tags (TagId, Name) VALUES ('0', 'Unhealthy') ON CONFLICT DO NOTHING;
INSERT INTO Dish_Tags_Lookup (DishId, TagId) VALUES ('0', '0') ON CONFLICT DO NOTHING;

-- Add the mealtime and meal, associated with mealtime.
INSERT INTO Mealtime(MealtimeId, [Mealtime Name]) VALUES ('0', 'Brunch') ON CONFLICT DO NOTHING;
INSERT INTO Mealtime(MealtimeId, [Mealtime Name]) VALUES ('1', 'Early Breakfast') ON CONFLICT DO NOTHING;
INSERT INTO Meal(MealId, Description, MealtimeId, Date, Time) VALUES ('0', 'I ate fries!', '0', '0', '0') ON CONFLICT DO NOTHING;
INSERT INTO Meal_Dish_Lookup (MealId, DishId) VALUES ('0', '0') ON CONFLICT DO NOTHING;