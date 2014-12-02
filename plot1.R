## plot1.R
alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = c("?"),colClasses=c("character","character",rep("numeric",7)))
alldata$DateTime <- as.POSIXct(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
rangedata <- alldata[alldata$DateTime >= "2007-02-01" & alldata$DateTime < "2007-02-03",]
hist(rangedata$Global_active_power,main = "Global Active Power", col="red",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()