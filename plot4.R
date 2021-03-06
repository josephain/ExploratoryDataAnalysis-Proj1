df <- "./DataScience/data/household_power_consumption.txt"
power <- read.table(df,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subpower <- subset(power,Date=="1/2/2007"|Date=="2/2/2007")
dt <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMet1 <- as.numeric(subpower$Sub_metering_1)
subMet2 <- as.numeric(subpower$Sub_metering_2)
subMet3 <- as.numeric(subpower$Sub_metering_3)
glbActPower <- as.numeric(subpower$Global_active_power)
glbReActPower <- as.numeric(subpower$Global_reactive_power)
volt <- as.numeric(subpower$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(dt, glbActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")
plot(dt,subMet1,type="l",ylab="Energy Submetering")
lines(dt,subMet2,col="red",type="l")
lines(dt,subMet3,col="blue",type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"),bty = "n")
plot(dt, glbReActPower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()