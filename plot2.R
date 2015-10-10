
# Read in the .txt file

dataPower <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Convert first column into Date's

data.Power <- dataPower
data.Power$Date <- as.Date(data.Power$Date, "%d/%m/%Y")

# Subset data from 2007-02-01 and 2007-02-02

data.Power.Subset <- data.Power[data.Power$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# Combine Date + Time into single item
dt <- paste(as.character(data.Power.Subset$Date), as.character(data.Power.Subset$Time))

# Convert Global_active_power and Time into appropriate types

y <- as.numeric(as.character(data.Power.Subset$Global_active_power))
t <- strptime(dt, format="%Y-%m-%d %H:%M:%S")
Times <- difftime(t, t[1], units="mins")

# Plot line

quartz()
plot(Times, y, xaxt="n", xlab="", ylab="Global Active Power (kilowatts)", type="n")
axis(1, at = c(1, 1441, 2880), labels =c("Thu","Fri","Sat"))
lines(Times, y)

# PNG device 

dev.copy(png, file = "plot2.png")
dev.off()


