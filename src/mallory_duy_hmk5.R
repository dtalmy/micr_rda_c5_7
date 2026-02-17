# Question 1
library(tidyverse)

students <- read_csv("data/sample_data.csv", 
na = c("N/A", ""))

students |> 
  rename(
    student_id = `Student ID`,
    full_name = `Full Name`, 
    favourite_food = favourite.food,
    meal_plan = mealPlan, age = AGE
  ) |>
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
  )
#Question 2
library(readr)
colloquium_assessment <- read_csv("data/colloquium_assessment.csv")
library(dplyr)
library(tidyr)

colloquium_assessment <- colloquium_assessment |>
  mutate(across(Q7:Q10, as.numeric))

colloquium_assessment <- colloquium_assessment |> pivot_longer(
cols = Q7:Q10,
names_to = "question",
values_to = "response"
)
# Question 3 

question_means <- colloquium_assessment |>
  group_by(question) |>
  summarize(mean_score = mean(response, na.rm = TRUE))
