# Read the file as a table
hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
# Select only the rows having dates of "1/2/2007" or "2/2/2007"
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
# Draw the histogram
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# save as a png file
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()