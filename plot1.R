data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

feb1_2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

hist(as.numeric(feb1_2$Global_active_power)/500, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "orange")

dev.copy(png, file = "plot1.png")
dev.off()
