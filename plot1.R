Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$Date <- as.Date(Electric_power_consumption$Date, "%d/%m/%Y")

subset <- Electric_power_consumption[Electric_power_consumption$Date == "2007-02-01" |
                                       Electric_power_consumption$Date == "2007-02-02", ]

subset$Datetime <- strptime(paste(subset$Date, subset$Time),
                            "%Y-%m-%d %H:%M:%S")

png("plot1.png", width = 480, height = 480)

hist(as.numeric(subset$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()