## The prupose of this project is to discover trends in a 10 team fantasy football dynasty league over a two year period. the project hopes to discover the trends between winning and losing teams, how much luck is involved in the league, and the probablility of winning for each score over a two year period. Only data from the regualar season was used. The league's regular season is 14 games, which means each team has played 28 total games over a two year period.  
## This project only took points scored into account. It does not take injuries, trades, BYE weeks, etc into account. 

## The league has a mean score of 186.17 points per game, a median score of 184.45 points per week, and a standard deviation of 30.00895 points. We now know that our data is essentially normally distributed given how close the mean and median score are to one another.  
## ![histogram of scores](https://github.com/user-attachments/assets/6572090e-f1b8-4098-8c93-ee6cde3c1f45) 
## Bar plot of who has scored the most points over the two year period 
## ![Bar chart of who has scored the most points over the course of the 2 seasons](https://github.com/user-attachments/assets/62651394-4dcd-44ab-b67c-60543df4eeb2)  
## Combined standings over the two seasons combined
## <img width="330" alt="Screenshot 2025-03-22 at 1 15 00 PM" src="https://github.com/user-attachments/assets/67c53d48-0f68-4c3c-bd36-b9ad32a0191c" />

## Win probability based on points scored 
# ![Win probability plot](https://github.com/user-attachments/assets/92fe7031-1c1e-428d-8083-a52fcb890ef5)
## it was found that scoring 150 points or less gives a team less than a 20% chance to win. There is a steep increase in win probability from 150 points scored or less until a teams scores 170 points. From 170 points scored-200 points scored the win probability increases steadlily. Once a team scores 200 points, they have a win proability of about 75% and the win probability has steep increaes as points scored goes beyond 200 points 

# 2023 Matt vs 2024 Josh 
## in 2023, Matt was the league champion while leading the league in points scored and wins. In 2024, Josh was by far the best team in the league and had a 13-1 record in the regular season, unfortunately for Josh he ran into a red hot team in the playoffs and despite his team putting up a valiant performance, he fell short of winning a championship. Despite not winning a championship, his greatness did not go unnoticed and I decided to run a simulation of these two titans to see which team had the better year. I ran a simulation of 10 14 game seasons to determine who had the better team.  
## <img width="265" alt="Samples 1 and 2" src="https://github.com/user-attachments/assets/bf564c0c-2321-40d8-ae96-b298288332cc" />

## <img width="249" alt="Samples 3 and 4" src="https://github.com/user-attachments/assets/61786342-1b7a-4494-96b0-f6e9ca05eaf2" />

## <img width="259" alt="Samples 5 and 6" src="https://github.com/user-attachments/assets/ef362532-2c9c-4f4d-9a31-f5d6c2ea2bb7" />

## <img width="280" alt="Samples 7 and 8" src="https://github.com/user-attachments/assets/b005ac7d-71a6-4c58-9846-674d42c350a1" />

## <img width="257" alt="Samples 9 and 10" src="https://github.com/user-attachments/assets/c1165185-04de-406c-883e-aee790943bd7" />
## The clash between these two titan teams over the course of 10 seasons was heavily in the favor of 2024 Josh. Over the course of the 10 seasons Josh managed an 86-54 record, which comes out to a .614 winning percentage. In 3 seasons, Josh won 11 games and in another 3 seasons he won 9 games. In 2 of the seasons 2023 Matt and 2024 Josh managed to finish 7-7 angainst one another while 2023 Matt pulled off 8 win seasons twice. Based on these simulations it's clear that despite that 2023 Matt won a championship and had an incredible seasoon, 2024 Josh was on a different level. 

# Is Evan that bad?

## In every league, someone must finish in last, unfortunately in both seasons, team Evan has finished in last place and has scored the least amount of points. As I simulated 10 seasons of the best teams playing, I also simulated the worst team over the course of 10 seasons against the rest of the league.  

## <img width="287" alt="Seasons 1 and 2" src="https://github.com/user-attachments/assets/19b3b5be-0c48-4e06-8928-8ab42e630102" />

## <img width="285" alt="Seasons 3 and 4" src="https://github.com/user-attachments/assets/767a8152-5445-4a21-ba9a-8d519635ca8a" />

## <img width="276" alt="Seasons 5 and 6" src="https://github.com/user-attachments/assets/2ce11607-3f68-4aaf-aeee-7aaf051eee40" />

## <img width="279" alt="Seasons 7 and 8" src="https://github.com/user-attachments/assets/63a67bcd-6a9d-4c58-9a61-2b3287fb0330" />

## <img width="284" alt="Seasons 9 and 10" src="https://github.com/user-attachments/assets/a8eedef8-27c4-48b1-b0fd-cfea106dfae7" />
## Evan's matchups over the course of 10 seasons was heavily in the favor of his opponents. Over the course of the 10 seasons Evan had a 53-87 record, which comes out to a .378 winning percentage. In Evan's three worst seasons, he managed 3 wins and 4 wins twice. He pulled off 5 wins twice and managed to win 6 games in 3 simulations. In a miraculous fashion, Evan did pull off a .500 record twice. over the course of 10 seasons, he averaged roughly a 5-9 record. It is worth noting that in samples 2 and 3 where Evan managed to pull off a .500 record that he did have a significant amount of luck in regards to how his opponents performed. If his two seasons of a .500 record are not taken into account, His record was 39-73 with a .348 win percentage while averaging only 3.9 wins per season. With a lot of luck on Evan's side, he could manage a .500 record, but it's certianly noticable that Evan does not stack up well against the rest of the league 

# T-test winning scores vs losing scores 
## <img width="508" alt="t-test" src="https://github.com/user-attachments/assets/52a5e5b8-b954-45df-9e75-7ab4d93e97aa" />
## based on the findings of the t-test, we know that there is a major statistical signifgance between the mean scores of winning teams and losing teams. Since our p-value is so small, we can reject our null hypothesis that there is not signigfance between winning and losing scores. We also have a very large t-statistic telling us that there is a signifgant difference between the winning and losing groups. The mean of the winning group and the losing group had a difference of almost 23 points.  

## Boxplot of samples from t-test:  ![boxplot](https://github.com/user-attachments/assets/dd873ed0-4a0e-4ba0-b0df-ccdb542accf9)
