# Load packages
library(data.table)
library(dplyr)

# Download data files
setwd("D:/GXY's documents/R/4-ExploratoryDataAnalysis/week1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"exdata_data_household_power_consumption.zip",method="curl")
unzip("exdata_data_household_power_consumption.zip")

# Read data file and convert Date/Time
data200702 <- fread("household_power_consumption.txt",skip=66637,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data200702 <- mutate(data200702, Date_Time=paste(Date,Time))
Sys.setlocale("LC_TIME","en_US.UTF-8")
data200702$Date_Time <- strptime(data200702$Date_Time,format="%d/%m/%Y %H:%M:%S",tz="UTC")

# Plot 4
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2),mar=c(4,4,2,1))

## Plot 4-1
plot(data200702$Date_Time,data200702$Global_active_power,type="l",xlab="",ylab="Global Active Power",xaxt="n")
axis(side=1,at=c(data200702$Date_Time[1],data200702$Date_Time[1441],strptime("3/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S",tz="UTC")),labels=c(format(as.Date("2007-02-01"),"%a"),format(as.Date("2007-02-02"),"%a"),format(as.Date("2007-02-03"),"%a")))

## Plot 4-2
plot(data200702$Date_Time,data200702$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
lines(data200702$Date_Time,data200702$Sub_metering_2,col="red")
lines(data200702$Date_Time,data200702$Sub_metering_3,col="blue")
axis(side=1,at=c(data200702$Date_Time[1],data200702$Date_Time[1441],strptime("3/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S",tz="UTC")),labels=c(format(as.Date("2007-02-01"),"%a"),format(as.Date("2007-02-02"),"%a"),format(as.Date("2007-02-03"),"%a")))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bg=NA,box.col=NA)

## Plot 4-3
plot(data200702$Date_Time,data200702$Voltage,type="l",xlab="datetime",ylab="Voltage",xaxt="n")
axis(side=1,at=c(data200702$Date_Time[1],data200702$Date_Time[1441],strptime("3/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S",tz="UTC")),labels=c(format(as.Date("2007-02-01"),"%a"),format(as.Date("2007-02-02"),"%a"),format(as.Date("2007-02-03"),"%a")))

## Plot 4-4
plot(data200702$Date_Time,data200702$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",xaxt="n")
axis(side=1,at=c(data200702$Date_Time[1],data200702$Date_Time[1441],strptime("3/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S",tz="UTC")),labels=c(format(as.Date("2007-02-01"),"%a"),format(as.Date("2007-02-02"),"%a"),format(as.Date("2007-02-03"),"%a")))

dev.off()
