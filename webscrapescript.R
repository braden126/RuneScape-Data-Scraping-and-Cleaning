library(rvest)
library(stringr)
library(tidyverse)

rsweb <- read_html("https://oldschool.runescape.com/slu")

rswebdata <- html_nodes(rsweb,'.server-list__row-cell')
rsdata <- html_text(rswebdata)
rsdata <- gsub("\n"," ",rsdata)


rsdata <- as.data.frame(split(rsdata, 1:5))


rsdata <- rsdata %>%
  rename(world = X1, players = X2, country = X3, type = X4, activity = X5)

rsdata$world <- gsub(" ","",rsdata$world)
rsdata$world <- gsub("OldSchool","",rsdata$world)

rsdata$players <- gsub(" ","",rsdata$players)
rsdata$players <- gsub("players","",rsdata$players)

rsdata$activity <- gsub("-","regular",rsdata$activity)
rsdata$activity <- gsub(",","",rsdata$activity)

rsdata$players <- as.integer(rsdata$players)

rsdata$time <- Sys.time()


write.table(rsdata, file = "C:\\Users\\Braden\\Documents\\RuneScape-Data-Scraping-and-Cleaning\\alldata.csv", sep = ",", append = TRUE, quote = FALSE,
            col.names = FALSE, row.names = FALSE)


