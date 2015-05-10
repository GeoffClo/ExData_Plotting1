# Create Plot2 -- A line chart of Global active power
#
# First the data are read into hpc from household_power_consumption.txt in the working directory
# Visual inspection shows that the required dates are all within the first 100000 rows.

hpc <- read.csv("household_power_consumption.txt", sep=";", nrows=100000, stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

data <- hpc[,c("Date", "Time", GAP="Global_active_power")]
library(lubridate)
data$DateTime <- dmy(data$Date) + hms(data$Time)

# Now create the Plot
# Only non default parameters need to be specified (height and width default to 480 pixels)
png("Plot2.png")
plot(data$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()
