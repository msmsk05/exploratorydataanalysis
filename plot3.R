rawdata<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract only the rows that we need
data<-rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
#Set Sub metering values into Numeric
submetering1<-as.numeric(data$Sub_metering_1)
submetering2<-as.numeric(data$Sub_metering_2)
submetering3<-as.numeric(data$Sub_metering_3)

#Save the plot into PNG file.
png("plot3.png",width=480,height=480)
#Create first the Line XY plot of DateTime and submetering1
plot(DateTime,submetering1,type="l",ylab="Energy sub metering")
#Second, add the Line XY plot of submetering2 -> with a different color
lines(DateTime,submetering2,type="l",col="red")
#Then add the ine XY plot of submetering3
lines(DateTime,submetering3,type="l",col="blue")
#Add Legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()