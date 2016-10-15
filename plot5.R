#plot5.R
library(ggplot2)
library(RColorBrewer)
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}
g <- ggplot(aggregate(Emissions ~ year,subset(NEI,NEI$fips=="24510" & NEI$type=="ON-ROAD") , sum)
            , aes(factor(year), Emissions,fill=factor(year)))

g <- g + geom_bar(stat="identity") + scale_fill_brewer(palette="Blues") +
  xlab("Year")+ theme_minimal() +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle  in Baltimore and Maryland from 1999 to 2008')
ggsave("plot5.png")