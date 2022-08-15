library(tidyverse)

b <- read_csv("latest.csv") |>
  mutate(Status = str_to_lower(Status)) |>
  filter(Status != "Discarded") |>
  drop_na(`Hospitalised (Y/N/NA)`) |>
  mutate(hospitalized = `Hospitalised (Y/N/NA)`) |>
  select(Country, hospitalized) |>
  filter(Country %in% c("Italy", "United States"))
write_rds(b, "plot-2.rds")
