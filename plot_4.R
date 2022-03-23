power <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".",  na.strings = "?", colClasses = c("character", "character", c(rep("numeric", 7))))
power_feb <- power[grepl("^[1-2]/2/2007", power$Date),]
power_feb$moment <- as.POSIXct(paste(power_feb$Date, power_feb$Time), format="%d/%m/%Y %H:%M:%S")
#Opening file to create output png file
png("plot4.png", width = 480, height = 480)
##Generating 2x2 plot area
par(mfrow=c(2,2))
##Plot 1
plot(power_feb$moment, power_feb$Global_active_power, type ="l", xlab = "Time", ylab = "Global active power")
##Plot 2
plot(power_feb$moment, power_feb$Voltage, type ="l", xlab = "Time", ylab = "Voltage")
##Plot 3: three lines and a legend
plot(power_feb$moment, power_feb$Sub_metering_1, type="l", lwd=1, col = 1, ylab = "Energy sub metering", xlab = "time")
lines(power_feb$moment, power_feb$Sub_metering_2, type="l", lwd=1, col = 2)
lines(power_feb$moment, power_feb$Sub_metering_3, type="l", lwd=1, col = 3)
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       col=c("black", "green", "red"), lty = 1:2, cex=0.8)
##Plot 4
plot(power_feb$moment, power_feb$Global_reactive_power, type="l", lwd=1, col = 1, ylab = "Global reactive power", xlab = "time")
dev.off()
