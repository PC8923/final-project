library(tidyverse)
library(dplyr)

a <- read_csv("latest.csv") |>
  mutate(Status = str_to_lower(Status)) |>
  filter(Status != "discarded") |>
  drop_na(Gender) |>
  mutate(Gender = str_to_lower(Gender)) |>
  group_by(Gender) |>
  summarize(gender_total = n()) |>
  ungroup() |>
  mutate(gender_percent = gender_total/2081) |>
  select(Gender, gender_percent)

write_rds(a, "plot-1.rds")
