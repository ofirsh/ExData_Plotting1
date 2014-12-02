## plot4.R
alldata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = c("?"),colClasses=c("character","character",rep("numeric",7)))
alldata$DateTime <- as.POSIXct(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
rangedata <- alldata[alldata$DateTime >= "2007-02-01" & alldata$DateTime < "2007-02-03",]

par(mfrow = c(2, 2))

with(rangedata, 
     {
         plot(y=Global_active_power, x=DateTime, type="n", xlab = "", ylab ="Global Active Power (kilowatts)")
         lines(y=Global_active_power, x=DateTime) 
         
         plot(y=Voltage,x=DateTime, xlab = "datetime", type = "n")
         lines(y=Voltage, x=DateTime) 
         
         plot(y=Sub_metering_1, x=DateTime, type="n", xlab = "", ylab ="Energy sub metering")
         lines(y=Sub_metering_3, x=DateTime, col="blue")
         lines(y=Sub_metering_2, x=DateTime, col="red")
         lines(y=Sub_metering_1, x=DateTime, col="black")
         legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty = 1,bty = "n", cex=0.6,xjust = 1, inset=0)
         
         plot(y=Global_reactive_power,x=DateTime, xlab = "datetime", type = "n")
         lines(y=Global_reactive_power, x=DateTime) 
    })

dev.copy(png, file = "plot4.png")
dev.off()