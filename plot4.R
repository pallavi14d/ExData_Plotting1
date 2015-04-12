# Downloadung the entire data set
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting the data 
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Converting Date & Time variables into Date/Time classes
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Converting data into numeric
GlobalActivePower <- as.numeric(data_sub$Global_active_power)
Sub_metering_1 <- as.numeric(data_sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(data_sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(data_sub$Sub_metering_3)
Global_reactive_power <- as.numeric(data_sub$Global_reactive_power)
Voltage <- as.numeric(data_sub$Voltage)


# Creating a png
png("plot4.png", width=480, height=480)


# Placing the multiple graphs 
par(mfrow = c(2, 2)) 


# Plotting different types of graphs
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()