Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$DateTime <- strptime(
  paste(Electric_power_consumption$Date, Electric_power_consumption$Time),
  format = "%d/%m/%Y %H:%M:%S"
)


png("plot4.png", width = 480, height = 480)

# filtrage
data_subset <- subset(Electric_power_consumption, 
                      Date %in% c("1/2/2007", "2/2/2007"))

par(mfrow=c(2,2)) # Divise l'écran en 4 zones

# Haut-Gauche (identique au Plot 2)
plot(data_subset$DateTime, data_subset$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

# Haut-Droite
plot(data_subset$DateTime, data_subset$Voltage, type="l", 
     xlab="DateTime", ylab="Voltage")

# Bas-Gauche (identique au Plot 3)
plot(data_subset$DateTime, data_subset$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(data_subset$DateTime, data_subset$Sub_metering_2, col="red")
lines(data_subset$DateTime, data_subset$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty="n")

# Bas-Droite
plot(data_subset$DateTime, data_subset$Global_reactive_power, type="l", 
     xlab="DateTime", ylab="Global_reactive_power")

dev.off()