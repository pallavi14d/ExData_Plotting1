# Downloadung the entire data set
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting the data 
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(data_sub$Global_active_power)
# Creating a png file
png("plot1.png", width=480, height=480)
# Constructing the histogram
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()