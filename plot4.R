
# Read in the .txt file

dataPower <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Convert first column into Date's

data.Power <- dataPower
data.Power$Date <- as.Date(data.Power$Date, "%d/%m/%Y")

# Subset data from 2007-02-01 and 2007-02-02

data.Power.Subset <- data.Power[data.Power$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# Combine Date + Time into single item
dt <- paste(as.character(data.Power.Subset$Date), as.character(data.Power.Subset$Time))
t <- strptime(dt, format="%Y-%m-%d %H:%M:%S")
Times <- difftime(t, t[1], units="mins")

# Convert Sub_metering_* and others into appropriate types

sub1 <- as.numeric(as.character(data.Power.Subset$Sub_metering_1))
sub2 <- as.numeric(as.character(data.Power.Subset$Sub_metering_2))
sub3 <- data.Power.Subset$Sub_metering_3
Voltage <- as.numeric(as.character(data.Power.Subset$Voltage))
Global_reactive_power <- as.numeric(as.character(data.Power.Subset$Global_reactive_power))

# Do multiple plots

quartz()
par(mfcol=c(2,2))

# Plot #1
plot(Times, y, xaxt="n", xlab="", ylab="Global Active Power (kilowatts)", type="n")
axis(1, at = c(1, 1441, 2880), labels =c("Thu","Fri","Sat"))
lines(Times, y)


# Plot #2
plot(Times, sub1, xaxt="n", xlab="", ylab="Energy sub metering", type="n")
axis(1, at = c(1, 1441, 2880), labels =c("Thu","Fri","Sat"))
lines(Times, sub1)
lines(Times, sub2, col="red")
lines(Times, sub3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))

# Plot #3
plot(Times, Voltage, xaxt="n", xlab="datetime", ylab="Voltage", type="n")
axis(1, at = c(1, 1441, 2880), labels =c("Thu","Fri","Sat"))
lines(Times, Voltage)

# Plot #4
plot(Times, Global_reactive_power, xaxt="n", xlab="datetime", ylab="Global_reactive_power", type="n")
axis(1, at = c(1, 1441, 2880), labels =c("Thu","Fri","Sat"))
lines(Times, Global_reactive_power)

# PNG device 

dev.copy(png, file = "plot4.png")
dev.off()


