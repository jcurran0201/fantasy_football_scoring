library(dplyr)
library(tidyverse)
library(ggplot2)
library(tidyr) 
library(readxl) #import data from excel
#2023 win lose record
c_john_2023_win_lose <- c("LOSE","WIN","WIN",'WIN',"LOSE","LOSE","WIN","LOSE",
                          "WIN","WIN","LOSE","LOSE","WIN","WIN")  
c_josh_2023_win_lose <- c("LOSE","WIN","LOSE",'WIN',"WIN","WIN","WIN","WIN",
                          "WIN","LOSE","WIN","LOSE","LOSE","WIN") 
c_matt_2023_win_lose <- c("WIN","WIN","WIN",'WIN',"LOSE","WIN","WIN","WIN",
                          "WIN","WIN","WIN","WIN","WIN","LOSE") 
c_justin_2023_win_lose <- c("WIN","LOSE","WIN",'LOSE',"LOSE","LOSE","LOSE","WIN",
                            "LOSE","LOSE","LOSE","WIN","LOSE","WIN") 
c_evan_2023_win_lose <- c("WIN","LOSE","LOSE",'LOSE',"LOSE","WIN","LOSE","WIN",
                          "LOSE","LOSE","LOSE","LOSE","WIN","LOSE") 
c_garrett_2023_win_lose <- c("WIN","LOSE","LOSE",'WIN',"WIN","LOSE","WIN","WIN",
                             "WIN","LOSE","LOSE","LOSE","WIN","WIN")  
c_kyle_2023_win_lose <- c("WIN","LOSE","LOSE",'LOSE',"WIN","LOSE","WIN","LOSE",
                          "LOSE","WIN","WIN","LOSE","LOSE","LOSE") 
c_vincent_2023_win_lose <- c("LOSE","WIN","WIN",'LOSE',"LOSE","LOSE","LOSE","LOSE",
                             "LOSE","WIN","LOSE","WIN","LOSE","LOSE")  
c_jake_2023_win_lose <- c("LOSE","WIN","WIN",'WIN',"WIN","WIN","LOSE","LOSE",
                          "WIN","WIN","WIN","WIN","LOSE","WIN") 
c_austin_2023_win_lose <- c("LOSE","LOSE","LOSE",'WIN',"WIN","WIN","LOSE","LOSE",
                            "LOSE","LOSE","WIN","WIN","WIN","LOSE")  
#2024 win lose record 
c_john_2024_win_lose <- c("WIN","WIN","WIN",'WIN',"LOSE","LOSE","LOSE","WIN",
                          "WIN","WIN","LOSE","LOSE","WIN","LOSE")  
c_josh_2024_win_lose <- c("WIN","WIN","WIN",'WIN',"WIN","WIN","WIN","WIN",
                          "WIN","WIN","WIN","WIN","LOSE","WIN") 
c_matt_2024_win_lose <- c("WIN","WIN","LOSE",'LOSE',"LOSE","LOSE","WIN","LOSE",
                          "LOSE","LOSE","WIN","WIN","WIN","WIN") 
c_justin_2024_win_lose <- c("LOSE","WIN","LOSE",'LOSE',"LOSE","WIN","LOSE","WIN",
                            "WIN","WIN","LOSE","WIN","LOSE","LOSE") 
c_evan_2024_win_lose <- c("LOSE","LOSE","LOSE",'LOSE',"WIN","LOSE","LOSE","LOSE",
                          "LOSE","LOSE","LOSE","WIN","LOSE","LOSE") 
c_garrett_2024_win_lose <- c("WIN","LOSE","WIN",'LOSE',"WIN","WIN","WIN","WIN",
                             "LOSE","LOSE","LOSE","LOSE","WIN","WIN")
c_kyle_2024_win_lose <- c("LOSE","LOSE","LOSE",'WIN',"WIN","LOSE","LOSE","LOSE",
                          "WIN","LOSE","WIN","LOSE","LOSE","LOSE") 
