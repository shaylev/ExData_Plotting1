plot2 <- function()
{
        #---- START fetching data -------------------------
        require("sqldf")
        mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
        myFile <- "household_power_consumption.txt"
        myData <- read.csv2.sql(myFile,mySql)
        Date_Time <- paste(myData$Date, myData$Time, " ")
        myData$DateTime <- as.POSIXct(Date_Time, format = "%d/%m/%Y %H:%M:%S")
        #---- END fetching date ---------------------------
        png("plot2.png", width = 480, height = 480 , units = "px")
        plot(myData$DateTime,myData$Global_active_power, type="s", xlab="", ylab = "Global Active Power (kilowatts)")
        dev.off()
        #assign("data1",myData,envir = .GlobalEnv) FOR PERSONAL TESTING
        
}