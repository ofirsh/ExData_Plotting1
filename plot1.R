## plot1.R
alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = c("?"),colClasses=c("character","character",rep("numeric",7)))
alldata$Date <- strptime(alldata[,1], "%d/%m/%Y")
rangedata <- alldata[alldata$Date == "2007-02-01" |  alldata$Date == "2007-02-02",]
hist(rangedata$Global_active_power,main = "Global Active Power", col="red",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()