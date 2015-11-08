
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
