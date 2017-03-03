
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

##subset only the observation from Baltimora city and Los Angeles County for ON-ROAD sources
NEI_bal <- subset(NEI,fips == "24510" & type == "ON-ROAD")
NEI_los <- subset(NEI,fips == "06037" & type == "ON-ROAD")

##create dataframe containing the sum of pm25 per each year for both of the cities
sumYearBal <- with(NEI_bal,tapply(Emissions,year,sum))
sumYearLos <- with(NEI_los,tapply(Emissions,year,sum))
sumYearDf <- data.frame(year = rep(names(sumYearBal),2),
                        county = rep(c("Baltimora","Los Angeles"),each = 4),
                        sum = c(sumYearBal,sumYearLos))

##produce the PNG file of the plot
png(filename = "plot6.png")

g <- ggplot(sumYearDf,
            aes(x = year, 
                y = sum, 
                color = county, 
                group = county)
            ) + 
            geom_point() + 
            geom_line() +
            labs(title = "Comparison from motor vehicle sources (ON-ROAD) \n between Baltimore City and Los Angeles County",
                 x = "year",
                 y = "total PM2.5 emission [ton]")
print(g)

dev.off()