##loading the data
##if(!file.exists("./data/household_power_consumption.zip")){
##fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
##}
##if(file.exists("./data/household_power_consumption.zip")){
##unzip(zipfile = "./data/household_power_consumption.zip",exdir = "./data")
##}

#Reading data
files <- file("./household_power_consumption.txt")
consumption <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
head(consumption)
# Plot 3
# open device
png(filename = './plot3.png', width = 480, height = 480, units='px')
# plot figure
plot(consumption$DateTime, consumption$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(consumption$DateTime, consumption$Sub_metering_2, col = 'red')
lines(consumption$DateTime, consumption$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()

