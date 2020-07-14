setwd('C:\\Users\\emili\\OneDrive\\Escritorio\\R\\Coursera R')

Project1<-read.csv('C:\\Users\\emili\\OneDrive\\Escritorio\\R\\Coursera R\\Exploratory Analysis\\Course project 1\\HPC.csv',stringsAsFactors = FALSE,sep=",", colClasses = c(NA, NA, rep ("numeric", 7)),na.strings = "?")
library(dplyr)
library(lubridate)

HCP<-tbl_df(Project1)
HCP$Date<-dmy(HCP$Date)
HCP$Time<-hms(HCP$Time)
HCPNew<-subset(HCP, (HCP$Date>= "2007-02-01") & (HCP$Date <= "2007-02-02"))
x<-with(HCPNew,HCPNew$Date+HCPNew$Time)

png(filename = 'plot2.png',width = 480,height = 480)
plot(x,HCPNew$Global_active_power,ylab = 'Global Active Power (Kilowats)',type="l")
dev.off()