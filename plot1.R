
##
## Question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
##

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

##create a list of dataframes containing the sum of pm25 per each year
sumYear <- with(NEI,tapply(Emissions,year,sum))
sumYearDf <- data.frame(year = names(sumYear),sum = sumYear)

##produce the PNG file of the plot
png(filename = "plot1.png")

barplot(sumYearDf$sum,
        main = "total PM2.5 emission from all sources per year", 
        xlab = "Year",
        ylab = "total PM2.5 emission [ton]")

dev.off()