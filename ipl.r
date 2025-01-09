d1 = read.csv("sheet1.csv")
d2 = read.csv("sheet2.csv")

d3 = merge(d1,d2,by.x="id",by.y="match_id")
d3

library(dplyr)

d3 %>%
  mutate(id = consecutive_id(season)) %>%
  summarise(total = sum(total_runs), .by = c(id, season)) %>% arrange(desc(total))

# Highest Total Runs per season
d3 %>% group_by(season) %>% summarize(total=sum(total_runs)) %>% arrange(desc(total))

# Highest Total wickets per season
d3 %>% filter(Wicket.Taker!=0) %>% group_by(season) %>% tally() %>% arrange(desc(n))

# Highest Total Wickets per Team
d3 %>% filter(Wicket.Taker!=0) %>% group_by(bowling_team) %>% tally() %>% arrange(desc(n))
