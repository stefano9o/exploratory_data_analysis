
##
## Question:
## Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999-2008?
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
if (!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

##subset only the coal sources
subsetingRow <- grepl("coal", SCC$Short.Name,ignore.case = TRUE)
SCC <- SCC[subsetingRow,]

##merge the 2 dataframe 
NEI_SCC <- merge(NEI,SCC,by = "SCC")

##create dataframe containing the sum of pm25 per each year
sumYear <- with(NEI_SCC,tapply(Emissions,year,sum))
sumYearDf <- data.frame(year = names(sumYear),sum = sumYear)

##produce the PNG file of the plot
png(filename = "plot4.png")

barplot(sumYearDf$sum,
        main = "total PM2.5 emission from coal combustion-related sources", 
        xlab = "Year",
        ylab = "total PM2.5 emission [ton]")


dev.off()