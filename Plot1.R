#Read Data
library(dplyr)
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data <- data %>%
        filter(data$Date == "1/2/2007" | data$Date == "2/2/2007") %>%
        mutate(DateTime = strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S")) %>%
        select(-Date, -Time)

#Generate Plot
png("Plot1.png")
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()