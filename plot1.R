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
png(filename= "plot1.png", width = 480, height = 480)

# Create the Plot
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close the file device
dev.off() 