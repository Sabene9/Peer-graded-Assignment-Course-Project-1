Electric_power_consumption <- 
  read.csv("household_power_consumption.txt", 
           header = TRUE, sep = ";", dec = ".", na.strings = "?")

Electric_power_consumption$DateTime <- strptime(
  paste(Electric_power_consumption$Date, Electric_power_consumption$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

png("plot1.png", width = 480, height = 480)
# Exemple de filtrage
data_subset <- subset(Electric_power_consumption, Date %in% c("1/2/2007", "2/2/2007"))

hist(as.numeric(data_subset$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
