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

## plot graph 4

## setting png graphic device
png(filename = "Plot4.png", width = 480, height = 480, units = "px")

## adjusting mfrow
par(mfcol=c(2,2))
par(mar = c(4,4,6,2))
par(oma = c(2,2,2,2))
## plotting graph 1
with(Input2, plot(Global_active_power, xaxt = "n", type = "l", xlab = "", 
                  ylab = "Global Active Power"))
axis(1, c(min(grep("2007-01-02", Input2$Date)),min(grep("2007-02-02", 
        Input2$Date)),min(grep("2007-03-02", Input2$Date))), c("Thu",
        "Fri", "Sat"))
## plotting graph 2
with(Input2, plot(Sub_metering_1, xaxt = "n", type = "l", xlab = "", ylab = "Energy submetering"))
with(Input2, points(Sub_metering_2, col = "orange", type = "l", ylab = "Energy submetering"))
with(Input2, points(Sub_metering_3, col = "blue", type = "l", ylab = "Energy submetering"))

## creaing axis
axis(1, c(min(grep("2007-01-02", Input2$Date)),min(grep("2007-02-02", 
         Input2$Date)),min(grep("2007-03-02", Input2$Date))), c("Thu",
                                                        "Fri", "Sat"))
## creating legend
legend("topright",pch = c("_","_","_"), legend = c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"), bty = "n", col = c("black", "orange", "blue"))
## plotting graph 3
with(Input2, plot(Voltage, xaxt = "n", type = "l", xlab = "datetime", 
                  ylab = "Voltage"))
axis(1, c(min(grep("2007-01-02", Input2$Date)),min(grep("2007-02-02", 
       Input2$Date)),min(grep("2007-03-02", Input2$Date))), c("Thu",
                                                        "Fri", "Sat"))
## plotting graph 4
with(Input2, plot(Global_reactive_power, xaxt = "n", type = "l", xlab = "datetime", 
                  ylab = "Global_reactive_power"))
axis(1, c(min(grep("2007-01-02", Input2$Date)),min(grep("2007-02-02", 
                 Input2$Date)),min(grep("2007-03-02", Input2$Date))), c("Thu",
                                                                 "Fri", "Sat"))

## closing graphic device png
dev.off()
