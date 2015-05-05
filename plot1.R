data_set <- read.csv("data_set.txt", sep=";", stringsAsFactors=FALSE)
data<-subset(data_set,Date == "1/2/2007" | Date == "2/2/2007")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename="plot1.png",width = 480,height = 480)
hist(data$Global_active_power,col="red",
                               main = "Global Active Power", 
                               xlab = "Global Active Power (kilowatts)")
dev.off()
