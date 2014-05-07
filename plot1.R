plot1 <- function()
{
        #---- START fetching data -------------------------
        require("sqldf")
        mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
        myFile <- "household_power_consumption.txt"
        myData <- read.csv2.sql(myFile,mySql)
        myData$Date <- as.Date(myData$Date, format ="%d/%m/%Y")
        #---- END fetching date ---------------------------
        png("plot1.png", width = 480, height = 480 , units = "px")
        hist(myData$Global_active_power, col = "Red", main ="Global Active Power", xlab ="Global Active Power (kilowatts)", ylab = "Frequency")
        dev.off()
        #assign("data1",myData,envir = .GlobalEnv) FOR PERSONAL TESTING
}
