# download the data set file, mac specific
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', method = 'curl', destfile = "household_power_consumption.zip")

# manually unpack the household_power_consumption.zip file

# read all data
powerDataAll <- read.csv('household_power_consumption.txt', sep=";", , na.strings="?", header=T)

# format the Date and Time columns
powerDataAll$DateTime <- strptime(paste(powerDataAll$Date, powerDataAll$Time, sep=" "), format="%d/%m/%Y %T")
powerDataAll$Date <- as.Date(powerDataAll$Date, format="%d/%m/%Y")

# slice the data to get the desired part
powerData <- powerDataAll[(powerDataAll$Date >= "2007-02-01" & powerDataAll$Date <= "2007-02-02"),]

# generate and save the graph
png(file = "plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()


