raw_data<-read.table("C:\\Rfiles\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
raw_data$Date = as.Date(raw_data$Date, '%d/%m/%Y')
data = subset(raw_data, raw_data$Date == '2007-02-01' | raw_data$Date == '2007-02-02')
rm(raw_data)  # free the unused memory
data = transform(data, Global_active_power = as.numeric(Global_active_power))
data$Date.Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

windows()
plot(data$Date.Time, data$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png,file = "plot2.png",width=480, height = 480)
dev.off()
