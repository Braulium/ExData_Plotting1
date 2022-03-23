power <- read.csv2("household_power_consumption.txt", sep = ";", dec = ".",  na.strings = "?", colClasses = c("character", "character", c(rep("numeric", 7))))
power_feb <- power[grepl("[12]/2/2007", power$Date),]
##Opening a png file
png("plot1.png", width = 480, height = 480)
##Generating plot
hist(power_feb$Global_active_power, main = "histogram of Global Active Power", xlab= "Global active power in kilowatts")
##Closing file
dev.off()