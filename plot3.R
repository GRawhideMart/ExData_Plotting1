plot3 <- function() {
    
    # ========================================
    # IF YOU NEED TO EXECUTE, UNZIP DATA FIRST
    # ========================================
    
    file <- './household_power_consumption.txt'
    data <- read.table(file, header=TRUE, sep = ';')
    data$Date <- as.Date(data$Date, format='%d/%m/%Y')
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    data <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')
    data$Datetime <- paste(data$Date,data$Time)
    data$Datetime <- strptime(data$Datetime, format='%Y-%m-%d %T')
    data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
    with(data, plot(Datetime, Sub_metering_1, type='n', ylab='Energy sub metering'))
    with(data, lines(Datetime, Sub_metering_1))
    with(data, lines(Datetime, Sub_metering_2, col='red'))
    with(data, lines(Datetime, Sub_metering_3, col='blue'))
    legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black', 'red', 'blue'), lty=1)
    dev.copy(png, 'plot3.png')
    dev.off()
    print('Done')
}