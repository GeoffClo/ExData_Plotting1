
hpc <- read.csv("household_power_consumption.txt", sep=";", nrows=100000, stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

data <- hpc[,c("Date", "Time", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")]

library(lubridate)
data$DateTime <- dmy(data$Date) + hms(data$Time)

png("Plot4.png")

par(mfrow=c(2,2)) 

plot(hpc$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global active power")

plot(hpc$Voltage ~ data$DateTime, type="l", xlab="datetime", ylab="Voltage")

plot(data$Sub_metering_1 ~ data$DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2 ~ data$DateTime, col="red")
lines(data$Sub_metering_3 ~ data$DateTime, col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(hpc$Global_reactive_power ~ data$DateTime, type="l", xlab="datetime", ylab="Global reactive power")

dev.off()
