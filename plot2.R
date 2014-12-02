## plot2.R
alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = c("?"),colClasses=c("character","character",rep("numeric",7)))
alldata$DateTime <- as.POSIXct(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
rangedata <- alldata[alldata$DateTime >= "2007-02-01" & alldata$DateTime < "2007-02-03",]
plot(y=rangedata$Global_active_power, x=rangedata$DateTime, type="n", xlab = "", ylab ="Global Active Power (kilowatts)")
lines(y=rangedata$Global_active_power, x=rangedata$DateTime)
dev.copy(png, file = "plot2.png")
dev.off()