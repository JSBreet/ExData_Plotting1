##################################
#### 1. Load and Process the Data
##################################

# Load the Electric Power Consumption dataset into R
data <- read.csv("./household_power_consumption.txt", sep = ";",
                 na.strings = "?")

## Load the dplyr package
library(dplyr)

# Subset the Data with dplyr ,so only the days 2007-02-01 and 2007-02-02 
## are retained
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new variable containing both the Date and Time
data$DateTime <- paste(data$Date, data$Time)

# Convert the DateTime variable to the POSIXct class
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

######################################
#### 2. Create the Plot and PNG File
######################################

# Open the file device
png(filename= "plot4.png", width = 480, height = 480)

# Set the margins as they appear in the example plot
par(mfrow = c(2, 2), mar = c(5, 5, 4, 2))

## Plot 1: Date and Global Active Power
plot(data$DateTime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = " " )

## Plot 2: Date and Voltage
plot(data$DateTime, data$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")

## Plot 3: Date and Energy Sub Metering
plot(data$DateTime, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = " ") 
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## PLot 4: Date and Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

# Close the file device
dev.off() 