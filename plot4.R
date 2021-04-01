pwr <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table("household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
d_t <- strptime(paste(pwr$Date, pwr$Time), format='%d/%m/%Y %H:%M:%S')
plt <- paste0(getwd(),"/","plot4.png")
png(filename=plot4, height=480, width=480,bg="white")
par(mfrow=c(2,2))
plot(d_t, pwr$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(d_t, pwr$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(d_t,pwr$Sub_metering_1, type="l", xlab ="",ylab = "Energy sub metering",col="black")
lines(d_t,pwr$Sub_metering_2, type="l", col="red")
lines(d_t,pwr$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       cex=0.8, col=c("black","red","blue"),lwd=2,bty = "n")
plot(d_t, pwr$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()