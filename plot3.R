#plot 3
library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

g <- ggplot(aggregate(Emissions ~ year + type, subset(NEI,NEI$fips=="24510"), sum),
             aes(year, Emissions, color = type)
            )

g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City and  Maryland from 1999 to 2008')
#using ggsave instead of the regular device manipulation.
ggsave("plot3.png")