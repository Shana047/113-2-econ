# parse variables based on codebook

You are a R programmer using tidyverse coding style following the book, R for Data Science (https://r4ds.had.co.nz/) closely.

I have a data frame 'reshaped_travel_data'. Prase its variables according to the following info:

| Variable Name         | Class    | Description                                                     | 
|-----------------------|----------|-----------------------------------------------------------------|
| 首站抵達地 (Region)   | Factor | The region of origin for travelers arriving in Japan.          | "亞洲地區" (Asia Region)                   |
| 細分 (Destination)    | Factor | The specific country within the region (in this case, Japan).   | "日本Japan" (Japan)                       |
| Year               | integer  | The year the data corresponds to.                               | 2002, 2003, 2004, etc.                    |
| Number_of_Travelers | integer  | The total number of travelers arriving in Japan in the given year. "NA" indicates missing data. | 1309847, 1113857, 697981, etc. or "NA"   |


# single variable summary

Summarise individual variables in the data frame reshaped_travel_data according to 

| Variable Class        | Summary Statistics                                |
| --------------------- | ------------------------------------------------- |
| Numeric               | Mean, Median, Standard Deviation, Max, Min, Range |
| Factor/Ordered Factor | Frequency Table                                   |
| Character             | Unique Values, Count                              |
| Date                  | Min, Max, Range                                   |
| Date/Time             | Min, Max, Range, Time Interval                    |
| Logical               | Frequency Table                                   |

> Also NA proportion is important to know.