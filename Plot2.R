# Create Plot2 -- A line chart of Global active power
#
# First the data are read into hpc from household_power_consumption.txt in the working directory
# Then filtered to the required dates.

hpc <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

library(lubridate)
hpc$DateTime <- dmy(hpc$Date) + hms(hpc$Time)

# Now create the Plot
# Only non default parameters need to be specified (height and width default to 480 pixels)
png("Plot2.png")
plot(hpc$Global_active_power ~ hpc$DateTime, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()
