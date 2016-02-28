df <- "./DataScience/data/household_power_consumption.txt"
power <- read.table(df,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subpower <- subset(power,Date=="1/2/2007"|Date=="2/2/2007")
glbActPower <- as.numeric(subpower$Global_active_power)
png("plot1.png", width=480, height=480)
hist(glbActPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()