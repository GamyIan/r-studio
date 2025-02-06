df = read.csv("D:\\virus\\R Studio\\Practical 9\\Crimes_2022.csv")

library(dplyr)

# How many times a type of crime has been committed
df %>% group_by(Primary.Type) %>%
  summarize(crimes=n()) %>% arrange(desc(crimes))

# Where do most crimes occur
df %>% group_by(Location.Description) %>%
  summarize(crimes=n()) %>% arrange(desc(crimes))

# In which year were the most crimes reported
df %>% group_by(Year) %>%
  summarize(crimes=n()) %>% arrange(desc(crimes))

# Find monthwise how many cases are being reported










