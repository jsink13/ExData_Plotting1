raw_data<-read.table("C:\\Rfiles\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
raw_data$Date = as.Date(raw_data$Date, '%d/%m/%Y')
data = subset(raw_data, raw_data$Date == '2007-02-01' | raw_data$Date == '2007-02-02')
rm(raw_data)  # free the unused memory
data = transform(data, Global_active_power = as.numeric(Global_active_power))
data$Date.Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

windows()
par(mfrow = c(2,2))
+#plot 1
with(data, plot(Date.Time,Global_active_power,ylab="Global Active Power", xlab="", type="n"))
with(data, lines(Date.Time,Global_active_power))
+#plot 2
with(data, plot(Date.Time,Voltage,xlab="datetime",type="n"))
with(data, lines(Date.Time,Voltage))
+#plot 3
with( data, plot(Date.Time,Sub_metering_1, ylab = "Energy sub metering", type="n",xlab=""))
with(data, lines(Date.Time,Sub_metering_1))
with(data, lines(Date.Time, Sub_metering_2, col="red"))
with(data, lines(Date.Time,Sub_metering_3,col="blue"))
legend("topright", lty= c(1,1,1), col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.95,bty="n")
+#plot 4
with(data, plot(Date.Time,Global_reactive_power,type="n", xlab = "datetime"))
with(data,lines(Date.Time,Global_reactive_power))
dev.copy(png,file = "plot4.png", width=480, height = 480)
dev.off()


