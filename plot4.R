setwd("D:\\coursera\\NEI_data")
options(scipen = 200)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

SCC.coal <- as.character(SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]$SCC)

subData <- NEI[NEI$SCC %in% SCC.coal, ]

totalEmission <- subData %>% group_by(year) %>% summarise(Total = sum(Emissions))
ggplot(data = totalEmission, aes(x = as.character(year), y = Total, group = 1)) +
    geom_point() + geom_line() +
    xlab("Year") + ylab("Total Emissions") + 
    ggtitle("Emissions and Total Coal Combustion for the United States")
ggsave(filename = "plot4.png")
