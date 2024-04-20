library(tidyverse)
library(readxl)
library(vroom)
library(dplyr)
#1
dane <- read_xlsx("C:\\Users\\pauli\\OneDrive\\Pulpit\\ekonomia\\wybory2020.xlsx")
frek <- dane %>%
  filter(Frekwencja>80)
print(frek)
#2
miasta <- dane %>%
  filter(Gmina == "m. Poznań") %>%
  summarise(suma = n())

print(miasta)
#Odp: 251
#3
typ <- dane %>%
  group_by(`Typ obszaru`) %>%
  summarise(count = n())
print(typ)
#4
woj <- dane %>%
  group_by(Województwo)%>%
summarise(sred=mean(Frekwencja))
print(woj)
#5
kandydat_A <- "Andrzej Sebastian DUDA"
kandydat_B <- "Rafał Kazimierz TRZASKOWSKI"
woj_różnica <- dane %>%
  group_by(Województwo) %>%
  summarise(różnica = sum(get(kandydat_A)) - sum(get(kandydat_B)), .groups = "drop")
największa_różnica <- woj_różnica %>%
  filter(różnica == max(różnica, na.rm = TRUE))
print(największa_różnica)
