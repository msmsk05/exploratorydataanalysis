rawdata<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract only the rows that we need
data<-rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Set Global active power into numeric
GlobalActivePower<-as.numeric(data$Global_active_power)

#Save the plot into PNG file.
png("plot2.png",width=480,height=480)

plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power (kilowatts)")
#Close the PNG file
dev.off()