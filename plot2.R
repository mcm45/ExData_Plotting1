#Exploratory Data Project 1 - Plot 2

#reading in data
file <- "./Documents/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt"
epc <- read.table(file, header=TRUE, sep=";")
epc2 <- subset(epc, Date %in% c("1/2/2007","2/2/2007")) #subset two days

GlobalActivePower <- as.numeric(epc2$Global_active_power) #convert format to numberic
datetime <- strptime(paste(epc2$Date, epc2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #change date and time format
png("plot2.png", width=480, height=480) #initalize device
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off() #to view png file