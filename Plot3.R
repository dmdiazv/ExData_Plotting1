
#### Plot 4. Understanding appliance use by using sub_metering #####

###Creating the plot and saving the plot

with(powerConsum, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(powerConsum, lines(DateTime, Sub_metering_1))
with(powerConsum, lines(DateTime, Sub_metering_2, col = "red"))
with(powerConsum, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Save plot3 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot3.png")