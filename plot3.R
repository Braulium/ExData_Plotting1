power <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".",  na.strings = "?", colClasses = c("character", "character", c(rep("numeric", 7))))
power_feb <- power[grepl("^[1-2]/2/2007", power$Date),]
power_feb$moment <- as.POSIXct(paste(power_feb$Date, power_feb$Time), format="%d/%m/%Y %H:%M:%S")
plot(power_feb$moment, power_feb$Sub_metering_1, type="l", lwd=1, col = 1)
lines(power_feb$moment, power_feb$Sub_metering_2, type="l", lwd=1, col = 2)
lines(power_feb$moment, power_feb$Sub_metering_3, type="l", lwd=1, col = 3)
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       col=c("black", "green", "red"), lty = 1:2, cex=0.8)
