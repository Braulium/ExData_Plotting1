getwd()
power <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".",  na.strings = "?", colClasses = c("character", "character", c(rep("numeric", 7))))
power_feb <- power[grepl("[12]/2/2007", power$Date),]
hist(power_feb$Global_active_power, main = "histogram of Global Active Power", xlab= "Global active power in kilowatts")