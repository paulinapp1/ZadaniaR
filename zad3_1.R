library(tidyverse)
library(readxl)
library(vroom)
#1
rossmann <- read_xlsx("C:\\Users\\pauli\\OneDrive\\Pulpit\\ekonomia\\rossmann.xlsx")
as_roz <- rossmann %>%
  filter( data=="2014-02-25" & sklep_asort=="Rozszerzony")
print(as_roz)
#Odp: 513
#2
sklep_101 <- rossmann %>%
  filter(sklep_id=="101")
avg_cust <- sklep_101 %>%
  group_by(dzien_tyg) %>%
summarise(avg_customer=mean(liczba_klientow))
print(avg_cust)  
max_average_customers_day <- avg_cust %>%
  filter(avg_customer == max(avg_customer))
print(max_average_customers_day)
#Odp: Poniedziałek
#3
sklepy <- rossmann %>%
  group_by(sklep_typ) %>%
  summarise(med = median(sprzedaz, na.rm = TRUE))
max_med <- sklepy %>%
  filter(med == max(med, na.rm = TRUE))
print(max_med)
#Odp: b
#4
library(dplyr)
changed_stores <- rossmann %>%
  group_by(sklep_id) %>%
  summarise(n_unique = n_distinct(sklep_konkurencja)) %>%
  filter(n_unique > 1) %>%
  pull(sklep_id)

print(changed_stores)
#nie zmienilo sie w zadnym ze sklepów
#5
kurs_eur <- read_xls("C:\\Users\\pauli\\OneDrive\\Pulpit\\ekonomia\\danezad5.xls")