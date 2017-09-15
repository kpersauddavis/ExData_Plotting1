#Read in full data set
uciData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 


#dates as date variable
uciData$Date <- as.Date(uciData$Date, format="%d/%m/%Y") 


#data what we are working with
subuciData <- subset(uciData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#clear some memory
rm(uciData)

#formatting dates
datetime <- paste(as.Date(subuciData$Date), subuciData$Time) 
subuciData$datetime <- as.POSIXct(datetime) 

#plot 2
plot(subuciData$Global_active_power~subuciData$datetime, type = "l", ylab = "Global Active Power(kilowatts)", xlab="")

#save as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()