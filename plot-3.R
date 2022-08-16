library(tidyverse)

c <- read_csv("latest.csv") |>
  mutate(Status = str_to_lower(Status)) |>
  filter(Status != "Discarded") |>
  drop_na(Age) |>
  mutate(age_group = case_when(Age == "0-5" | Age == "0-9" | Age == "5-9" ~ "0-9",
                               Age == "10-14" | Age == "15-19" | Age == "15-20" ~ "10-19",
                               Age == "19-24" | Age == "20-24" | Age == "20-25" | Age == "20-29" | Age == "20-35" | Age == "24-29" | Age == "25-29" | Age == "25-30" | Age == "26-30" ~ "20-29",
                               Age == "30-34" | Age == "30-35" | Age == "30-39" | Age == "35-39" | Age == "35-40" | Age == "25-39" ~ "30-39",
                               Age == "34-46" | Age == "40-42" | Age == "40-44" | Age == "40-45" | Age == "40-49" | Age == "41-45" | Age == "45-49" | Age == "45-50" | Age == "45-54" | Age == "46-50" ~ "40-49",
                               Age == "50-54" | Age == "50-55" | Age == "50-59" | Age == "51-65" | Age == "55-59" | Age == "55-64" ~ "50-59",
                               Age == "60-64" | Age == "65-69" ~ "60-69",
                               Age == "70-74" ~ "70+")) |>
  drop_na(age_group) |>
  group_by(age_group) |>
  summarize(age_total = 9.67*n(), .groups = "drop") |>
  select(age_group, age_total)

write_rds(c, "plot-3.rds")
