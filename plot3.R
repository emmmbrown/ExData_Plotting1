plot3 <- function(data = 'household_power_consumption.txt') {
  # Takes data from the UC Irvine Machine learning Repository
  # which has the 'Individual household electric power consumption
  # Data Set' and uses the data from 2007-02-01 and 2007-02-02
  # to plot the Energy sub metering from 3 meters over the
  # course of the two days. It saves the plot produced as
  # plot3.png.
  
  # First, read and clean up data file.
  data = read.table(data, header = TRUE, sep = ';', na.strings = '?',
                    colClasses = c('factor', 'factor', 'numeric', 
                                   'numeric', 'numeric', 'numeric',
                                   'numeric', 'numeric', 'numeric'))
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #Format date
  
  # Subset data
  date1 <- as.Date("2007-02-01") # Setting the two days we are
  date2 <- as.Date("2007-02-02") # focusing on
  data <- subset(data, data$Date == date1 | data$Date == date2)
  
  # Combine the 'Date' and 'Time' Columns to one new column
  #and convert to POSIXct
  data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                              format = '%Y-%m-%d %H:%M:%S')
  
  # Plot data and save as png
  png('plot3.png')
  with(data, plot(DateTime, Sub_metering_1, xlab = '',
                  ylab = 'Energy sub metering', type = 'n'))
  with(data, lines(DateTime, Sub_metering_1, col = 'black'))
  with(data, lines(DateTime, Sub_metering_2, col = 'red'))
  with(data, lines(DateTime, Sub_metering_3, col = 'blue'))
  legend('topright', col = c('black', 'red', 'blue'), lty = c(1, 1),
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  dev.off()
}