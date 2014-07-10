#####################################################################################
##
##   Project:           ExData_Plotting1
##   Programmer:        Cary Correia
##   Date:              July 8, 2014
##
##   Goal:              Input a basic file and then produce plots
##                      There will be 4 R scripts and 4 output graphs
##   Part:              1 of 4
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
data.sub$Day<-wday(data.sub$Day, label=TRUE)
##
################################################################################################################################
##
## Plot Creation goes here
##
## Build up graph using Basic plot commands
##
png("plot1.png", width=480, height=480, bg="white")                         ## setup png file
par(bg="transparent")                                                       ## set background to transparent
hist(data.sub$Global_active_power, freq=TRUE, col='red', border='black',    ## create histogram plot
     main="Global Active Power", xlab='Global Active Power (kilowatts)',    ## set labels
     ylab='Frequency')
dev.off()                                                                   ## turn png device off
##
