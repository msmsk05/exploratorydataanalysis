rawdata<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract only the rows that we need
data<-rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]

#Save the plot (Histogram) into PNG file.
png("plot1.png",width=480,height=480)
#Create the Histogram of Flobal Active Power
hist(as.numeric(data$Global_active_power),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
#Close the PNG file
dev.off()    


