tab5rows <- read.table("household_power_consumption.txt", header = TRUE, nrows = 5,sep = ";")
classes <- sapply(tab5rows,class)
classes[1]="character"
tabAll <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 70000, na.strings = "?",colClasses=classes)
dataset <- rbind(subset(tabAll,Date=="1/2/2007"),subset(tabAll,Date=="2/2/2007"))
png(filename="plot1.png",width=480,height=480)
hist(as.numeric(dataset$Global_active_power),breaks=12,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
