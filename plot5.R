
##
## Question:
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
##  
##

library(ggplot2)

#defining source and filenames
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
pm25Source <- "summarySCC_PM25.rds"
pm25NameSource <- "Source_Classification_Code.rds"

##download the zip ile
filename <- "assignment.zip"
if(!file.exists(filename)){
  download.file(fileUrl,filename)
}

##decompress the zip file
if (!file.exists(pm25Source)){
  unzip(filename)
}
if (!file.exists(pm25NameSource)){
  unzip(filename)
}

##read dataframes
if (!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

##subset only the observation from Baltimora city and ON-ROAD sources
NEI_sub <- subset(NEI,fips == "24510" & type == "ON-ROAD")

##create dataframe containing the sum of pm25 per each year
sumYear <- with(NEI_sub,tapply(Emissions,year,sum))
sumYearOnroadDf <- data.frame(year = names(sumYear),sum = sumYear)

##produce the PNG file of the plot
png(filename = "plot5.png")

barplot(sumYearOnroadDf$sum,
        main = "total PM2.5 emission from motor vehicle sources (ON-ROAD) \n in Baltimore City", 
        xlab = "Year",
        ylab = "total PM2.5 emission [ton]")


dev.off()