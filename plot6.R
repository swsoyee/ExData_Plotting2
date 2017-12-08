setwd("D:\\coursera\\NEI_data")
options(scipen = 200)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(plotly)

subData <- NEI %>% filter(fips %in% c("24510", "06037"), type == "ON-ROAD") %>%
  group_by(fips, year) %>% summarise(Total_Emissions = sum(Emissions))

subData[subData$fips == "24510", ]$fips <- "Baltimore City"
subData[subData$fips == "06037", ]$fips <- "Los Angeles County"

p <- plot_ly(data = subData,
             x = ~as.character(year),
             y = ~Total_Emissions,
             color = ~fips,
             type = "scatter",
             mode = "lines+markers") %>%
  layout(title = "Motor Vehicle Related PM2.5 Emission (1999 - 2008)",
         yaxis = list(title = "Motor Vehicle Related PM2.5 Emission (in tons)"),
         xaxis = list(title = "Year"),
         legend = list(orientation = "h"))

export(p, file = "plot6.png")
