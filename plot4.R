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

## Plot 4 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(subuciData, { 
  plot(Global_active_power~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="") 
  plot(Voltage~datetime, type="l",  ylab="Voltage (volt)", xlab="") 
  plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="") 
  lines(Sub_metering_2~datetime,col='Red') 
  lines(Sub_metering_3~datetime,col='Blue') 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  plot(Global_reactive_power~datetime, type="l",  
  ylab="Global Rective Power (kilowatts)",xlab="")
}) 

#save as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
