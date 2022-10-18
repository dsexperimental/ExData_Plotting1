##===============================
## Plot #3 submetering versus time
##===============================

makePlot3 <- function(data,asPng=FALSE) {
  if(asPng) {
    png(filename="plot3.png")
  }
  
  plot(data$datetime,data$Sub_metering_1,t="l",xlab="",ylab="Energy sub metering")
  points(data$datetime,data$Sub_metering_2,t="l",col="red")
  points(data$datetime,data$Sub_metering_3,t="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))
  
  if(asPng) {
    dev.off()
  }
}