# Loading data

hpc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
hpc$Date = strptime(hpc$Date,format = "%d/%m/%Y")
hpc <- hpc[hpc$Date>=as.POSIXlt.character("2007-02-01")&hpc$Date<=as.POSIXlt.character("2007-02-02"),]

#prerequisites for plot 2
hpc$Global_active_power = as.numeric(hpc$Global_active_power)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time),format = "%Y-%m-%d %H:%M")

#develop plot
plot(hpc$DateTime,hpc$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

# generate png
dev.copy(png,"plot2.png",height = 504,width = 504)
dev.off()
