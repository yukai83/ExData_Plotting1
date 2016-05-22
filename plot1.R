#read in file
data <- "./household_power_consumption.txt"
# read tables in the file
data2 <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#create a subset of the data file based on a specific period
data3 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]


GAP <- as.numeric(data3$Global_active_power)
png("plot1.png", width=480, height=480)

# do the plots
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()