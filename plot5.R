# plot 5


NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SRC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")


VEH <- grep("vehicle",SRC$EI.Sector,value=T,ignore.case=T)
SRC.VEH <- subset(SRC, SRC$EI.Sector %in% VEH, select=SCC)
BC <- subset(NEI, fips == "24510")
NEI.VEH <- subset(BC, BC$SCC %in%  SRC.VEH$SCC)
pd <- aggregate(NEI.VEH[c("Emissions")], list(year = NEI.VEH$year), sum)


library(ggplot2)
png('plot5.png', width=480, height=480)
plot(pd$year, pd$Emissions, type = "l", 
     main = "Total Vehicle Emissions in Baltimore City",
     xlab = "Year", ylab = "Emissions")


dev.off()