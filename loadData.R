##========================
## Load Data
##=======================
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
  data <- read.table(text=fileLines,header=TRUE,sep=";")
  
  ##========================
  ## Modify data format - make a date time column
  ##========================
  
  # parse the dates
  data$Date <- as.Date(data$Date,format="%d/%m/%Y")
  
  #create a date time column
  data$datetime <- as.POSIXlt(paste(data$Date,data$Time))
  
  data
}