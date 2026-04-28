Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$DateTime <- strptime(
  paste(Electric_power_consumption$Date, Electric_power_consumption$Time),
  format = "%d/%m/%Y %H:%M:%S"
)


png("plot2.png", width = 480, height = 480)

# filtrage
data_subset <- subset(Electric_power_consumption, 
                      Date %in% c("1/2/2007", "2/2/2007"))
plot(data_subset$DateTime,
     data_subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",)

dev.off()
