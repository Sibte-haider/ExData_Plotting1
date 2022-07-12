library(dplyr)
library(lubridate)

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE, comment.char = "")
hpc <- filter(data, Date %in% c("1/2/2007","2/2/2007"))
hpc <- mutate(hpc, Date = as.Date(Date, "%d/%m/%Y"))

#Plot 1

hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active Power (kilowatts)", ylab = "Frequency", cex.axis = 0.6, cex.lab= 0.6)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()