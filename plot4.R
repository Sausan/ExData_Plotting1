plot4 <- function(){
  
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
 
 # Prepare the data for the Date
 test_data$Date <- as.Date(test_data$Date, format='%d/%m/%Y')
 test_data$Date=paste(test_data$Date,test_data$Time)
 test_data$Date=strptime(test_data$Date, format = "%Y-%m-%d %H:%M:%S")
 
 # Prepare the data for the first diagram
 test_data$Global_active_power <- as.numeric(test_data$Global_active_power)
 
 # Prepare the data for the second diagram
 test_data$Voltage <- as.numeric(test_data$Voltage)

 # Prepare the data for the third diagram
 test_data$Sub_metering_1 <- as.numeric(test_data$Sub_metering_1)
 test_data$Sub_metering_2 <- as.numeric(test_data$Sub_metering_2)
 test_data$Sub_metering_3 <- as.numeric(test_data$Sub_metering_3)
 
 # Prepare the data for the fourth diagram
 test_data$Global_reactive_power <- as.numeric(test_data$Global_reactive_power)
 
 # ---------------------------------------------------------------------------------------
 # Plot #4 Section
 #----------------------------------------------------------------------------------------

 
   # Prepare the output file
   png("plot4.png",480,480)
 
  # Prepare the plot for four diagrams
    par(mfrow=c(2,2))
    
   #first diagram (top left)
   plot(test_data$Date, test_data$Global_active_power, type="l", ylab="Global Active Power (killowatts)",xlab="")
   
   #Second diagram (top right)
   plot(test_data$Date,test_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
 
   #Third diagram (bottom left)
   plot(test_data$Date, test_data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy Sub Metering")
   lines(test_data$Date, test_data$Sub_metering_2, type="l", col="red")
   lines(test_data$Date, test_data$Sub_metering_3, type="l", col="blue")
   legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
 
   #Fourth diagram (bottom right)
 plot(test_data$Date, test_data$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")
  #Close the device
  dev.off()
  
}

