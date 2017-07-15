# Read the file as a table
hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
# Select only the rows having dates of "1/2/2007" or "2/2/2007"
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
# Format Date and Time
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Add a column to the datatable
hpc <- cbind(hpc, datetime)
# Plot the graphic
plot(hpc$datetime, hpc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_2, col="red")
lines(hpc$datetime, hpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
# save as a png file
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()