raw_data<-read.table("C:\\Rfiles\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
raw_data$Date = as.Date(raw_data$Date, '%d/%m/%Y')
data = subset(raw_data, raw_data$Date == '2007-02-01' | raw_data$Date == '2007-02-02')
rm(raw_data)  # free the unused memory
data = transform(data, Global_active_power = as.numeric(Global_active_power))
data$Date.Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

windows()
with( data, plot(Date.Time,Sub_metering_1, ylab = "Energy sub metering", type="n",xlab=""))
with(data, lines(Date.Time,Sub_metering_1))
with(data, lines(Date.Time, Sub_metering_2, col="red"))
with(data, lines(Date.Time,Sub_metering_3,col="blue"))
legend("topright", lty= c(1,1,1), col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.95)
dev.copy(png,file = "plot3.png", width=480, height = 480)
dev.off()

