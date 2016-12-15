#Global Active Power
setwd("C:\\Users\\Administrator\\Desktop\\Data-Science-Specialization\\4_exploratory\\project_1")
dat <- read.csv("sub.csv")
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()