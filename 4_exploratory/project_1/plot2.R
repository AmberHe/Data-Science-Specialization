setwd("C:\\Users\\Administrator\\Desktop\\Data-Science-Specialization\\4_exploratory\\project_1")
dat <- read.csv("sub.csv")
dat <- dat[order(dat[,"TIME"]),]
dat$TIME <- strptime(dat$TIME, format = "%Y-%m-%d %H:%M:%S")
plot(dat$TIME, dat$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)") 

#Because my OS is Chinese, I have to set x-ticks manually.
axis.POSIXct(1, at = c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-02 23:59:00"), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png")
dev.off()

