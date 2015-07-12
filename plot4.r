## ============================================================================
## Exploratory Data Analysis, Project 1, PLOT #4
## ============================================================================

## --- Prepare the data -------------------------------------------------------

## Define a class for the date format used in the file
setClass("myDate")
setAs("character","Date", function(from) as.Date(from, format="%d:%m:%Y"))

## Read the data
setwd( "C:\\_work\\coursera\\R\\ExData_Plotting1" )
file = "household_power_consumption.txt"
data <- read.table( file, header=TRUE, sep=";", na.strings=c("?"), colClasses=c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Reduce to a subset of the data between 2007-02-01 and 2007-02-02.
subs <- subset(data, as.Date("2007-02-01") <= Date & Date <= as.Date("2007-02-02"))

## Replace the character data in the Time column with an R time value
subs$Time = strptime( paste( subs[,1], subs[,2] ), "%Y-%m-%d %H:%M:%S" )

## --- Plot the Data ----------------------------------------------------------
png(file = "plot4.png" )
par(mfrow = c(2,2))
plot(subs$Time, subs$Global_active_power, type="l", ylab="Global Active Power", xlab="" )
plot(subs$Time, subs$Voltage, type="l", ylab="Voltage", xlab="datetime" )
plot  (subs$Time, subs$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="" )
points(subs$Time, subs$Sub_metering_2, type="l", col="red")
points(subs$Time, subs$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", lwd=1, col=c("black","red","blue"), text.col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(subs$Time, subs$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime" )
dev.off()


