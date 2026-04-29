Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$Date <- as.Date(Electric_power_consumption$Date, "%d/%m/%Y")

subset <- Electric_power_consumption[Electric_power_consumption$Date == "2007-02-01" |
                                       Electric_power_consumption$Date == "2007-02-02", ]

subset$Datetime <- strptime(paste(subset$Date, subset$Time),
                            "%Y-%m-%d %H:%M:%S")


png("plot3.png", width = 480, height = 480)

# filtrage

plot(subset$Datetime,
     subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n")

lines(subset$Datetime,
      subset$Sub_metering_2,
      col = "red")

lines(subset$Datetime,
      subset$Sub_metering_3,
      col = "blue")

legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

dev.off()