c_vincent_2024_win_lose <- c("LOSE","WIN","WIN",'WIN',"LOSE","WIN","WIN","LOSE",
                             "LOSE","WIN","WIN","WIN","WIN","LOSE") 
c_jake_2024_win_lose <- c("WIN","LOSE","LOSE",'LOSE',"LOSE","WIN","LOSE","LOSE",
                          "WIN","WIN","WIN","LOSE","WIN","WIN") 
c_austin_2024_win_lose <- c("LOSE","LOSE","WIN",'WIN',"WIN","LOSE","WIN","WIN",
                            "LOSE","LOSE","LOSE","LOSE","LOSE","WIN")   
#combined win loss over 2 years 
john_results <- c(c_john_2023_win_lose, c_john_2024_win_lose)
josh_results <- c(c_josh_2023_win_lose, c_josh_2024_win_lose)
matt_results <- c(c_matt_2023_win_lose, c_matt_2024_win_lose)
justin_results <- c(c_justin_2023_win_lose, c_justin_2024_win_lose)
evan_results <- c(c_evan_2023_win_lose, c_evan_2024_win_lose)
garrett_results <- c(c_garrett_2023_win_lose, c_garrett_2024_win_lose)
vincent_results <- c(c_vincent_2023_win_lose, c_vincent_2024_win_lose)
kyle_results <- c(c_kyle_2023_win_lose, c_kyle_2024_win_lose)
jake_results <- c(c_jake_2023_win_lose, c_jake_2024_win_lose)
austin_results <- c(c_austin_2023_win_lose, c_austin_2024_win_lose)   
results<- data_frame((c(john_results,josh_results,matt_results,justin_results,evan_results,
           garrett_results,vincent_results,kyle_results,jake_results,austin_results))) 
custom_order <- c('John',"Josh",'Matthew',"Justin",'Evan','Garrett','Kyle','Vincent','Jake','Austin') 
###### 
scores_combined <- bind_rows(X2023_regular_season, X2024_regular_season)  
combined_scores$teams <- factor(combined_scores$teams, levels = custom_order) 
scores_combined_sorted <- combined_scores[order(combined_scores$teams), ] 
data_frame <- cbind(scores_combined_sorted,results)  
data_frame <- cbind(data_frame,results)
data_frame <- data_frame[ -c(4) ]
colnames(data_frame) 
data_frame <- data_frame %>% rename(result = "(...)") 
#Exploratory Data Analysis 
score_data<-data_frame %>% select(teams,score) %>% 
  group_by(teams) %>% 
  summarise(total_score= sum(score),avg_score = mean(score),
  median_score = median(score),diff=avg_score-median_score) %>% arrange(desc(total_score))
#Standings
standings <- data_frame %>%
  select(teams, result) %>%
  group_by(teams) %>%
  summarize(
    wins = sum(result == 'WIN'),
    loss = sum(result == 'LOSE'),
    win_pct = round(wins/(wins+loss),3)
  ) %>%
  arrange(desc(wins)) 
#Create a histogram of all the scores from each game to observe if there is a normal distribution
ggplot(data = data_frame, aes(x = score)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "lightblue", color = "black", alpha = 0.6) + 
  stat_function(fun = dnorm, 
                args = list(mean = mean(data_frame$score, na.rm = TRUE), 
                            sd = sd(data_frame$score, na.rm = TRUE)), 
                color = "red", linewidth = 1.2) +  
  labs(title = "Histogram with Normal Distribution Curve",
       x = "Individual Game Scores", y = "Probability Density") + 
  theme_minimal()
mean_score<- mean(data_frame$score)  
median_score<-median(data_frame$score) 
sd_score<-sd(data_frame$score)  
cat("The mean score is:", mean_score) 
cat("The median score is:", median_score) 
cat("68% of the data falls within", sd_score,"points of the mean")
  #Create a bar chart to add up all points each team has scored over last 2 seasons    
