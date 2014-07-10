#####################################################################################
##
##   Project:           ExData_Plotting1
##   Programmer:        Cary Correia
##   Date:              July 8, 2014
##
##   Goal:              Input a basic file and then produce plots
##                      There will be 4 R scripts and 4 output graphs
##   Part:              2 of 4
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
## Plot Creation goes here
##
## Build up graph using Basic plot commands
##
##
png("plot2.png", width=480, height=480)                                         ## start png device
par(bg="transparent")                                                           ## set background to transparent
with(data.sub, plot(Day, Global_active_power, type="l", ann=FALSE))             ## create plot
title(main=NULL, sub=NULL, xlab=NULL, ylab="Global Active Power (kilowatts)")   ## set the title
dev.off()                                                                       ## turn the png device off
