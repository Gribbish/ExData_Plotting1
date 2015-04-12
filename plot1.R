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



#Plot 1
png(filename = "plot1.png", width = 480, height = 480)

par(bg= "transparent")
hist(project.data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()

