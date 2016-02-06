
#load the whole data
DATA<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")

#select the data for the days of 2007-02-01 and 2007-02-02
DATAUSE<-subset(DATA,as.Date(Date,format="%d/%m/%Y") %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

#make a new column by combing Date and Time, then converit to POSIXlt with strptime function
library(dplyr)
DATAUSE<-mutate(DATAUSE,DateTime=paste(Date,Time))
DATAUSE$DateTime<-strptime(DATAUSE$DateTime,format="%d/%m/%Y %H:%M:%S")

#initiate png graphics device
png(file="plot3.png") #default with 480 pixels for width and height

#make the plot
plot(DATAUSE$DateTime,DATAUSE$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(DATAUSE$DateTime,DATAUSE$Sub_metering_2,col="red",lty=1)
lines(DATAUSE$DateTime,DATAUSE$Sub_metering_3,col="blue",lty=1)
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close the png graphics device
dev.off()