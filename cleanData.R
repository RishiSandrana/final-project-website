library(tidyverse)

iqData <- read_csv("data/IQRankings.csv")
rankingData <- read_csv("data/EducationRankings.csv")
scoresData <- read_csv("data/TestScoreData.csv")

rankingData <- rankingData |>
  select(country, rank2021, pop2023)

iqData <- iqData |>
  select(country, iq)

scoresData <- scoresData |>
  rename(country = Entity) |>
  rename_at(7, ~ "score") |>
  drop_na() |>
  select(country, score)

mergedData <- iqData |>
  inner_join(scoresData, by = "country") |>
  inner_join(rankingData, by = "country")

saveRDS(mergedData, "mergedData.rds")