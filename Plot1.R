# Create Plot1 -- A frequency histogram of Global active power
#
# First the data are read into hpc from household_power_consumption.txt in the working directory
# Then filtered to the required dates.

hpc <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

data <- as.numeric(hpc[,"Global_active_power"])

# Now create the Plot
# Only non default parameters need to be specified (height and width default to 480 pixels)
png("Plot1.png")
hist(data, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()
