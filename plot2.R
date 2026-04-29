Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$Date <- as.Date(Electric_power_consumption$Date, "%d/%m/%Y")

subset <- Electric_power_consumption[Electric_power_consumption$Date == "2007-02-01" |
                 Electric_power_consumption$Date == "2007-02-02", ]

subset$Datetime <- strptime(paste(subset$Date, subset$Time),
                            "%Y-%m-%d %H:%M:%S")


png("plot2.png", width = 480, height = 480)

plot(subset$Datetime,
     subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

dev.off()