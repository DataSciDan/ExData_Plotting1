data <- read.table("../../household_power_consumption.txt", header = TRUE, sep = ";")

feb1_2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

par(mfcol = c(2,2))

# First Graphic
feb1_2$Global_active_power <- as.numeric(as.character(feb1_2$Global_active_power))
plot(feb1_2$Global_active_power, xaxt="n", type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, nrow(feb1_2)/2, nrow(feb1_2)), labels = c("Thu", "Fri", "Sat"))


# Second Graphic
feb1_2[,7] <- as.numeric(as.character(feb1_2[,7]))
feb1_2[,8] <- as.numeric(as.character(feb1_2[,8]))
plot(feb1_2[,7], xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "black",
     type = "l")
axis(1, at = c(1, nrow(feb1_2)/2, nrow(feb1_2)) , labels = c("Thu", "Fri", "Sat"))
lines(feb1_2[,8], col = "orange")
lines(feb1_2[,9], col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "orange", "blue"), lty = 1, bty = "n")


#Third Graphic
feb1_2[,5] <- as.numeric(as.character(feb1_2[,5]))
with(feb1_2, plot(Voltage, xlab = "datetime", xaxt = "n", type = "l"))
axis(1, at = c(1, nrow(feb1_2)/2, nrow(feb1_2)), labels = c("Thu", "Fri", "Sat"))

#Fourth Graphic
feb1_2[,4] <- as.numeric(as.character(feb1_2[,4]))
with(feb1_2, plot(Global_reactive_power, xlab = "datetime", xaxt = "n", type = "l"))
axis(1, at = c(1, nrow(feb1_2)/2, nrow(feb1_2)), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot4.png")
dev.off()