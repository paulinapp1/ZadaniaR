#1
library(tidyverse)
library(readxl)
library(vroom)
library(dplyr)
dane <- read_xlsx("C:\\Users\\pauli\\OneDrive\\Pulpit\\ekonomia\\WorldCupMatches.xlsx")
wlochy <- dane %>%
  filter(etap == "Final" & 
           (`Home Team Name` == "Italy" | `Away Team Name` == "Italy")) %>%
  summarise(count=n())
print(wlochy)
#Odp: 6
#2
bramki <- dane %>%
  group_by(MatchID ) %>%
summarise(total_goals = sum(`Home Team Goals`) + sum(`Away Team Goals`))
najwieksza_liczba_bramek <- max(bramki$total_goals)

najwieksza_liczba_bramek
#Odp : 16
#3
miasta <- dane %>%
  group_by(City) %>%
  summarise(count1 = n())

najwieksza <- max(miasta$count1)

miasto_najwiecej_meczy <- miasta %>%
  filter(count1 == najwieksza)

print(miasto_najwiecej_meczy)
#Mexico City 23
#4
widzowie <- dane %>%
  summarise(avg_attendance=mean(Attendance, na.rm = TRUE))
print(widzowie$avg_attendance)
#Odp: 45164,8
#5
gole <- dane
polowa_gosci <- gole %>%
  summarise(wygrana_gosci = (`Away Team Goals` > `Home Team Goals` & `Half-time Home Goals` > `Half-time Away Goals`)) %>%
  filter(wygrana_gosci == TRUE)

polowa_gospodarz <- gole %>%
  summarise(wygrana_gospodarz = `Home Team Goals` > `Away Team Goals` & `Half-time Away Goals` > `Half-time Home Goals`) %>%
  filter(wygrana_gospodarz == TRUE)

wynik <- nrow(polowa_gosci) + nrow(polowa_gospodarz)
#Odp : 38