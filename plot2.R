tab5rows <- read.table("household_power_consumption.txt", header = TRUE, nrows = 5,sep = ";")
classes <- sapply(tab5rows,class)
classes[1]="character"
classes[2]="character"
tabAll <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 70000, na.strings = "?",colClasses=classes)
dataset <- rbind(subset(tabAll,Date=="1/2/2007"),subset(tabAll,Date=="2/2/2007"))
dataset$Date=as.Date(dataset$Date,format = "%d/%m/%Y")
dataset$DT<-paste(dataset$Date,dataset$Time)
dataset$DateTime <- strptime(dataset$DT,format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png",width=480,height=480)
plot(dataset$DateTime,as.numeric(dataset$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()