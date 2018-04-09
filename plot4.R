power <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors = FALSE)
power <- power[(power$Date == "1/2/2007")|(power$Date == "2/2/2007"),]
alldate <- paste(power$Date, power$Time)
power$alldate <- strptime(alldate, "%d/%m/%Y %H:%M:%S")

png(filename = './plot4.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "en_US")
par(mfrow=c(2,2))
with(power, {
        plot(alldate,Global_active_power,type="l",xlab="",ylab="Global Active Power")
        plot(alldate,Voltage, type="l",xlab="datetime",ylab="Voltage")
        plot(alldate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        with(power,lines(alldate,Sub_metering_2, col="red"))
        with(power,lines(alldate,Sub_metering_3, col="blue"))
        legend("topright",col= c("black","red","blue"), lwd = 1,box.lwd=0,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(alldate,Global_reactive_power, type="l",xlab="datetime",ylab="Voltage")
        }
     )
     
dev.off()

