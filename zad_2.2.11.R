#ZADANIE 1
nums <- c(12,5,20,18,8.5,10,4,101,-2)
sum(nums[nums>10])
#ZADANIE 2
wektor <- c(seq(2, 8, by = 2), rep(0, 2))

print(wektor)
#ZADANIE 3
a <- c(2,3,7,8,2)
b <- c(9,1,2,0,2)
a<=b
#odp: TRUE FALSE FALSE FALSE  TRUE
#ZADANIE 4
letters <- c(letters, "ą", "ć", "ę", "ł", "ń", "ó", "ś", "ź", "ż")
length(letters)
#ZADANIE 5
install.packages("moments")
library(moments)
set.seed(76)
kurtosis(runif(1000))

