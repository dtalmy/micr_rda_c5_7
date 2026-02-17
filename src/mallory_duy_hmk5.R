library(tidyverse)

students <- read_csv("data/sample_data.csv", 
na = c("N/A", ""))

students |> 
  rename(
    student_id = `Student ID`,
    full_name = `Full Name`, 
    favourite_food = favourite.food,
    meal_plan = mealPlan
  )