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

#Creating a png
png("plot3.png", width=480, height=480)
# Plotting the data
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()