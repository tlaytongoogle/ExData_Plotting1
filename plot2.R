# This script must be run in a working directory which contains the electric power consumption dataset
# from the UC Irvine Machine Learning Repository, named "exdata-data-household_power_consumption.zip"

unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
data <- read.csv(
  "household_power_consumption.txt",
  sep = ";",
  colClasses = c(NA, NA, NA, "NULL", "NULL", "NULL", "NULL", "NULL", "NULL"),
  na.strings = c("?"))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")

with(data, plot(
  datetime,
  Global_active_power,
  type = "l",
  main = NA,
  xlab = NA,
  ylab = "Global Active Power (kilowatts)"))

dev.off()