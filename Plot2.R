
#### Plot 2. Global active power and days of the week #####

### Using the powerconsum data base it can be possible to construct the required
figure ###

#### code to make the plot and how to save it #####

with(powerconsum, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerconsum$DateTime[1]),
                      as.numeric(powerconsum$DateTime[1441]),
                      as.numeric(powerconsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
dev.copy(device = png, width = 480, height = 480, file = "Plot2.png")
dev.off()