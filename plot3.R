## plot3.R
alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = c("?"),colClasses=c("character","character",rep("numeric",7)))
alldata$DateTime <- as.POSIXct(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
rangedata <- alldata[alldata$DateTime >= "2007-02-01" & alldata$DateTime < "2007-02-03",]

plot(y=rangedata$Sub_metering_1, x=rangedata$DateTime, type="n", xlab = "", ylab ="Energy sub metering")
lines(y=rangedata$Sub_metering_3, x=rangedata$DateTime, col="blue")
lines(y=rangedata$Sub_metering_2, x=rangedata$DateTime, col="red")
lines(y=rangedata$Sub_metering_1, x=rangedata$DateTime, col="black")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty = 1)

dev.copy(png, file = "plot3.png")
dev.off()