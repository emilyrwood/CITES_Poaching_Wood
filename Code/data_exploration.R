#data exploration 


#Visualizing countries with greater number of exports and imports
#Found journal to visualize countries https://journal.r-project.org/archive/2011-1/RJournal_2011-1_South.pdf
#install.packages('rworldmap')
library(rworldmap)

#Imports
CITES_Importer_withmap <- joinCountryData2Map( CITESPoaching2016,
                                               joinCode = "ISO_A2",
                                               nameJoinColumn = "Importer",)
data(CITESPoaching2016)
sPDF <- joinCountryData2Map( CITESPoaching2016
                             ,joinCode = "ISO_A2"
                             ,nameJoinColumn = "Importer")
mapDevice() #create world map shaped window
mapCountryData(sPDF
               ,nameColumnToPlot='Importer')

#Exports 
CITES_Exporter_withmap <- joinCountryData2Map( CITESPoaching2016,
                                               joinCode = "ISO_A2",
                                               nameJoinColumn = "Exporter",)
data(CITESPoaching2016)
sPDF <- joinCountryData2Map( CITESPoaching2016
                             ,joinCode = "ISO_A2"
                             ,nameJoinColumn = "Exporter")
mapDevice() #create world map shaped window
mapCountryData(sPDF
               ,nameColumnToPlot='Exporter')