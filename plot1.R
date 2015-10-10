
# Read in the .txt file

dataPower <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Convert first column into Date's

data.Power <- dataPower
data.Power$Date <- as.Date(data.Power$Date, "%d/%m/%Y")

# Subset data from 2007-02-01 and 2007-02-02

data.Power.Subset <- data.Power[data.Power$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# Comvert Global_active_power into numeric

y <- as.numeric(as.character(data.Power.Subset$Global_active_power))

# Plot histogram

quartz()
hist(y, col="red", xlab="Global Active Power (kilowatts", 
     main = "Global Active Power")

# PNG device 

dev.copy(png, file = "plot1.png")
dev.off()

