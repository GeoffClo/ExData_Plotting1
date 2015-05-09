
hpc <- read.csv("household_power_consumption.txt", sep=";", nrows=100000, stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

data <- hpc[,c("Date", "Time", GAP="Global_active_power")]
library(lubridate)
data$DateTime <- dmy(data$Date) + hms(data$Time)

png("Plot2.png")
plot(data$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()


