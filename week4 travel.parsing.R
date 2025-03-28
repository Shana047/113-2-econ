library(dplyr)

reshaped_travel_data <- reshaped_travel_data %>%
  mutate(
    `首站抵達地` = as.character(`首站抵達地`),
    `細分` = as.character(`細分`),
    Year = as.integer(Year),
    Number_of_Travelers = as.integer(Number_of_Travelers)
  )

library(tidyverse)
library(skimr)

summarise_travel_data <- function(df) {
  df_summary <- df |> 
    summarise(across(everything(), \(col) {
      if (is.numeric(col)) {
        tibble(
          Mean = mean(col, na.rm = TRUE),
          Median = median(col, na.rm = TRUE),
          SD = sd(col, na.rm = TRUE),
          Min = min(col, na.rm = TRUE),
          Max = max(col, na.rm = TRUE),
          Range = max(col, na.rm = TRUE) - min(col, na.rm = TRUE),
          NA_Proportion = mean(is.na(col))
        )
      } else if (is.factor(col) || is.ordered(col)) {
        tibble(Frequency_Table = list(table(col, useNA = "ifany")),
               NA_Proportion = mean(is.na(col)))
      } else if (is.character(col)) {
        tibble(Unique_Values = length(unique(col)),
               Count = length(col),
               NA_Proportion = mean(is.na(col)))
      } else if (inherits(col, "Date")) {
        tibble(Min = min(col, na.rm = TRUE),
               Max = max(col, na.rm = TRUE),
               Range = as.numeric(max(col, na.rm = TRUE) - min(col, na.rm = TRUE)),
               NA_Proportion = mean(is.na(col)))
      } else if (inherits(col, "POSIXt")) {
        tibble(Min = min(col, na.rm = TRUE),
               Max = max(col, na.rm = TRUE),
               Range = as.numeric(difftime(max(col, na.rm = TRUE), min(col, na.rm = TRUE), units = "days")),
               NA_Proportion = mean(is.na(col)))
      } else if (is.logical(col)) {
        tibble(Frequency_Table = list(table(col, useNA = "ifany")),
               NA_Proportion = mean(is.na(col)))
      } else {
        tibble(Note = "Unsupported Type")
      }
    }, .names = "{.col}")) 
  
  return(df_summary)
}

# Apply summary function to reshaped_travel_data
travel_data_summary <- summarise_travel_data(reshaped_travel_data)

# Print summary
travel_data_summary

