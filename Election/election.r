setwd("D:\\Virus\\R Studio")
df=read.csv("election.csv")

library(dplyr)

#How many votes are polled in each constituency
df %>% group_by(PC.NAME) %>% 
  summarize(total_votes=sum(TOTAL)) %>%
  arrange(desc(total_votes))

# Find winner in each constituency
winner= df%>% group_by(PC.NAME) %>%
  filter(TOTAL==max(TOTAL))
winner

# Find How many seats are secured by each political party
winner %>% group_by(PARTY.NAME) %>% 
  summarize(seats=n()) %>%
  arrange(desc(seats)) %>% head(10)


# Find the same for Maharashtra
winner %>% filter(State.Name=="Maharashtra") %>%
  group_by(PARTY.NAME) %>% 
  summarize(seats=n()) %>%
  arrange(desc(seats))

# Find the margin by what the Winner won in each province
df %>% group_by(PC.NAME) %>%
  arrange(desc(TOTAL)) %>%
  slice_head(n=2) %>%
  summarize(margin=TOTAL[1]-TOTAL[2]) %>%
  select(margin)
  
  
  
  
  