power <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".",  na.strings = "?", colClasses = c("character", "character", c(rep("numeric", 7))))
power_feb <- power[grepl("^[1-2]/2/2007", power$Date),]
power_feb$moment <- as.POSIXct(paste(power_feb$Date, power_feb$Time), format="%d/%m/%Y %H:%M:%S")
##Opening a png file
png("plot2.png", width = 480, height = 480)
##Generating plot
plot(power_feb$moment, power_feb$Global_active_power, type ="l")
##Closing file
dev.off()