#Exploratory Data Project 1 - Plot 3

#reading in data
file <- "./Documents/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt"
epc <- read.table(file, header=TRUE, sep=";")
epc2 <- subset(epc, Date %in% c("1/2/2007","2/2/2007")) #subset two days

#convert to numeric
Sub_metering_1 <- as.numeric(epc2$Sub_metering_1)
Sub_metering_2 <- as.numeric(epc2$Sub_metering_2)
Sub_metering_3 <- as.numeric(epc2$Sub_metering_3)
#change date and time format
datetime <- strptime(paste(epc2$Date, epc2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480) #initalize device

plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() #to view png file