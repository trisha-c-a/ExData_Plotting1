pwr <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
d_t <- subset(pwr, Date %in% c("1/2/2007","2/2/2007"))
d_t$Date <- as.Date(d_t$Date, format="%d/%m/%Y")
dt <- paste(as.Date(d_t$Date), d_t$Time)
d_t$Datetime <- as.POSIXct(dt)

dev.copy(png, file="plot3.png", height=480, width=480)

with(d_t, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
