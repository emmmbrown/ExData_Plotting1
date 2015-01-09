plot2 <- function(data = 'household_power_consumption.txt') {
  # Takes data from the UC Irvine Machine learning Repository
  # which has the 'Individual household electric power consumption
  # Data Set' and uses the data from 2007-02-01 and 2007-02-02
  # to plot the Global Active Power in kilowatts over the
  # course of the two days. It saves the plot produced as
  # plot2.png.
  
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
  
  # Plot Global Active Power over time
  png('plot2.png')
  plot(data$DateTime, data$Global_active_power, xlab = '',
       ylab = 'Global Active Power (kilowatts)', type = 'n')
  lines(data$DateTime, data$Global_active_power)
  dev.off()
}