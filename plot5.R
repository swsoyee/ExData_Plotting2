setwd("D:\\coursera\\NEI_data")
options(scipen = 200)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(plotly)

subData <- NEI %>% filter(fips == "24510", type == "ON-ROAD") %>%
  group_by(year) %>% summarise(Total_Emissions = sum(Emissions))

p <- plot_ly(data = subData,
             x = ~as.character(year),
             y = ~Total_Emissions,
             type = "scatter",
             mode = "lines+markers") %>%
  layout(title = "Motor Vehicle Related PM2.5 Emission in Baltimore (1999 - 2008)",
         yaxis = list(title = "Motor Vehicle Related PM2.5 Emission (in tons)"),
         xaxis = list(title = "Year"))

export(p, file = "plot5.png")
