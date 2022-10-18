##===============================
## Plot #1 global active power histogram
##===============================

makePlot1 <- function(data,asPng=FALSE) {
  if(asPng) {
    png(filename="plot1.png")
  }
  
  hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  
  if(asPng) {
    dev.off()
  }
}