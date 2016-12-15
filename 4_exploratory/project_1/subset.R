setwd("C:\\Users\\Administrator\\Desktop\\Data-Science-Specialization\\4_exploratory\\project_1")
test <- read.table("household_power_consumption.txt", nrows = 5)
test
test <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 5)
powerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 

powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")
powerSub <- powerConsumption[powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02",]
Date.c<-as.character(powerSub$Date)
Time.c <- as.character(powerSub$Time)
TIME <- paste(Date.c, Time.c)
powerSub <- data.frame(powerSub, TIME)
write.csv(powerSub, file = "sub.csv", row.names = FALSE)
