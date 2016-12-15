setwd("C:\\Users\\Administrator\\Desktop\\Data-Science-Specialization\\4_exploratory\\project_1")
dat <- read.csv("sub.csv")
dat <- dat[order(dat[,"TIME"]),]
dat$TIME <- strptime(dat$TIME, format = "%Y-%m-%d %H:%M:%S")
with(dat, plot(TIME, Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering"))
with(dat, lines(TIME, Sub_metering_2, col = "red", type = "l", xaxt = "n"))
with(dat, lines(TIME, Sub_metering_3, col = "blue", type = "l", xaxt = "n"))

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Because my OS is Chinese, I have to set x-ticks manually.
axis.POSIXct(1, at = c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-02 23:59:00"), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot3.png")
dev.off()