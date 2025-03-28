# Codebook for Workplace Accident Data

## Dataset Description
This dataset contains records of major workplace accidents over the years. Each row represents a single accident case, detailing the type of accident, location, industry category, and the number of casualties.

## Variable Information

| Variable Name | Data Type | Missing Rate | Description |
|--------------|-----------|--------------|-------------|
| `no` | Integer | 0% | Unique identifier for each accident case. |
| `date` | Date (character) | 100% | Date of the accident (currently missing). |
| `type` | Character | 0% | Type of accident (e.g., 墜落、溺斃、跌倒). |
| `location` | Character | 0% | The district where the accident occurred. |
| `category` | Character | 0% | The industry category of the workplace. |
| `deaths` | Integer | 0% | Number of fatalities in the accident. |
| `injuries` | Integer | 0% | Number of injuries in the accident. |

## Example Data

| no | date | type | location | category | deaths | injuries |
|----|------|------|----------|----------|--------|----------|
| 1  | NA   | 墜落、滾落 | 平溪區 | 批發及零售業 | 1 | 0 |
| 2  | NA   | 溺斃 | 萬里區 | 農、林、漁、牧業 | 1 | 0 |
| 3  | NA   | 墜落、滾落 | 板橋區 | 營造業 | 1 | 0 |
| 4  | NA   | 墜落、滾落 | 中和區 | 製造業 | 1 | 0 |
| 5  | NA   | 跌倒 | 五股區 | 製造業 | 1 | 0 |
| 6  | NA   | 溺斃 | 八里區 | 運輸及倉儲業 | 1 | 0 |
| 7  | NA   | 被夾、被捲 | 新店區 | 運輸及倉儲業 | 1 | 0 |
| 8  | NA   | 墜落、滾落 | 三重區 | 營造業 | 1 | 0 |
| 9  | NA   | 墜落、滾落 | 蘆洲區 | 製造業 | 1 | 1 |
| 10 | NA   | 爆炸 | 板橋區 | 營造業 | 0 | 3 |

This dataset can be used to analyze trends in workplace accidents across different industries and locations.


### Variable Analysis and Processing

**Date (`date`)**  
  The `date` column currently has a 100% missing rate. If needed, it can be supplemented with data from other sources or filled with appropriate predicted values.

**Occupational Disaster Type (`type`)**  
  This variable is a categorical variable (Factor) representing different types of occupational disasters, such as falls, slips, and explosions.

**Industry Category (`category`)**  
  This variable is a categorical variable (Factor) representing different industries, such as manufacturing, construction, and transportation.

**Casualties (`deaths`, `injuries`)**  
  Both `deaths` and `injuries` are integer variables, representing the number of fatalities and injuries, respectively.

### R Processing Recommendations

- The `tidyverse` package can be used for data processing and analysis, such as `mutate()` for variable transformation and `summarise()` for calculating statistics.  
- If parsing the `date` variable is necessary, use `lubridate::ymd()` for conversion.  
- Since `type`, `location`, and `category` are categorical variables, it is recommended to convert them using `forcats::as_factor()`.  
- Use `dplyr::summarise()` to compute the total and average number of casualties.  

### Notes

- The `date` column currently lacks data; if complete data becomes available in the future, further format analysis will be required.  
- If additional columns are added, ensure data consistency to prevent category errors.  
- The dataset should be properly cleaned, including handling NA values and checking variable types, to ensure accurate analysis results.
