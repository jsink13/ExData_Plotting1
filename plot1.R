raw_data<-read.table("C:\\Rfiles\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
raw_data$Date = as.Date(raw_data$Date, '%d/%m/%Y')
data = subset(raw_data, raw_data$Date == '2007-02-01' | raw_data$Date == '2007-02-02')
rm(raw_data)  # free the unused memory
windows()
with(data, hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.copy(png,file = "plot1.png", width=480, height = 480)
dev.off()
