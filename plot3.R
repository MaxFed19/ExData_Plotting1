## make plot 3
library(tidyr)
library(dplyr)
library(lubridate)

## load input data
Input <- read.csv("household_power_consumption.txt", sep = ";",
                  row.names = NULL)[66638:69517,]
## tidy data
Input2 <- tbl_df(Input)
Input2$Date <- as.Date(as.character(Input2$Date), format = "%m/%d/%Y")
Input2$Global_active_power <- as.numeric(as.character(Input2$Global_active_power))
Input2$Global_reactive_power <- as.numeric(as.character(Input2$Global_reactive_power))
Input2$Voltage <- as.numeric(as.character(Input2$Voltage))
Input2$Global_intensity <- as.numeric(as.character(Input2$Global_intensity))
Input2$Sub_metering_1 <- as.numeric(as.character(Input2$Sub_metering_1))
Input2$Sub_metering_2 <- as.numeric(as.character(Input2$Sub_metering_2))
Input2$Sub_metering_3 <- as.numeric(as.character(Input2$Sub_metering_3))

## plot graph 3

## setting png graphic device
png(filename = "Plot3.png", width = 480, height = 480, units = "px")

## plotting
with(Input2, plot(Sub_metering_1, xaxt = "n", type = "l", ylab = "Energy submetering"))
with(Input2, points(Sub_metering_2, col = "orange", type = "l", ylab = "Energy submetering"))
with(Input2, points(Sub_metering_3, col = "blue", type = "l", ylab = "Energy submetering"))

## creaing axis
axis(1, c(min(grep("2007-01-02", Input2$Date)),min(grep("2007-02-02", 
          Input2$Date)),min(grep("2007-03-02", Input2$Date))), c("Thu",
                                                                 "Fri", "Sat"))
## creating legend
legend("topright",pch = c("_","_","_"), legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), col = c("black", "orange", "blue"))
## closing graphic device png
dev.off()
