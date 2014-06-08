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

# Plot the line graph to a PNG file
png(file="figure/plot2.png", bg="white")
plot(dataset$DateField, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

rm(dataset)