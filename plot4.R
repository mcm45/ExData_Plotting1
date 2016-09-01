#Exploratory Data Project 1 - Plot 4

#reading in data
file <- "./Documents/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt"
epc <- read.table(file, header=TRUE, sep=";")
epc2 <- subset(epc, Date %in% c("1/2/2007","2/2/2007")) #subset two days

#convert to numeric
GlobalActivePower <- as.numeric(epc2$Global_active_power)
Sub_metering_1 <- as.numeric(epc2$Sub_metering_1)
Sub_metering_2 <- as.numeric(epc2$Sub_metering_2)
Sub_metering_3 <- as.numeric(epc2$Sub_metering_3)
Voltage <- as.numeric(epc2$Voltage)
GlobalReactivePower <- as.numeric(epc2$Global_reactive_power)
#change date and time format
datetime <- strptime(paste(epc2$Date, epc2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480) #initialize device
par(mfrow = c(2,2)) #set up 2x2 grid

#plot4.1
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot4.2
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

#ploy4.3
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4.4
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() #to view png file
