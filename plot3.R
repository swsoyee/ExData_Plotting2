setwd("D:\\coursera\\NEI_data")
options(scipen = 200)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
subData <- NEI[NEI$fips == "24510", ]
totalEmission <- subData %>% group_by(year, type) %>% summarise(Total = sum(Emissions))
ggplot(data = totalEmission, aes(x = as.character(year), y = Total)) +
    geom_bar(aes(fill = type), position = "dodge", stat="identity") + 
    xlab("Year") + ylab("Total Emissions") + 
    ggtitle("Total emissions from 1999–2008 for Baltimore City")
ggsave(filename = "plot3.png")
