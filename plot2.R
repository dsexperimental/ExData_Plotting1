##===============================
## Plot #2 global active power versus time
##===============================

makePlot2 <- function(data,asPng=FALSE) {
  if(asPng) {
    png(filename="plot2.png")
  }
  
  plot(data$datetime,data$Global_active_power,t="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  if(asPng) {
    dev.off()
  }
}
