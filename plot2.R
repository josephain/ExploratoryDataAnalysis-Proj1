df <- "./DataScience/data/household_power_consumption.txt"
power <- read.table(df,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subpower <- subset(power,Date=="1/2/2007"|Date=="2/2/2007")
glbActPower <- as.numeric(subpower$Global_active_power)
dt <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dt, glbActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()