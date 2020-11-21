rawdata<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract only the rows that we need
data<-rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Set Variables into Numeric
GlobalActivePower<-as.numeric(data$Global_active_power)
GlobalReactivePower<-as.numeric(data$Global_reactive_power)
Voltage1<-as.numeric(data$Voltage)
submetering1<-as.numeric(data$Sub_metering_1)
submetering2<-as.numeric(data$Sub_metering_2)
submetering3<-as.numeric(data$Sub_metering_3)

#Save the plot into PNG file.
png("plot4.png",width=480,height=480)
#Set the layout to have 4 plots
par(mfrow=c(2,2))

#Plot1 (topleft)
plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power",xlab="")
#Plot2 (topright)
plot(DateTime,Voltage1,type="l",ylab="Voltage",xlab="datetime")
#Plot3 (bottomleft)
plot(DateTime,submetering1,type="l",ylab="Energy sub metering",xlab="")
lines(DateTime,submetering2,type="l",col="red")
lines(DateTime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Plot4 (bottomright)
plot(DateTime,GlobalReactivePower,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()