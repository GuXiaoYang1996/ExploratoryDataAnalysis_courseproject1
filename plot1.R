# Load packages
library(data.table)

# Download data files
setwd("D:/GXY's documents/R/4-ExploratoryDataAnalysis/week1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"exdata_data_household_power_consumption.zip",method="curl")
unzip("exdata_data_household_power_consumption.zip")

# Read data file
data200702 <- fread("household_power_consumption.txt",skip=66637,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot 1
png("plot1.png",width=480,height=480)
hist(data200702$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()