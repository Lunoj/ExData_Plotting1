# Read file household_power_consumption.txt
hse_power_con <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 1/2/2007 and 2/2/2007 Data set

sub_hse_power_con <- subset(hse_power_con,Date=="1/2/2007" | Date == "2/2/2007")

Datetime <- strptime(paste(sub_hse_power_con$Date,sub_hse_power_con$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

Global_active_power <- as.numeric(sub_hse_power_con$Global_active_power)
Global_reactive_power <- as.numeric(sub_hse_power_con$Global_reactive_power)
Voltage <- as.numeric(sub_hse_power_con$Voltage)


sub_metering_1 <- as.numeric(sub_hse_power_con$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_hse_power_con$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_hse_power_con$Sub_metering_3)



# Plot Hist
png("plot4.png",height=480,width = 480)
par(mar=c(4,4,2,2))
par(mfrow=c(2,2))

#left top corner
plot(Datetime,Global_active_power,type="l",xlab="",ylab = "Global Active Power")


#top right corner
plot(Datetime,Voltage,type="l",xlab = "datetime",ylab = "Voltage")

#botton left corner
plot(Datetime,sub_metering_1,type= "n",xlab="",ylab = "Energy sub metering")
points(Datetime,sub_metering_1,type = "l")
points(Datetime,sub_metering_2,type = "l",col="red")
points(Datetime,sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")

# bottom rigt corner
plot(Datetime,Global_reactive_power,type="l",xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
