d1 = read.csv("D:\\virus\\R Studio\\Ipl\\sheet1.csv")
d2 = read.csv("D:\\virus\\R Studio\\Ipl\\sheet2.csv")

d3 = merge(d1,d2,by.x="id",by.y="match_id")
d3

library(dplyr)

d3 %>%
  mutate(id = consecutive_id(season)) %>%
  summarise(total = sum(total_runs), .by = c(id, season)) %>% arrange(desc(total))

# Highest Total Runs per season
d3 %>% 
  group_by(season) %>% 
  summarize(total=sum(total_runs)) %>% 
  arrange(desc(total))

# Highest Total wickets per season
d3 %>% 
  filter(Wicket.Taker!=0) %>% 
  group_by(bowler) %>% 
  tally() %>% arrange(desc(n))

# Highest Total Wickets per Team
d3 %>% 
  filter(Wicket.Taker!=0) %>% 
  group_by(bowling_team) %>% 
  tally() %>% arrange(desc(n))

# Find total runs scored by virat kohli in each season
vkolhi=d3 %>%
  filter(batsman == "V Kohli") %>%
  group_by(season) %>%
  summarize(total=sum(total_runs)) %>% arrange(desc(season))

library(ggplot2)
ggplot(vkolhi,
       aes(x=season,y=total,fill=total,)) +
  geom_bar(stat="identity",color="BLACK",fill="darkgreen")

# Find wickets scored by a bowler in each season
d3 %>% 
  filter(Wicket.Taker=="PP Chawla") %>% 
  group_by(season) %>% 
  tally() %>% arrange(desc(n))

ggplot(pp,aes(x=season,y=n,fill=n)) +
  geom_bar(stat="identity",color="BLACK",fill="gold") +
  labs(title="PP Chawlas Wickets per season",x="Season",y="Wickets")





