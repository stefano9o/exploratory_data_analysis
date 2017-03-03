
##
## Question:
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
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

##subset only the observation from Baltimora city
NEI_sub <- subset(NEI,fips == "24510")

##split the dataframe in 4 differnt df (one per each type)
point <- subset(NEI_sub,type == "POINT")
nonPoint <- subset(NEI_sub,type == "NONPOINT")
onRoad <- subset(NEI_sub,type == "ON-ROAD")
nonRoad <- subset(NEI_sub,type == "NON-ROAD")

##create dataframe containing the sum of pm25 per each year
sumYearPoint <- with(point,tapply(Emissions,year, sum))
sumYearNonPoint <- with(nonPoint,tapply(Emissions,year, sum))
sumYearOnRoad <- with(onRoad,tapply(Emissions,year, sum))
sumYearNonRoad <- with(nonRoad,tapply(Emissions,year, sum))
sumYearTypesDf <- data.frame(year = rep(names(sumYearPoint),4),
                        type = rep(c("point","nonpoint","on-road","non-road"),each = 4),
                        sum = c(sumYearPoint,sumYearNonPoint,sumYearOnRoad,sumYearNonRoad))

##produce the PNG file of the plot
png(filename = "plot3.png")

g <- ggplot(sumYearTypesDf,
        aes(x = year, 
            y = sum, 
            color = type, 
            group = type)
        ) + 
        geom_point() + 
        geom_line() +
        labs(title = "total PM2.5 emission from Baltimore City (for each type of source)",
             x = "year",
             y = "total PM2.5 emission [ton]")
print(g)

dev.off()