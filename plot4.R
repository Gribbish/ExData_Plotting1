#Reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Filtering dates for the course project
summary(data$Date)
project.data <- data[(data$Date == "1/2/2007"| data$Date == "2/2/2007"), ]


#Formatting date and time variable
project.data$Date <- as.Date(project.data$Date, format="%d/%m/%Y")
project.data$Time <- strptime(paste(project.data$Date, project.data$Time),
                              format="%Y-%m-%d %H:%M:%S")
lapply(project.data, class)



#Plot 4
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2, 2), bg="transparent")

plot(project.data$Time, project.data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(project.data$Time, project.data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(project.data$Time, project.data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(project.data$Time, project.data$Sub_metering_2, col="red")
lines(project.data$Time, project.data$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.90)

plot(project.data$Time, project.data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()