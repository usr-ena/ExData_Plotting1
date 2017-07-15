# Read the file as a table
hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
# Select only the rows having dates of "1/2/2007" or "2/2/2007"
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
# Format Date and Time
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Add a column to the datatable
hpc <- cbind(hpc, datetime)

# part the device 2x2
par(mfrow=c(2,2))
# first plot
plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# second plot
plot(hpc$datetime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
#third plot
plot(hpc$datetime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$datetime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
# forth plot
plot(hpc$datetime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
# save as a png file
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()