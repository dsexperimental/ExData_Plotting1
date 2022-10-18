##==============================
## Make Plots
##==============================

source("loadData.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

data <- loadData()
asPng <- TRUE

makePlot1(data,asPng)
makePlot2(data,asPng)
makePlot3(data,asPng)
makePlot4(data,asPng)
