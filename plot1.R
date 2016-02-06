
#load the whole data
DATA<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")

#select the data for the days of 2007-02-01 and 2007-02-02
DATAUSE<-subset(DATA,as.Date(Date,format="%d/%m/%Y") %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

#initiate png graphics device
png(file="plot1.png") #default with 480 pixels for width and height

#make the histgram
hist(DATAUSE$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main ="Global Active Power")

#close the png graphics device
dev.off()