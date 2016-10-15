#plot6.R
library(ggplot2)
library(RColorBrewer)
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

aggregatedTotals <- aggregate(Emissions ~ year + fips, 
                                          subset(NEI,(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD"  ), sum)
aggregatedTotals$fips[aggregatedTotals$fips=="24510"] <- "Baltimore, MD"
aggregatedTotals$fips[aggregatedTotals$fips=="06037"] <- "Los Angeles, CA"

g <- ggplot(aggregatedTotals, aes(x=year, y= Emissions, group=fips))
g <- g + geom_line(aes(linetype=fips, color=fips)) + geom_point(aes(color=fips)) +
  theme_minimal() + 
  scale_linetype_manual(values=c("twodash", "dotted")) +
  scale_color_manual(values=c('#999999','#E69F00'))+
  scale_size_manual(values=c(1, 1.5))+
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle  in Baltimore  Vs Los Angeles  1999-2008')
## ggsave easy my life regarding devices and such...
ggsave("plot6.png")