bar_plots <- function() {  
  theme_minimal() +  # Apply minimal theme first
    theme(
      axis.text.x = element_text(angle = 90, hjust = 1),  
      strip.text = element_text(face = "bold", size = 10),  
      plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),   
      line = element_line(),
      panel.spacing = unit(1, "lines")
    )
}
ggplot(data = score_data, aes(x = reorder(teams, -total_score), y = total_score)) +
  geom_bar(stat = "identity", fill = "magenta") + 
  geom_text(aes(label = total_score), vjust = -0.3, color = "black", size = 3) +  
  labs(title = "Sum of scores from 2023-2024", x = "Teams", y = "Total Score") + 
  scale_y_continuous(breaks = seq(0, max(6000), by = 1000)) +  
  bar_plots()  

# Find the probability of winning for each score 
win_probability<- round(pnorm(data_frame$score, mean = mean_score, sd = sd_score), 4)
data_frame<- cbind(data_frame,win_probability) 
data_frame<- data_frame%>% select(teams, score, win_probability,result) 
ggplot(data = data_frame,aes(x=win_probability,y=score,colour = result))+ 
  geom_jitter() + 
  labs(title="Win Probability based on score",x="Win Probability", y='score')+bar_plots()

#Was Josh really that good in 2024? Was Matt really that good in 2023?  
matt_2023_season <- data_frame %>% filter(teams=="Matthew") %>% head(14)
josh_2024_season <- data_frame %>% filter(teams=="Josh") %>% tail(14)
#Matt vs Josh  random samples
matchups<-cbind(matt_2023_season$score,josh_2024_season$score) %>% 
  as.data.frame()%>% rename(Matthew = V1,Josh=V2) 
combinations <- expand.grid(Matthew = matchups$Matthew, Josh = matchups$Josh) 
game_result <- ifelse(combinations$Matthew > combinations$Josh, "Matthew wins",
                      ifelse(combinations$Josh > combinations$Matthew, "Josh wins", "Draw"))  
df <- cbind(combinations,game_result)  
set.seed(123)
for (i in 1:10) {
  random_sample <- df[sample(nrow(df), 14), ]
  print(paste("Sample", i)) 
  print(random_sample) 
  cat("\n") 
}
#Is Evan as bad as his record claims?   
evan <- data_frame %>% filter(teams=="Evan")
evan_opponents <- data_frame %>% select(teams,score) %>% filter(teams != "Evan") %>% 
  rename(opponent_score = score)  

evan_score <- evan %>% select(score) %>% rename(evan_score = score) 
evan_competition <- cbind(evan_score,evan_opponents)  
evan_competition <- evan_competition[ -c(2) ]
evan_competition_combinations <- expand.grid(Evan = unique(evan_competition$evan_score),
                                             Opponent = unique(evan_competition$opponent_score)) 
game_result <- ifelse(evan_competition_combinations$Evan > evan_competition_combinations$Opponent, "Evan wins",
                      ifelse(evan_competition_combinations$Evan < evan_competition_combinations$Opponent, "Opponent wins", "Draw")) 
evan_competition_combinations <- cbind(evan_competition_combinations,game_result)
for (i in 1:10) {
  random_sample <- evan_competition_combinations[sample(nrow(evan_competition_combinations), 14), ]
  print(paste("Sample", i)) 
  print(random_sample)
  cat("\n") 
}
#Run a t-test to find the statistical significance between the scores in wins and losses
winners <- data_frame %>% filter(result=='WIN') %>% pull(score) %>% as.numeric() 
losers <- data_frame %>% filter(result=="LOSE") %>% pull(score) %>%as.numeric()
t.test(winners,losers)
boxplot(winners, losers, 
        names = c("Winners", "Losers"),
        main = "Boxplot of Winners vs Losers",
        col = c("lightblue", "lightgreen"),
        ylab = "Scores") 
