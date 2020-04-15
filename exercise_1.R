
# Pivoting wide to long format --------------------------------------------

library(tidyverse)
library(readr)
fpkm <- read_delim("fpkm.csv", ";", escape_double = FALSE, 
                   trim_ws = TRUE)
#wide to long:
fpkm_long <- fpkm %>%  
  gather(key=condition, #the name of the new column that the column names will be stored in as keys
         value=FPKM, #the name of the new column that the values will be stored in
         NST_FT_FPKM:NST_RH_FPKM) #the range of columns to be pivoted 

#back to wide:
fpkm_wide <- fpkm_long %>% 
  spread(key=condition, value=FPKM)

