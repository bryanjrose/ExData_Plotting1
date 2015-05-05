#########################################
# Exploratory Data Analysis Project 1
# plot3.R
# Coursera course: exdata-014
# bryanjrose 05-May-15
#########################################

# Load libraries if necessary
if(!require(ggplot2)){install.packages("ggplot2")}
library(ggplot2)

if(!require(lubridate)){install.packages("lubridate")}
library(lubridate)

# Check for the text file in working directory, download if not present
# Place in temporary directory to unzip.  Remove temp directory when done.
linkaddress <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempzip <- "tempdata/ElecData.zip"
datafile <- "household_power_consumption.txt"

if (!file.exists(datafile)) {
        if (!file.exists("tempdata")) {dir.create("tempdata")}
        download.file(linkaddress, destfile=tempzip) # for Windows OS
        unzip(tempzip)
        unlink("tempdata", recursive=TRUE)
}

#Quickly get headers and classes of each column
tablheads <- read.table(datafile, header = TRUE, sep = ";", nrows = 5)
tablclass <- sapply(tablheads, class)

#Import just the rows needed for this project (dates = 1/2/2007 to 2/2/2007)
#Manually adjust line numbers if necessary
linestart <- 66638
lineend <- 69517
numlines <- lineend - linestart

#Reads the appropriate text file rows and use the same column names found above
#Using the colClasses found above makes reading faster
tablRaw <- read.table(datafile, header = FALSE, sep = ";", col.names = names(tablheads),
                      na.strings = "?", colClasses = tablclass, 
                      skip = linestart - 1, nrows = numlines + 1)

#Combine the first two columns 
#get rid of extra time column and class the date column
tablRaw$Date <- paste(tablRaw$Date, tablRaw$Time)
data <- subset(tablRaw, select = -Time)
data$Date <- dmy_hms(data$Date)

#Create plot3 - line plot with color broken up by three submetering columns
png("plot3.png", width = 480, height = 480, units = "px")
plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col="black")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright", names(data[,6:8]), lty=1, col = c("black", "red", "blue"))
dev.off()




