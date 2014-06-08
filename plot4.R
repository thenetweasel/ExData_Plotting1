setwd("~/src/datasciencecoursera/Exploratory Data Analysis/Project 1/ExData_Plotting1")

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
household_power_consumption$Date <- strptime(household_power_consumption$Date, format="%d/%m/%Y")

min_date <- strptime("2007-02-01", format="%Y-%m-%d")
max_date <- strptime("2007-02-02", format="%Y-%m-%d")

dataset <- household_power_consumption[household_power_consumption$Date >= min_date & household_power_consumption$Date <= max_date,]
rm(household_power_consumption)
