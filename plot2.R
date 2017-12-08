setwd("D:\\coursera\\NEI_data")
options(scipen = 200)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

subData <- NEI[NEI$fips == "24510", ]
totalEmission <- subData %>% group_by(year) %>% summarise(Total = sum(Emissions))
forPlot <- totalEmission$Total
names(forPlot) <- totalEmission$year

png(file="plot2.png",width=480,height=480)
barplot(forPlot)
title(main = "Total PM2.5 emission for each year in Baltimore City")
dev.off()
