# Read file household_power_consumption.txt
hse_power_con <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 1/2/2007 and 2/2/2007 Data set

sub_hse_power_con <- subset(hse_power_con,Date=="1/2/2007" | Date == "2/2/2007")

Datetime <- strptime(paste(sub_hse_power_con$Date,sub_hse_power_con$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(sub_hse_power_con$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_hse_power_con$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_hse_power_con$Sub_metering_3)



# Plot Hist
png("plot3.png",height=480,width = 480)
plot(Datetime,sub_metering_1,type= "n",xlab="",ylab = "Energy sub metering")
points(Datetime,sub_metering_1,type = "l")
points(Datetime,sub_metering_2,type = "l",col="red")
points(Datetime,sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))


dev.off()
