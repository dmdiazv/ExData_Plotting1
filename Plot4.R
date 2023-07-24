
### Creating a single image with 4 figures

#Top-left
par(mfrow = c(2,2))
with(powerconsum, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerconsum$DateTime[1]),
                      as.numeric(powerconsum$DateTime[1441]),
                      as.numeric(powerconsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#top-right
with(powerconsum, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                       xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerconsum$DateTime[1]),
                      as.numeric(powerconsum$DateTime[1441]),
                      as.numeric(powerconsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Bottom-left
with(powerconsum, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(powerconsum$DateTime[1]),
                      as.numeric(powerconsum$DateTime[1441]),
                      as.numeric(powerconsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(powerconsum, lines(DateTime, Sub_metering_1))
with(powerconsum, lines(DateTime, Sub_metering_2, col = "red"))
with(powerconsum, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#bottom-right
with(powerconsum, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                       ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerconsum$DateTime[1]),
                      as.numeric(powerconsum$DateTime[1441]),
                      as.numeric(powerconsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#saving the image
dev.copy(device = png, width = 480, height = 480, file = "Plot4.png")
dev.off()