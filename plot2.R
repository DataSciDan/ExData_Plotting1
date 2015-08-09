data <- read.table("../../household_power_consumption.txt", header = TRUE,
                   sep = ";")

feb1_2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

feb1_2$Global_active_power <- as.numeric(as.character(feb1_2$Global_active_power))

#It's crazy to me that none of this was necessary. This tripped me up for hours.
#
#feb1_2$Date <- as.character(feb1_2$Date)
#feb1_2$Time <- as.character(feb1_2$Time)
#
#combined <- apply(feb1_2[,1:2], 1,
#                  function(x) strptime(paste(x[1], x[2]),
#                                       "%d/%m/%Y %H:%M:%S"))

plot(feb1_2$Global_active_power, xaxt="n", type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

axis(1, at = c(1, nrow(feb1_2)/2, nrow(feb1_2)), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot2.png")
dev.off()