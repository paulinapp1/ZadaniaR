library("httr")
library("readxl")
GET("https://query.data.world/s/vb63eqahq375pxsaz7aa62y4bxtz4r?dws=00000", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
head(df)
#Rozkład dochodów gospodarstw domowych w USA według stanów