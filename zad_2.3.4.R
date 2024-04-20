#ZADANIE 1 
#otrzymamy macierz jednostkową
A <- matrix(c(1, 2, 3, 4), nrow = 2)
A_inverse <- solve(A)
A %*% A_inverse
#ZADANIE 2
x0 <- c(2, 4, 1, 6, 9, 3, 2, 9, 10, 7)
x1 <- c(1.5, 0.2, 0.1, 2, 3.1, 1.2, 0.4, 2.9, 2.5, 1.9)
x2 <- rep(1, length(x0))
X <- cbind(x0, x1, x2)
y <- c(12, 15, 10, 19, 26, 13, 13, 21, 29, 18)
wynik <- solve(t(X) %*% X) %*% t(X) %*% y
wynik
#ZAD3
data("ChickWeight")
ile_razy_jedzenie_15 <- sum(ChickWeight$Chick == 15)
print(ile_razy_jedzenie_15)
waga_mediany_35 <- median(ChickWeight$weight[ChickWeight$Chick == 35])
print(waga_mediany_35)
srednia_waga_dieta <- aggregate(weight ~ Diet, data = ChickWeight, FUN = mean)
print(srednia_waga_dieta)


