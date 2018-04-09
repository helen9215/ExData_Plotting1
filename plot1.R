power <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors = FALSE)
power <- power[(power$Date == "1/2/2007")|(power$Date == "2/2/2007"),]
hist(power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200),bg="white")
dev.copy(png,file="plot1.png",width = 480, height = 480, units='px') 
dev.off()
