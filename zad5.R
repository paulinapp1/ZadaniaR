#1
losowanie_daty <- function(liczba_osob) {
  daty <- sample(1:365, liczba_osob, replace = TRUE)
  czy_powtorzyla_sie <- any(duplicated(daty))
  return(czy_powtorzyla_sie)
}
symulacja <- replicate(100000, losowanie_daty(23))
prawdopodobienstwo <- sum(symulacja) / length(symulacja) * 100
print(paste("Prawdopodobieństwo, że dwie osoby w grupie 23 osób będą miały urodziny tego samego dnia wynosi:", prawdopodobienstwo, "%"))
#2
znajdz_dzielniki <- function(liczba) {
  dzielniki <- c()
  for (i in 1:liczba) {
    if (liczba %% i == 0) {  
      dzielniki <- c(dzielniki, i)  
    }
  }
  return(dzielniki)
}

liczba <- 36
print(paste("Dzielniki liczby", liczba, "to:", znajdz_dzielniki(liczba)))
#3
gra_kamien_nozyce_papier <- function(wybor_uzytkownika, strategia_komputera) {
  if (!wybor_uzytkownika %in% c("kamień", "nożyce", "papier")) {
    stop("Nieprawidłowy wybór. Wprowadź 'kamień', 'nożyce' lub 'papier'.")
  }
  kombinacje <- c("kamień", "papier", "nożyce")
  if (strategia_komputera == "losowo") {
    wybor_komputera <- sample(kombinacje, 1)
  } else if (strategia_komputera == "zawsze_wygrywa") {
    wybor_komputera <- switch(wybor_uzytkownika,
                              kamień = "papier",
                              nożyce = "kamień",
                              papier = "nożyce")
  } else if (strategia_komputera == "zawsze_przegrywa") {
    wybor_komputera <- switch(wybor_uzytkownika,
                              kamień = "nożyce",
                              nożyce = "papier",
                              papier = "kamień")
  } else {
    stop("Nieprawidłowa strategia komputera. Wprowadź 'losowo', 'zawsze_wygrywa' lub 'zawsze_przegrywa'.")
  }
  
  Sys.sleep(1)
  
  cat("Komputer wybrał:", wybor_komputera, "\n")
  
  if (wybor_uzytkownika == wybor_komputera) {
    return("Remis!")
  } else if ((wybor_uzytkownika == "kamień" && wybor_komputera == "nożyce") ||
             (wybor_uzytkownika == "nożyce" && wybor_komputera == "papier") ||
             (wybor_uzytkownika == "papier" && wybor_komputera == "kamień")) {
    return("Wygrałeś!")
  } else {
    return("Przegrałeś!")
  }
}

wybor_uzytkownika <- "kamień"  
strategia_komputera <- "losowo" 

wynik <- gra_kamien_nozyce_papier(wybor_uzytkownika, strategia_komputera)
print(wynik)

