setwd("D:\\virus\\R Studio\\Practical 8")
d1=read.csv("sheet1.csv")
d2=read.csv("sheet2.csv")
d=merge(d1,d2,by.x="id",by.y="match_id")
library(dplyr)

# Q1 - Which team has won the most matches in each season
d1 %>% group_by(season,winner) %>% 
  summarize(wins=n()) %>%
  slice(which.max(wins)) %>% arrange(desc(season))
  
# Q2 - Who are the top 5 run scorer batsmen in ipl
d %>% group_by(batsman) %>% 
  summarize(runs=sum(total_runs)) %>%
  arrange(desc(runs)) %>% head(5)

# Q3 - Which team performed best at Wankhede best on maximum number of wins
d1 %>% filter(venue=="Wankhede Stadium") %>%
  group_by(winner) %>%
  summarize(wins=n()) %>%
  arrange(desc(wins)) %>% head(1)

# Q4 - Which batsmen has the highest strike rate in 2010 TotalRuns/Balls * 100
bat_balls=d %>% filter(season==2010) %>%
      group_by(batsman) %>%
      summarize(balls_played=n()) %>% arrange(desc(balls_played))
bat_balls

bat_runs=d %>% filter(season==2010) %>%
    group_by(batsman) %>%
    summarize(total_runs=sum(batsman_runs))
bat_runs
sucka=merge(bat_balls,bat_runs,by.x="batsman",by.y="batsman")

cyka_blyat=sucka %>% mutate(SR=total_runs*100/balls_played) %>% arrange(desc(SR))
cyka_blyat #%>% head(5)

d %>% filter(season==2010) %>%
  select(batsman,batsman_runs,ball) %>% 
  group_by(batsman) %>%
  mutate(strike_rate = 
           sum(batsman_runs) *100 / )



# Q5 - Who are the top 5 wicket takers in ipl season 2015
d %>% filter(Wicket.Taker!=0,season==2015 ) %>% 
  group_by(Wicket.Taker) %>%
  summarize(wickets=n()) %>%
  arrange(desc(wickets)) %>% head(5)
