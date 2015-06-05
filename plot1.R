# This script must be run in a working directory which contains the electric power consumption dataset
# from the UC Irvine Machine Learning Repository, named "exdata-data-household_power_consumption.zip"

unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
data <- read.csv(
  "household_power_consumption.txt",
  sep = ";",
  colClasses = c(NA, "NULL", NA, "NULL", "NULL", "NULL", "NULL", "NULL", "NULL"),
  na.strings = c("?"))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

png(file = "plot1.png")

with(data, hist(
  Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"))

dev.off()