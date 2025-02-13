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



# Find Month-wise how many cases are being reported
library(lubridate)
df$Date = mdy_hms((df$Date))

df %>% group_by(month(df$Date,label=TRUE)) %>% 
  summarize(crimes=n()) %>% arrange(desc(crimes))

mw=df %>% group_by(month(df$Date,label=TRUE)) %>% 
  summarize(crimes=n()) %>% arrange(desc(crimes))

mutate(mw)

# Plot Bar-chart of Month-wise cases
library(ggplot2)
ggplot(
  mw, aes(x=),y=crimes,fill=crimes)) +
  geom_bar(stat="identity",color="BLACK",fill="darkgreen")

# How many people have got arrested vs. not per crime
df %>% group_by(Primary.Type,Arrest) %>%
  summarize(count=n())
  
df %>% group_by(Primary.Type) %>%
  summarize(True=sum(Arrest==TRUE),False=sum(Arrest==FALSE))





