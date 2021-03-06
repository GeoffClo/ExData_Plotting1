# Create Plot3 -- A row of two line charts displaying sub-metering data
#
# First the data are read into hpc from household_power_consumption.txt in the working directory
# Then filtered to the required dates.

hpc <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

library(lubridate)
hpc$DateTime <- dmy(hpc$Date) + hms(hpc$Time)

# Now create the Plot
# Only non default parameters need to be specified (height and width default to 480 pixels)
png("Plot3.png")
plot(hpc$Sub_metering_1 ~ hpc$DateTime, type="l", xlab="", ylab="Energy sub metering")

lines(hpc$Sub_metering_2 ~ hpc$DateTime, col="red")
lines(hpc$Sub_metering_3 ~ hpc$DateTime, col="blue")

legend("topright", lty=1, col = c("black", "blue", "red"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

