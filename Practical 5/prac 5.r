df = read.csv("Crimes_2022.csv")

library(dplyr)
library(lubridate)
library(ggplot2)


#Monthwise no. of domestic crime
df$Date = mdy_hms(df$Date)
df$Month = month(df$Date,label=TRUE)
mwd=df %>% filter(Domestic==TRUE) %>%
  group_by(Month) %>%
  summarize(crimes=n())

# Display bar chart
ggplot(mwd,
       aes(x=Month,y=crimes)) +
  geom_bar(stat="identity",color="BLACK",fill="darkgreen")

#Draw Line chart
ggplot(mwd, aes(x=Month,y=crimes,group=1)) +
  geom_line(color="green",size=1) +
  geom_point(color="red",size=1)

# Number of Crimes in School Premises
df %>% 
  filter(grepl("SCHOOL",Location.Description,ignore.case=TRUE)) %>%
  group_by(Month) %>%
  summarize(crimes=n())

# Group by Block ka AVE, ST, etc