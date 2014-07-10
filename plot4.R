#####################################################################################
##
##   Project:           ExData_Plotting1
##   Programmer:        Cary Correia
##   Date:              July 8, 2014
##
##   Goal:              Input a basic file and then produce plots
##                      There will be 4 R scripts and 4 output graphs
##   Part:              4 of 4
##
################################################################################################################################
## 
##   Data Setup...keep this the same for each part of the project
##
##   load relevant libraries...
library(lubridate)              

## set working directory
setwd("~/Documents/Exploratory_Data_Project1/ExData_Plotting1")

## read in the dataset
data<-read.table('household_power_consumption.txt', header = TRUE, sep=';',
                 na.strings="?", colClasses=c("character", "character", rep("numeric", 7)))
##
## subset the data
data.sub<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
##
## concat convert Date and then Concdatenate both dAte and time
data.sub$Day<-strptime(paste(as.Date(data.sub$Date, format= '%d/%m/%Y'), data.sub$Time, sep=" "), format= '%Y-%m-%d %H:%M:%S')
##
################################################################################################################################
##
##  setup multiplot format
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(5,4,3,2), bg="transparent")
with (data.sub, {
##
##  add in first graph- from plot 2
##
        plot(Day, Global_active_power, type="l", ann=FALSE)
        title(main=NULL, sub=NULL, xlab=NULL, ylab="Global Active Power")
##
## add in new second graph: Voltage vs Datetime
        plot(Day, Voltage, type="l", ann=FALSE)
        title(main=NULL, sub=NULL, ylab="Voltage", xlab="datetime")
##
## add in third graph - from plot 3
        plot(Day, Sub_metering_1, type="l", ann=FALSE)          ## Begin plot - draw sm1
        lines(Day, Sub_metering_2, col="red")                   ## add in sm2 --> red line
        lines(Day, Sub_metering_3, col="blue")                  ## add in sm3 --> blue line
        title(main=NULL, sub=NULL, xlab=NULL, ylab="Energy sub metering")       ## add in a y label
        legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1),         ## add in the legend
                legend=c("Sub_metering1","Sub_metering2","Sub_metering3"),
                bty="n")
##
## add in new fourth graph:  Global_reactive_power vs datetime
        plot(Day, Global_reactive_power, type="l", ann=FALSE)
        title(main=NULL, sub=NULL, ylab="Global_reactive_power", xlab="datetime")
})
dev.off()
##
## Fini


