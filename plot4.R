# Loading data

hpc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
hpc$Date = strptime(hpc$Date,format = "%d/%m/%Y")
hpc <- hpc[hpc$Date>=as.POSIXlt.character("2007-02-01")&hpc$Date<=as.POSIXlt.character("2007-02-02"),]

#prerequisites for plot 4
hpc$Global_active_power = as.numeric(hpc$Global_active_power)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time),format = "%Y-%m-%d %H:%M")
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power) 

#develop plot
par(mfrow=c(2,2))

  #plot4a
plot(hpc$DateTime,hpc$Global_active_power, type = "l",ylab = "Global Active Power", xlab = "")

  #plot4b
plot(hpc$DateTime,hpc$Voltage, type = "l",ylab = "Voltage", xlab = "datetime")

  #plot4c
plot(hpc$DateTime,hpc$Sub_metering_1, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
lines(hpc$DateTime,hpc$Sub_metering_2,col = "red")
lines(hpc$DateTime,hpc$Sub_metering_3,col = "blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",x.intersp = 1)

  #plot4d
plot(hpc$DateTime,hpc$Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab = "datetime")

# generate png
dev.copy(png,"plot4.png",height = 504,width = 504)
dev.off()

#resetting plotting parameters
par(mfrow = c(1,1))