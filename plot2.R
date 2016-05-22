#read in file
data <- "./household_power_consumption.txt"
# read tables in the file
data2 <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#create a subset of the data file based on a specific period
data3 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

date_and_time <- strptime(paste(data3$Date, data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data3$Global_active_power)
png("plot2.png", width=480, height=480)

# do the plots
plot(date_and_time, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

