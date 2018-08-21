library(purrr)
library(data.table)
library(feather)
library(lubridate)
library(dplyr)

read_quarterly_data <- function(path, test = FALSE) {
  files <- list.files(path, pattern = "*.csv", full.names = TRUE)
  
  if (test) {files <- files[1]} # Only read the first file
  
  df <- files %>%
    map_df(~ fread(., stringsAsFactors = FALSE, integer64 = "numeric")) %>%
    mutate(date = lubridate::as_date(date))
  
  return(as_data_frame(df))
}

# -- Read all .csv files in ./data subdirectories into one tbl_df

# Get subdirectories (quarterly data)
dirs <- list.dirs("data", recursive = FALSE)

# Loop over the directories, read in all .csv files and bind together as one tbl_df
tbl <- dirs %>% 
  map(~ read_quarterly_data(.)) %>%
  bind_rows()

# Write to disk using feather format
write_feather(tbl, "data/all_data.feather")
