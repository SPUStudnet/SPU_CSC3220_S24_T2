-- INNER JOIN SELECT STATEMENT
-- DISPLAYS A meal, its dishes, the calories in those dishes, and the tags, and the ingredients.

SELECT Dish.Name, Meal.Description, Tags.Name, Dish.Calories, Ingredients.IngredientName, Ingredients.CaloriesPerMeasurement
FROM Meal 
INNER JOIN Meal_Dish_Lookup ON Meal.MealId=Meal_Dish_Lookup.MealId 
INNER JOIN Dish ON Meal_Dish_Lookup.DishId=Dish.DishId
INNER JOIN Dish_Tags_Lookup ON Dish.DishId=Dish_Tags_Lookup.DishId
INNER JOIN Tags ON Dish_Tags_Lookup.TagId=Tags.TagId
INNER JOIN Dish_Ingredient_Lookup ON Dish_Ingredient_Lookup.DishId=Dish.DishId
INNER JOIN Ingredients ON Dish_Ingredient_Lookup.IngredientId=Ingredients.IngredientId
WHERE Meal.MealId='0';