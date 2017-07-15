# Read the file as a table
hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
# Select only the rows having dates of "1/2/2007" or "2/2/2007"
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
# Format Date and Time
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Add a column to the datatable
hpc <- cbind(hpc, datetime)
#plot
plot( hpc$Global_active_power ~ hpc$datetime, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
# save as a png file
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()