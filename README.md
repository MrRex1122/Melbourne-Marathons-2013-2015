# 🏃 Melbourne Marathon Analysis (2013–2015)

## 📘 Project Overview

This is my **first public data analysis project** using the R programming language.  
The dataset includes official participant results from the **Melbourne Marathon** for the years **2013, 2014, and 2015**.

The primary goal was to explore finish time distributions, highlight top-performing runners, and identify trends over time — such as performance by gender and age group.

---

## 🛠️ Technologies & Libraries

- **R version 4.4.3**
- `tidyverse` (core packages):
  - `dplyr` – data wrangling
  - `ggplot2` – visualization
  - `readr` – reading CSV files
- `lubridate` – working with time formats
- `hms` – handling duration/time-of-day objects

---

## 📂 Data Files

The following CSV files were used:

- `Melbourne13.csv`
- `Melbourne14.csv`
- `Melbourne15.csv`

Each file includes:
- Participant position, name, age category
- Gun time and net time
- Gender
- Category and gender placements

---

## 🔍 Key Questions

- What does the finish time distribution look like for each year?
- Do men and women perform differently?
- Is there a change in performance over time?
- Which age groups dominate the **top 25%** of runners?
- Are top-tier (elite) runners becoming more or less common?

---

## 📊 Main Visualizations

1. **Boxplot of net finish time** by year and gender
2. **Mean finish time** per year and gender
3. **Bar chart**: Top 25% fastest runners grouped by gender, year, and age category

---

## 🧠 Key Insights

- Men consistently finish faster than women, but the gap remains stable.
- The **20–39 age group** dominates the top-performing runners.
- The total number of **top-25% runners** has been **decreasing steadily** from 2013 to 2015.
- Female performance shows more stability than male over time.
- The marathon appears to be becoming **more inclusive**, but **less elite**.

---

## 📌 How to Run the Analysis

1. Clone this repo
2. Open in RStudio
3. Run
