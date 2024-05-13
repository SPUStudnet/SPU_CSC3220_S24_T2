-- If a meal is at the start of the universe (UNIX EPOCH) then update the description and mealtime appropriately (Assuming id 2 = early breakfast)

UPDATE Meal
   SET 
       Description = 'A meal at the beginning of the universe',
       MealtimeId = '1'
 WHERE
       Date = '0' AND 
       Time = '0';
