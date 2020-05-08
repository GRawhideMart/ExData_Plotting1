plot2 <- function() {
    
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
    with(data, plot(Datetime,Global_active_power, type='n', ylab='Global Active Power'))
    with(data, lines(Datetime,Global_active_power))
    dev.copy(png, 'plot2.png')
    dev.off()
    print('Done')
}
    
    
    