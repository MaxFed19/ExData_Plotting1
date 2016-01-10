## make plot 1
library(tidyr)
library(dplyr)
library(lubridate)

## load input data
Input <- read.csv("household_power_consumption.txt", sep = ";",
                  row.names = NULL)[66638:69517,]
## tidy data
Input2 <- tbl_df(Input)
Input2$Date <- as.Date(Input2$Date)
Input2$Global_active_power <- as.numeric(as.character(Input2$Global_active_power))
Input2$Global_reactive_power <- as.numeric(as.character(Input2$Global_reactive_power))
Input2$Voltage <- as.numeric(as.character(Input2$Voltage))
Input2$Global_intensity <- as.numeric(as.character(Input2$Global_intensity))
Input2$Sub_metering_1 <- as.numeric(as.character(Input2$Sub_metering_1))
Input2$Sub_metering_2 <- as.numeric(as.character(Input2$Sub_metering_2))
Input2$Sub_metering_3 <- as.numeric(as.character(Input2$Sub_metering_3))

## plot histogram 1

## setting png graphic device
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
## plotting
with(Input2, hist(Global_active_power, col = "red", main = "Global Active Power"
                  , xlab = "Global Active Power (kilowatts)"))
## closing graphic device png
dev.off()
