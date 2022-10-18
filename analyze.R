
##========================
## Functions
##========================

##------------------------
## Load Data
##------------------------
loadData <- function() {
  ##------------------------
  # open a file connection and store only the lines we are interested in
  # in an charcter vector
  ##------------------------
  
  con <- file("household_power_consumption.txt","r")
  reachedData <- FALSE
  fileLines <- character()
  
  ## header line
  inputNum <- 1
  outputNum <- 1
  fileLines[outputNum] <- readLines(con,n=1)
  
  ## read the body, keeping the lines of interest
  repeat {
    inputNum <- inputNum + 1
    line <- readLines(con,n=1)
    if((startsWith(line,"1/2/2007"))||(startsWith(line,"2/2/2007"))) {
      if(!reachedData) {
        reachedData = TRUE
        print(sprintf("start of data reached: line %d",inputNum))
      }
      
      outputNum = outputNum + 1
      fileLines[outputNum] <- line
    }
    else if(reachedData) {
      print(sprintf("end of data reached: line %d",inputNum))
      break
    }
  }
  close(con)
  
  ##------------------------
  # run read.table on our text vector
  ##------------------------
  data = read.table(text=fileLines,header=TRUE,sep=";")
  
  ##========================
  ## Modify data format - make a date time column
  ##========================
  
  # parse the dates
  data$Date = as.Date(data$Date,format="%d/%m/%Y")
  
  #create a date time column
  data$datetime = as.POSIXlt(paste(data$Date,data$Time))
  
  data
}


##===============================
## Load the Data
##===============================
data = loadData()

##===============================
## Plot #1 global active power histogram
##===============================
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##===============================
## Plot #2 global active power versus time
##===============================
plot(data$datetime,data$Global_active_power,t="l",xlab="",ylab="Global Active Power (kilowatts)")

##===============================
## Plot #3 submetering versus time
##===============================

################################################################################
## NOTE - I modified some values from the plot shown in the instructions      ##
## - I made a more friendly values for the legend text                        ##
##                                                                            ##
## I know there are not supposed to be perfectly clean, but this was not any  ##
## additional work.                                                           ##
################################################################################

plot(data$datetime,data$Sub_metering_1,t="l",xlab="",ylab="Energy Sub Metering")
points(data$datetime,data$Sub_metering_2,t="l",col="red")
points(data$datetime,data$Sub_metering_3,t="l",col="blue")
legend("topright",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lwd=1,col=c("black","red","blue"))


##===============================
## Plot #4 multi-plot
##===============================

################################################################################
## NOTE - I modified some values from the plot shown in the instructions      ##
## - I made a more friendly y axis label for the fourth plot Y                ##
## - I put a commont "Time" label for all the x axes. I would have omitted    ##
##   this as obviouis but I thought someone might want to see I could put a   ##
##   label there                                                              ##
## - As with the above submetering plot, I changed the legend text            ##
##                                                                            ##
## I know there are not supposed to be perfectly clean, but this was not any  ##
## additional work.                                                           ##
################################################################################

par(mfrow = c(2,2))

# Global active power versus time
plot(data$datetime,data$Global_active_power,t="l",xlab="Time",ylab="Global Active Power (kilowatts)")

# Voltage versus time
plot(data$datetime,data$Voltage,t="l",xlab="Time",ylab="Voltage")

# Submetering
plot(data$datetime,data$Sub_metering_1,t="l",xlab="Time",ylab="Energy sub metering")
points(data$datetime,data$Sub_metering_2,t="l",col="red")
points(data$datetime,data$Sub_metering_3,t="l",col="blue")
legend("topright",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lwd=1,col=c("black","red","blue"))

# Global Reactive Power
plot(data$datetime,data$Global_reactive_power,t="l",xlab="Time",ylab="Global Reactive Power (kilowatts)")


