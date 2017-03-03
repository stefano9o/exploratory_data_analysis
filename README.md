# Exploratory data analysis
## Final project of course assignment

### Questions
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

### Answers

1. YES (plot1.png).
2. NO, between 2002 and 2005 there is an increase of the total emission from PM2.5 in the Baltimore City (plot2.png).
3. Some of the sources decreases, and others increases (plot3.png):
  * decreases in emissions from 1999–2008:
    * NON-POINT sources: it always decreases except between 2002 and 2005 in which remains unchanged.
    * ON-ROAD sources: it always decreases.
  * increases in emissions from 1999–2008:
    * POINT sources: it always increases except between 2005 and 2008 in which drastically decreases.
    * NON-ROAD sources: it always decreases except between 2002 and 2005 in which slightly increases.
4. The emissions from coal combustion-related sources always decrease except between 2002 and 2005 in which slightly increases (plot4.png).
5. The emissions from motor vehicle sources always decrease. Between 1999 and 2002 there is a drastically decreases (plot5.png).
6. Comparison between Baltimore City and Los Angeles County (plot6.png):
  * Baltimore City: it has lower emissions respect Los Angeles County. Also, the emissions from motor vehicle sources always decrease.
  * Los Angeles County: it has higher emissions respect Baltimore City.
