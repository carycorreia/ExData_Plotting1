#####################################################################################
##
##   Project:           ExData_Plotting1
##   Programmer:        Cary Correia
##   Date:              July 8, 2014
##
##   Goal:              Input a basic file and then produce plots
##                      There will be 4 R scripts and 4 output graphs
##   Part:              3 of 4
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
## Plot Creation  for Part 3 goes here:
##
## Build up graph using Basic plot commands
##
##
png("plot3.png", width=480, height=480)
par(bg="transparent")
with(data.sub, plot(Day, Sub_metering_1, type="l", ann=FALSE))          ## Begin plot - draw sm1
with(data.sub, lines(Day, Sub_metering_2, col="red"))                   ## add in sm2 --> red line
with(data.sub, lines(Day, Sub_metering_3, col="blue"))                  ## add in sm3 --> blue line
title(main=NULL, sub=NULL, xlab=NULL, ylab="Energy sub metering")       ## add in a y label
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1),         ## add in the legend
       legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))
dev.off()
##
###############################################################################################################################
