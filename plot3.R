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



#Plot 3
png(filename = "plot3.png", width = 480, height = 480)

par(bg= "transparent")
plot(project.data$Time, project.data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(project.data$Time, project.data$Sub_metering_2, col="red")
lines(project.data$Time, project.data$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


