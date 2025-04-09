if (!require("readr")) install.packages("readr")
if (!require("dplyr")) install.packages("dplyr")
if (!require("lubridate")) install.packages("lubridate")
if (!require("ggplot2")) install.packages("ggplot2")

library(readr)
library(dplyr)
library(lubridate)
library(ggplot2)



read_marathon <- function(file, year) {
  read_csv(file) |>
    mutate(Pos = as.character(Pos)) |>
    filter(Pos != "DNF", !is.na(Gender), !is.na(Categegory)) |>
    filter(`Net Time` != "0:00:00", !is.na(`Net Time`)) |>
    mutate(
      net_minutes = as.numeric(`Net Time`) / 60,
      Year = year
    )
}


df13 <- read_marathon("Melbourne13.csv", 2013)
df14 <- read_marathon("Melbourne14.csv", 2014)
df15 <- read_marathon("Melbourne15.csv", 2015)

df_all <- bind_rows(df13,df14,df15)

df_all |> 
  group_by(Year, Gender) |>
  summarise(
    mean_time = mean(net_minutes),
    .groups = "drop"
  ) |>
  ggplot(aes(x = factor(Year), y = mean_time, fill = Gender)) +
  geom_col(position = "dodge") +
  labs(
    title = " Mean net time (2013-2015)",
    x = "Year",
    y = "Mean time(Min)",
    fill = "Gender"
  ) +
  theme_minimal()

ggplot(df_all, aes(x = factor(Year), y = net_minutes, fill = Gender)) +
  geom_boxplot() +
  labs(
    title = "Mean net time distribution by years",
    x = "Year", y = "Time(Min)"
  ) +
  theme_minimal()

q1_cutoffs <- df_all |>
  group_by(Year, Gender) |>
  summarise(
    q1_time = quantile(net_minutes, 0.25),
    .groups = "drop"
  )

df_top_quartile <- df_all |>
  inner_join(q1_cutoffs, by = c("Year", "Gender")) |>
  filter(net_minutes <= q1_time)

df_top_quartile |>
  count(Year, Gender)

df_top_quartile |>
  group_by(Year, Gender, Categegory) |>
  summarise(n = n(), .groups = "drop") |>
  arrange(Year, Gender, desc(n))



df_top_quartile |>
  group_by(Year, Gender, Categegory) |>
  summarise(count = n(), .groups = "drop") |>
  ggplot(aes(x = Categegory, y = count, fill = Gender)) +
  geom_col(position = "dodge") +
  facet_wrap(~ Year) +
  labs(
    title = "Top 25% fastest runners (2013–2015)",
    x = "Age Category",
    y = "Number",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


