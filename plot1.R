
## The lazy solution to load all files for all the project with the same piece of code !!
# if the variable existis in globals I don`t need to reaload it again. 
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}


png('plot1.png',width=480, height=480)

with(aggregate(Emissions ~ year, NEI, sum), 
     barplot(
       height=Emissions,names.arg=year,xlab="Years",
       ylab=expression('total PM'[2.5]*' emission'),
       main=expression('Total PM'[2.5]*' emissions for several years')
     )
    )
dev.off()
