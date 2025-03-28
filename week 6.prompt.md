library(tidyverse)
library(skimr)

# Function to summarize individual variables
summarize_variable <- function(df) {
  df |> 
    summarise(
      across(
        everything(),
        list(
          class = ~ class(.),
          na_prop = ~ mean(is.na(.))  # Proportion of NA values
        ),
        .names = "{.col}_{.fn}"
      )
    ) |> 
    pivot_longer(cols = everything(), names_to = c("Variable", "Statistic"), names_sep = "_") |> 
    pivot_wider(names_from = Statistic, values_from = value)
}

# Summary for numeric variables
summarize_numeric <- function(df) {
  df |> 
    select(where(is.numeric)) |> 
    summarise(
      across(
        everything(),
        list(
          mean = ~ mean(., na.rm = TRUE),
          median = ~ median(., na.rm = TRUE),
          sd = ~ sd(., na.rm = TRUE),
          max = ~ max(., na.rm = TRUE),
          min = ~ min(., na.rm = TRUE),
          range = ~ max(., na.rm = TRUE) - min(., na.rm = TRUE)
        ),
        .names = "{.col}_{.fn}"
      )
    ) |> 
    pivot_longer(cols = everything(), names_to = c("Variable", "Statistic"), names_sep = "_") |> 
    pivot_wider(names_from = Statistic, values_from = value)
}

# Summary for factor variables (Frequency table)
summarize_factor <- function(df) {
  df |> 
    select(where(is.factor)) |> 
    map(~ table(.) |> as_tibble() |> rename(Value = ., Count = n)) |> 
    bind_rows(.id = "Variable")
}

# Apply summaries
summary_overview <- summarize_variable(reshaped_travel_data)
numeric_summary <- summarize_numeric(reshaped_travel_data)
factor_summary <- summarize_factor(reshaped_travel_data)

# Print results
print(summary_overview)
print(numeric_summary)
print(factor_summary)
