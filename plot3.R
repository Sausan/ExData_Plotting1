plot3 <- function(){
  
  library(graphics)
  library(dplyr)
  
 # ---------------------------------------------------------------------------------------
 # Main Repeatable Section
 #----------------------------------------------------------------------------------------
  
  # Read the data file
  All_data <- read.csv("../Data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE )
  
  # Extract the data from the file where date== "1/2/2007" (February first) & date=="2/2/2007" (February Second)
  
  test1 <- subset(All_data, Date == "1/2/2007")
  test2 <- subset(All_data, Date == "2/2/2007")
  test_data <- rbind(test1,test2)
 
 # Prepare the data
 test_data$Sub_metering_1 <- as.numeric(test_data$Sub_metering_1)
 test_data$Sub_metering_2 <- as.numeric(test_data$Sub_metering_2)
 test_data$Sub_metering_3 <- as.numeric(test_data$Sub_metering_3)
 
 # ---------------------------------------------------------------------------------------
 # Plot #3 Section
 #----------------------------------------------------------------------------------------
 
  # Format the date and the time to extract the day of the week
  # Change the class of the "Date" from Character to Date
  test_data$Date <- as.Date(test_data$Date, format='%d/%m/%Y')
 
  #In order to get the day of the week, use the strptime() command
  test_data$Date=paste(test_data$Date,test_data$Time)
  test_data$Date=strptime(test_data$Date, format = "%Y-%m-%d %H:%M:%S")
 
  
 
  # Prepare the file
  png("plot3.png",480,480)
  
   #Draw the plot
   plot(test_data$Date, test_data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy Sub Metering")
   lines(test_data$Date, test_data$Sub_metering_2, type="l", col="red")
   lines(test_data$Date, test_data$Sub_metering_3, type="l", col="blue")
   legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
 
  #Close the device
  dev.off()
  
}

