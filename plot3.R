Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$DateTime <- strptime(
  paste(Electric_power_consumption$Date, Electric_power_consumption$Time),
  format = "%d/%m/%Y %H:%M:%S"
)


png("plot3.png", width = 480, height = 480)

# filtrage
data_subset <- subset(Electric_power_consumption, 
                      Date %in% c("1/2/2007", "2/2/2007"))
plot(data_subset$DateTime,
     data_subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data_subset$DateTime,
      data_subset$Sub_metering_2,
      col = "red")

lines(data_subset$DateTime,
      data_subset$Sub_metering_3,
      col = "blue")

legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
