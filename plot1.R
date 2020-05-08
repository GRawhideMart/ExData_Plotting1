plot1 <- function() {
    
    # ========================================
    # IF YOU NEED TO EXECUTE, UNZIP DATA FIRST
    # ========================================
    
    file <- './household_power_consumption.txt'
    data <- read.table(file, header=TRUE, sep = ';')
    data$Date <- as.Date(data$Date, format='%d/%m/%Y')
    dat <- subset(data, (data$Date == '2007-02-01' | data$Date == '2007-02-02'))
    rm(data)
    dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
    hist(dat$Global_active_power, col='red', breaks = 13, main='Global Active Power', xlab = 'Global Active Power (kilowatts)')
    dev.copy(png, 'plot1.png')
    dev.off()
    print('Done.')
}