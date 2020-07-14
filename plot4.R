setwd('C:\\Users\\emili\\OneDrive\\Escritorio\\R\\Coursera R')

Project1<-read.csv('C:\\Users\\emili\\OneDrive\\Escritorio\\R\\Coursera R\\Exploratory Analysis\\Course project 1\\HPC.csv',stringsAsFactors = FALSE,sep=",", colClasses = c(NA, NA, rep ("numeric", 7)),na.strings = "?")
library(dplyr)
library(lubridate)

HCP<-tbl_df(Project1)
HCP$Date<-dmy(HCP$Date)
HCP$Time<-hms(HCP$Time)
HCPNew<-subset(HCP, (HCP$Date>= "2007-02-01") & (HCP$Date <= "2007-02-02"))
x<-with(HCPNew,HCPNew$Date+HCPNew$Time)


png(filename = 'plot4.png',width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,4,4))
with(HCPNew,{
  plot(x,Global_active_power,xlab = '',ylab = 'Global Active Power (Kilowats)',type="l")
  plot(x,Voltage,ylab = 'Voltage',xlab='Datetime',type='l')
  plot(x,Sub_metering_1,type='l',col='black',xlab = '',ylab='Energy Sub Metering')
  lines(x,Sub_metering_2,type='l',col='red')
  lines(x,Sub_metering_3,type='l',col='blue')
  legend('topright',col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd = 2)
  plot(x,Global_reactive_power,xlab = 'Datetime',type='l')
})
dev.off()

