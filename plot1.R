#Exploratory Data Project 1 - Plot 1

#reading in data
file <- "./Documents/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt"
epc <- read.table(file, header=TRUE, sep=";")
epc2 <- subset(epc, Date %in% c("1/2/2007","2/2/2007")) #subset two days

GlobalActivePower <- as.numeric(epc2$Global_active_power) #convert format to numeric

png("plot1.png", width=480, height=480) #initialize device
#with(epc2, hist(GlobalActivePower))
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off() #to view png file
