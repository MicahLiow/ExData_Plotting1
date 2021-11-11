#Read Data
library(dplyr)
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data <- data %>%
        filter(data$Date == "1/2/2007" | data$Date == "2/2/2007") %>%
        mutate(DateTime = strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S")) %>%
        select(-Date, -Time)

#Generate Plot
png("Plot4.png")
par(mfcol = c(2, 2))

#Top Left
with(data, plot(DateTime, Global_active_power, type = "l", 
        xlab = "", ylab = "Global Active Power"))

#Bottom Left
with(data, plot(DateTime, Sub_metering_1, type = "l", 
        col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, type = "l", 
        col = "red"))
with(data, lines(DateTime, Sub_metering_3, type = "l",
        col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lty = 0)

#Top Right
with(data, plot(DateTime, Voltage, type = "l", 
        xlab = "datetime"))

#Bottom Right
with(data, plot(DateTime, Global_reactive_power, type = "l", 
        xlab = "datetime"))

dev.off()