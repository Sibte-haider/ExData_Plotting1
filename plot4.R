library(dplyr)
library(lubridate)

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE, comment.char = "")
hpc <- filter(data, Date %in% c("1/2/2007","2/2/2007"))
hpc <- mutate(hpc, Date = as.Date(Date, "%d/%m/%Y"))

datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc <- mutate(hpc, Datetime = as.POSIXct(datetime))

par(mfrow=c(2,2),mar=c(5,4,2,1))

with(hpc, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="", cex.axis = 0.6, cex.lab= 0.6))

with(hpc, plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="daytime", cex.axis = 0.6, cex.lab= 0.6))

with(hpc, {plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="", cex.axis = 0.6, cex.lab= 0.6)
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex = 0.4, text.font = 8,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })

with(hpc, plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power", xlab="datetime", cex.axis = 0.6, cex.lab= 0.6))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off() 