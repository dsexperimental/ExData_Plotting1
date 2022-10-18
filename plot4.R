##===============================
## Plot #4 multi-plot
##===============================

makePlot4 <- function(data,asPng=FALSE) {
  if(asPng) {
    png(filename="plot4.png")
  }
  
  par(mfrow = c(2,2))
  
  ##-----------------------------
  ## I'm defining these two variables to exactly reproduce the look of some of the graphs without
  ## adding specific labels for it, in the interest of simulating a "quick and dirty exploratory plot"
  datetime <- data$datetime
  Global_reactive_power <- data$Global_reactive_power
  ##-----------------------------
  
  # Global active power versus time
  plot(data$datetime,data$Global_active_power,t="l",xlab="",ylab="Global Active Power")
  
  # Voltage versus time
  plot(datetime,data$Voltage,t="l",ylab="Voltage")
  
  # Submetering
  plot(data$datetime,data$Sub_metering_1,t="l",xlab="",ylab="Energy sub metering")
  points(data$datetime,data$Sub_metering_2,t="l",col="red")
  points(data$datetime,data$Sub_metering_3,t="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),bty="n")
  
  # Global Reactive Power
  plot(datetime,Global_reactive_power,t="l")
  
  if(asPng) {
    dev.off()
  }
  else {
    par(mfrow = c(1,1))
  }
}