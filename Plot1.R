
#### Data preparation stage ####

#### Installing and setting packages

install.packages("ggplot2")
install.packages("data.table")
install.packages("dplyr")

library("ggplot2")
library("data.table")
library("dplyr")

#### Obtaining the data

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(URL, destfile = "C:/Users/Diego Díaz Velásquez/Documents/RCOURSEJHU/4 Exploratory data analysis/coursecoding/exploratorydataanalysiscourse/homework1.zip", method = "curl")
data <- unzip("homework1.zip")

#### Read txt file into csv

powerconsum <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
na_samples <- head(powerconsum[is.na(powerconsum)], 10)
Namatrix <- which(is.na(powerconsum), arr.ind = TRUE)

###### Convert Data and Time

powerconsum$Date <- as.Date(powerconsum$Date, format = "%d/%m/%Y")
str(powerconsum)
powerconsum$DateTime <- strptime(paste(powerconsum$Date,powerconsum$Time),
                                 format = "%Y-%m-%d %H:%M:%S")

##### Only select needed data

powerconsum <- powerconsum[powerconsum$Date >= "2007-2-1" & powerconsum$Date <= "2007-2-2",]

##### Change data classes

powerconsum[,3:8] <- as.numeric(powerconsum[,3:8])  ### this in case .csv file does not come numeric


##### Building and saving plot No 1

hist <- hist(powerconsum[, 3], col = "red", main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)")
dev.copy(hist, device = png, width = 480, height = 480, file = "Plot1.png")
dev.off()

## The plot provides understanding about the energy frequency and Global Consumption
