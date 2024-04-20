library(tidyverse)

filmy <- read_csv("http://wawrowski.edu.pl/data/movies.csv")
ggplot(filmy, aes(x=rating, y=duration)) + 
  geom_point() +
  xlab("Ocena filmu") +
  ylab("Długość filmu (w minutach") +
  xlim(0,10) +
  theme_light()
wybrane_filmy <- filmy %>% 
  filter(genre %in% c("Action", "Comedy", "Drama"))

filmy %>% 
  filter(genre %in% c("Action", "Comedy", "Drama")) %>% 
  ggplot(data = ., mapping = aes(x=rating)) + 
  geom_histogram(binwidth = 0.5, fill = "pink") +
  xlim(0,10) +
  xlab("Ocena filmu") +
  ylab("Liczba filmów") +
  facet_wrap(~ genre) +
  theme_bw()
filmy %>% 
  count(director) %>% 
  top_n(10, n) %>% 
  mutate(director=fct_reorder(director,n)) %>% 
  ggplot(aes(x=n, y=director)) +
  geom_col(fill = "pink") +
  geom_text(aes(label = n), hjust = 1.5, color = "black") +
  xlab("Liczba filmów") +
  ylab("Reżyser") +
  theme_classic()
filmy %>% 
  mutate(year_decade=cut(year, seq(1920, 2020, 10), include.lowest=T, dig.lab=4)) %>% 
  ggplot(aes(x=duration, y=year_decade)) +
  geom_boxplot() +
  xlab("Długość filmu (w minutach)") +
  ylab("Dekada") +
  theme_minimal()
