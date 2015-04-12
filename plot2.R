# Reading the entire data set in
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting the data set
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Converting Date & Time variables into Date/Time classes
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Converting it into numeric data
GlobalActivePower <- as.numeric(data_sub$Global_active_power)
# Creating a png file
png("plot2.png", width=480, height=480)
# Plotting the data
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()