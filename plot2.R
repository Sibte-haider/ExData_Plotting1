library(dplyr)
library(lubridate)

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE, comment.char = "")
hpc <- filter(data, Date %in% c("1/2/2007","2/2/2007"))
hpc <- mutate(hpc, Date = as.Date(Date, "%d/%m/%Y"))

datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc <- mutate(hpc, Datetime = as.POSIXct(datetime))

with(hpc, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex.axis = 0.6, cex.lab= 0.6))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
