plot1 <- function(){
  
  library(graphics)
  library(dplyr)
  
  # Read the data file
  All_data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE )
  
  # Extract the data from the file where date== "1/2/2007" & date=="2/2/2007"
  
  test1 <- subset(All_data, Date == "1/2/2007")
  test2 <- subset(All_data, Date == "2/2/2007")
  test_data <- rbind(test1,test2)
  
  # Plot 1
  # Prepare the file
  png("plot1.png",480,480)
  
  # Prepare the data
  test_data$Global_active_power <- as.numeric(test_data$Global_active_power)
  
  #Draw the histogram
  hist(test_data$Global_active_power,col="red", xlab= "Global Active Power (killowatts)", main="Global Active Power")
  
  #Close the device
  dev.off()
  
}

