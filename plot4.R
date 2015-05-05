data_set <- read.csv("data_set.txt", sep=";", stringsAsFactors=FALSE)
data<-subset(data_set,Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)

png(filename="plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(data$Global_active_power, type = "l", xaxt = "n", xlab = "",ylab = "Global Active Power (Kilowatts)")
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))

plot(data$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

plot(data$Sub_metering_1, type = "l", xaxt = "n", xlab = "",ylab = "Energy sub metering")
lines(data$Sub_metering_2,col = "red")
lines(data$Sub_metering_3,col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1), col=c("black","red","blue"),bty="n")
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))

plot(data$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime",ylab = "Global_reactive_power")
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
dev.off()
