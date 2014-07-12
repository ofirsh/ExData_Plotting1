## alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = c("?"),colClasses=c("Date","character",rep("numeric",7)))
rangedata <- alldata[data$Date == "1/2/2007" |  data$Date == "2/2/2007",]
hist(rangedata$Global_active_power,main = "Global Active Power", col="red",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()