#plot4.R
library(ggplot2)
library(RColorBrewer)
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

g <- ggplot(aggregate(Emissions ~ year, NEISCC[grepl("coal", NEISCC$Short.Name, ignore.case=TRUE), ], sum),
            aes(factor(year), Emissions, fill=factor(year)))
g <- g + geom_bar(stat="identity") + 
  scale_fill_brewer(palette="Blues")+
  theme_light() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total coal emissions of sources from 1999 to 2008')

ggsave("plot4.png")