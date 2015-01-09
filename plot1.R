plot1 <- function(data = 'household_power_consumption.txt') {
  # Takes data from the UC Irvine Machine learning Repository
  # which has the 'Individual household electric power consumption
  # Data Set' and uses the data from 2007-02-01 and 2007-02-02
  # to plot the Global Active Power in kilowatts versus the
  # Frequency in a bar chart. It saves the plot produced as
  # plot1.png.
  
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

  # Plot the data in a histogram
  png('plot1.png')
  plot1 <- hist(data$Global_active_power, main = 'Global Active Power', 
              xlab = 'Global Active Power (kilowatts)', 
              ylab = 'Frequency', col = 'red')
  dev.off()
}