#read in file
data <- "./household_power_consumption.txt"
# read tables in the file
data2 <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#create a subset of the data file based on a specific period
data3 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]


date_and_time <- strptime(paste(data3$Date, data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data3$Global_active_power)
SMeter1 <- as.numeric(data3$Sub_metering_1)
SMeter2 <- as.numeric(data3$Sub_metering_2)
SMeter3 <- as.numeric(data3$Sub_metering_3)

# do the plots
png("plot3.png", width=480, height=480)
plot(date_and_time, SMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(date_and_time, SMeter2, type="l", col="red")
lines(date_and_time, SMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()