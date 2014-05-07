plot3 <- function()
{
        #---- START fetching data -------------------------
        require("sqldf")
        mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
        myFile <- "household_power_consumption.txt"
        myData <- read.csv2.sql(myFile,mySql)
        Date_Time <- paste(myData$Date, myData$Time, " ")
        myData$DateTime <- as.POSIXct(Date_Time, format = "%d/%m/%Y %H:%M:%S")
        #---- END fetching date ---------------------------
        png("plot3.png", width = 480, height = 480 , units = "px")
        plot_colors <- c("black","red","blue")
        plot(myData$DateTime, myData$Sub_metering_1, type="s" , col=plot_colors[1], ylab="", xlab="")
        
        lines(myData$DateTime, myData$Sub_metering_2, type="s", col=plot_colors[2])
        lines(myData$DateTime, myData$Sub_metering_3, type="s", col=plot_colors[3])
        title(ylab= "Energy sub metering")
        legend("topright",names(myData)[7:9] ,lty=1 ,col=plot_colors, bty='o', cex=.75)
        dev.off()
        #assign("data1",myData,envir = .GlobalEnv) FOR PERSONAL TESTING
        
}