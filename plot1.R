# Loading data

hpc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
hpc$Date = strptime(hpc$Date,format = "%d/%m/%Y")
hpc <- hpc[hpc$Date>=as.POSIXlt.character("2007-02-01")&hpc$Date<=as.POSIXlt.character("2007-02-02"),]

#prerequisites for plot 1
hpc$Global_active_power = as.numeric(hpc$Global_active_power)

#develop plot
hist(hpc$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# generate png
dev.copy(png,"plot1.png",height = 504,width = 504)
dev.off()
