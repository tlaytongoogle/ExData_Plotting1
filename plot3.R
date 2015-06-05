# This script must be run in a working directory which contains the electric power consumption dataset
# from the UC Irvine Machine Learning Repository, named "exdata-data-household_power_consumption.zip"

unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
data <- read.csv(
  "household_power_consumption.txt",
  sep = ";",
  colClasses = c(NA, NA, "NULL", "NULL", "NULL", "NULL", NA, NA, NA),
  na.strings = c("?"))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")

with(data, {
  plot(
    datetime,
    Sub_metering_1,
    type = "l",
    col = "black",
    main = NA,
    xlab = NA,
    ylab = "Energy sub metering")

  lines(
    datetime,
    Sub_metering_2,
    col = "red")
  
  lines(
    datetime,
    Sub_metering_3,
    col = "blue")
  
  legend(
    "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = c(1, 1, 1),
    col = c("black", "red", "blue"))
})

dev.off()