plot4 <- function() {
    # ========================================
    # IF YOU NEED TO EXECUTE, UNZIP DATA FIRST
    # ========================================
    
    file <- './household_power_consumption.txt'
    data <- read.table(file, header=TRUE, sep = ';')
    
    # ========================================
    # SUBSETTING RIGHT AWAY
    #  > This way, calculations will be faster
    # ========================================
    data$Date <- as.Date(data$Date, format='%d/%m/%Y')
    data <- subset(data, (data$Date == '2007-02-01' | data$Date == '2007-02-02'))
    
    # =============================================
    # ASSIGNING THE RIGHT DATATYPE TO THE VARIABLES
    # =============================================
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
    data$Voltage <- as.numeric(as.character(data$Voltage))
    
    # ==================================
    # DEFINING NEW COLUMN TIMELINE
    # > This will be used to plot x-axis
    # ==================================
    data$Datetime <- paste(data$Date,data$Time)
    data$Datetime <- strptime(data$Datetime, format='%Y-%m-%d %T')
    data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
    
    # ================================
    # PLOTTING AND GENERATING PNG FILE
    # ================================
    par(mfrow = c(2,2))
    with(data, plot(Datetime, Global_active_power, type='n', xlab='Global Active Power')) # TOP LEFT
    with(data, lines(Datetime, Global_active_power))                                      #   PLOT
    
    with(data, plot(Datetime,Voltage, type='n'))  # TOP RIGHT
    with(data, lines(Datetime,Voltage))           #   PLOT
    
    with(data, plot(Datetime, Sub_metering_1, type='n', ylab='Energy sub metering'))
    with(data, lines(Datetime, Sub_metering_1))                                        # BOTTOM LEFT
    with(data, lines(Datetime, Sub_metering_2, col='red'))                             #    PLOT
    with(data, lines(Datetime, Sub_metering_3, col='blue'))
    legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black', 'red', 'blue'), lty=1, cex = 0.6)
    
    with(data, plot(Datetime, Global_reactive_power,type='n'))   # BOTTOM RIGHT
    with(data, lines(Datetime, Global_reactive_power))           #     PLOT
    
    dev.copy(png, 'plot4.png')
    dev.off()
    print('Done')
}