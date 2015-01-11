##################################
#### 1. Load and Process the Data
##################################

# Load the Electric Power Consumption dataset into R
data <- read.csv("./household_power_consumption.txt", sep = ";",
                 na.strings = "?")

## Load the dplyr package
library(dplyr)

# Subset the Data with dplyr, so only the days 2007-02-01 and 2007-02-02 
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
png(filename= "plot3.png", width = 480, height = 480)

# Set the margins as they appear in the example plot
par(mar = c(4, 6, 4, 3))

# Create the Plot of the relationship between the date and Sub_metering_1
plot(data$DateTime, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = " ") 

# Add a red line to the plot that shows the relationship between the date 
# and Sub_metering 2
lines(data$DateTime, data$Sub_metering_2, col = "red")

# Add a blue line to the plot that shows the relationship between the date 
# and Sub_metering 3
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# Add the legend to the plot
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the file device
dev.off() 