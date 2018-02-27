library(tidyverse)
library(stringr)



str1 <- "http://www.ndbc.noaa.gov/view_text_file.php?filename=mlrf1h"
str2 <- ".txt.gz&dir=data/historical/stdmet/"

years <- c(1987:2016)

urls <- str_c(str1, years, str2, sep = "")

filenames <- str_c("mr", years, sep = "")
















N <- length(urls)

for (i in 1:N){
  assign(filenames[i], read_table(urls[i], col_names = TRUE))
  
  file <- get(filenames[i])
  
  colnames(file)[1] <-"YYYY"
  
  if(nchar(file[1,1]) == 2 & file[1,1] > 50 ) {
    file[1] <- lapply(file[1], function(x){str_c(19, x, sep = "")})
  }
  
  if(nchar(file[1,1]) == 2 & file[1,1] < 50 ) {
    file[1] <- lapply(file[1], function(x){str_c(20, x, sep = "")})
  }
  
  if(is.element("mm", colnames(file))) {
    file <- file %>% filter(mm == "00" | mm == "50")
  }
  
  file <- file %>% select(YYYY, MM, DD, hh, ATMP, WTMP) %>% 
    filter(hh == "12" & DD %in% c("01", "15")) %>%
    filter(ATMP < 90 & WTMP < 90) %>% 
    distinct(YYYY, MM, DD, hh, .keep_all = TRUE)
  
  if(i == 1){
    MR <- file
  }
  
  else{
    MR <- rbind.data.frame(MR, file)
  }
  
  
  
}

MR <- MR %>% mutate(date = str_c(YYYY, MM, DD, sep = ""))