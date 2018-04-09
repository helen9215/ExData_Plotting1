power <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors = FALSE)
power <- power[(power$Date == "1/2/2007")|(power$Date == "2/2/2007"),]

alldate <- paste(power$Date, power$Time)
power$alldate <- strptime(alldate, "%d/%m/%Y %H:%M:%S")

png(filename = './plot2.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "en_US")
with(power,plot(alldate,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()
