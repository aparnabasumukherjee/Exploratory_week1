directory <- setwd("D:/R learning/explore_data/first_project")


# read the raw table and limit to 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('D:/R learning/explore_data/first_project/household_power_consumption.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]


# clean up the variable names and convert date/time fields
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
library ("lubridate")
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]

# open device
png(filename='plot2.png',width=480,height=480,units='px')

plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()


