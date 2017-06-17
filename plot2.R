# Read file household_power_consumption.txt
hse_power_con <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 1/2/2007 and 2/2/2007 Data set

SubGlobal_active_power <- subset(hse_power_con,Date=="1/2/2007" | Date == "2/2/2007")

Datetime <- strptime(paste(SubGlobal_active_power$Date,SubGlobal_active_power$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

Global_active_power <- as.numeric(SubGlobal_active_power$Global_active_power)

# Plot Hist
png("plot2.png",height=480,width = 480)
plot(Datetime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Powe (kilowatts)")

dev.off()
