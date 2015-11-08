
data <- read.csv("household_power_consumption.txt", sep=";")
aDD <- as.Date(data$Date,  format = "%d/%m/%Y")


d1 <- aDD == "2007-02-01"
d1OK <- aDD[d1]
length(d1OK)
d1OK
length(d1)
resultDAY1 <- data[d1,]

d2 <- aDD == "2007-02-02"
d2OK <- aDD[d2]
length(d2OK)
# d2OK
length(d2)
resultDAY2 <- data[d2,]


myData <- rbind(resultDAY1, resultDAY2)
# ----------------------------------------
# plot 1
# ----------------------------------------
png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(myData[,3])), main="Global Active Power", col="red", xlab="Global Activer Power (kilowatts)")
dev.off()

# ----------------------------------------
# plot 2
# ----------------------------------------
png(filename="plot2.png", width=480, height=480, units="px")
plot(c(1:2880), as.numeric(as.character(myData[,3])), type = "l", ylab="Global Active Power (kilowatts)", xlab ="",  xaxt = "n" )
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
dev.off()

# ----------------------------------------
# plot 3
# ----------------------------------------
png(filename="plot3.png", width=480, height=480, units="px")

plot(x, y, type="n", xaxt = "n", ylab="Energy sub metering", xlab="")
x <- c(1:2880,1:2880,1:2880)
y <- c(as.numeric(as.character(myData[,7])), as.numeric(as.character(myData[,8])), as.numeric(as.character(myData[,9])))
points(x[1:2880], y[1:2880], col="black", type="l")
points(x[2881:5760], y[2881:5760], col="red", type="l")
points(x[5761:8640], y[5761:8640], col="blue", type="l")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

dev.off()


# ----------------------------------------
# plot 4
# ----------------------------------------
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

# Global Active Power 
plot(c(1:2880), as.numeric(as.character(myData[,3])), type = "l", ylab="Global Active Power", xlab ="",  xaxt = "n" )
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

# Voltage 
plot(c(1:2880), as.numeric(as.character(myData[,5])), type = "l", ylab="Voltage", xlab ="",  xaxt = "n" )
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

# Energy sub metering 
plot(x, y, type="n", xaxt = "n", ylab="Energy sub metering", xlab="")
x <- c(1:2880,1:2880,1:2880)
y <- c(as.numeric(as.character(myData[,7])), as.numeric(as.character(myData[,8])), as.numeric(as.character(myData[,9])))
points(x[1:2880], y[1:2880], col="black", type="l")
points(x[2881:5760], y[2881:5760], col="red", type="l")
points(x[5761:8640], y[5761:8640], col="blue", type="l")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

# Global reactive power
plot(c(1:2880), as.numeric(as.character(myData[,4])), type = "l", ylab="Global_reactive_power", xlab ="",  xaxt = "n" )
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

dev.off()


