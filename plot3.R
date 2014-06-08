setwd("~/src/datasciencecoursera/Exploratory Data Analysis/Project 1/ExData_Plotting1")

# Read the files, converting the Date column to a date. 
# be sure to set the NA string to ? on load
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
household_power_consumption$DateText <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateField <- strptime(household_power_consumption$DateText, format="%d/%m/%Y %H:%M:%S")

# Work only with the correct times.
min_date <- strptime("2007-02-01", format="%Y-%m-%d")
max_date <- strptime("2007-02-03", format="%Y-%m-%d")
dataset <- household_power_consumption[household_power_consumption$DateField >= min_date & household_power_consumption$DateField < max_date,]
rm(household_power_consumption)
rm(max_date)
rm(min_date)

# Plot the 3 line graphs to a PNG file with legend
png(file="figure/plot3.png", bg="white")
plot(dataset$DateField, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataset$DateField, dataset$Sub_metering_2, col="red")
lines(dataset$DateField, dataset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()

rm(dataset)