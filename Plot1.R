
hpc <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

data <- hpc[,"Global_active_power"]
class(data) <- "numeric"

png("Plot1.png")
hist(data, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()
