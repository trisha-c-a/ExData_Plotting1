setwd("C:/Users/indiv/Desktop/R/ExData_Plotting1")

pwr <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
pwr$Timestamp = paste(pwr$Date, pwr$Time, sep=" ")
pwr$Timestamp = strptime(pwr$Timestamp, format="%d/%m/%Y %H:%M:%S")
pwr$Date = as.Date(pwr$Date, format='%d/%m/%Y')
data <- subset(pwr, Date == as.Date('2007-02-01',format='%Y-%m-%d') | Date == as.Date('2007-02-02',format='%Y-%m-%d'))  
par(mfrow=c(1,1))
dev.copy(png, "plot2.png", width=480, height=480)
plot(data$Timestamp, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Timestamp, data$Global_active_power, lty=1)
dev.off()
  

