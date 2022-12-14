#data exploration 

#Basic 

dim(CITES2016_Processed)
str(CITES2016_Processed)

#Visualizing countries with greater number of exports and imports
#Found journal to visualize countries https://journal.r-project.org/archive/2011-1/RJournal_2011-1_South.pdf
#install.packages('rworldmap')
library(rworldmap)

#Importer Countries
CITES_Importer_withmap <- joinCountryData2Map( CITES2016_Processed
                             ,joinCode = "ISO_A2"
                             ,nameJoinColumn = "Importer")
mapDevice() #create world map shaped window
mapCountryData(CITES_Importer_withmap, nameColumnToPlot='Importer')

Importerplot1 <- ggplot(CITES2016_Processed, aes(x=Importer))+ 
                geom_bar(binwidth=50, colour="blue", fill="light blue", alpha=0.3)
Importerplot1

#Difficult to interpret. Wrangle new dataset and create bar graph with only top 10 import countries:

table(CITES2016_Processed$Importer)

ImporterData <-CITES2016_Processed %>%
                group_by(Importer)  %>%
                summarise(Importer, count=n()) %>%
                filter(Importer == "US" | Importer == "JP" | Importer == "DE" | Importer == "FR"
                       | Importer == "HK" | Importer == "CH" | Importer == "CN" | Importer == "SG" | Importer == "AE" | Importer == "CA")


Importerplot2 <- ggplot(ImporterData, aes(x=Importer))+ 
  geom_bar(binwidth=50, colour="purple", fill="lavender", alpha=0.3)
Importerplot2
  
#Exporter Countries 
CITES_Exporter_withmap <- joinCountryData2Map( CITES2016_Processed
                                               ,joinCode = "ISO_A2"
                                               ,nameJoinColumn = "Exporter")
mapDevice() #create world map shaped window
mapCountryData(CITES_Exporter_withmap, nameColumnToPlot='Exporter')

Exporterplot1 <- ggplot(CITES2016_Processed, aes(x=Exporter))+ 
  geom_bar(binwidth=50, colour="blue", fill="light blue", alpha=0.3)
  Exporterplot1

#Difficult to interpret. Wrangle new dataset and create bar graph with only top 10 export countries:

table(CITES2016_Processed$Exporter)

ExporterData <-CITES2016_Processed %>%
  group_by(Exporter)  %>%
  summarise(Exporter, count=n()) %>%
  filter(Exporter == "NL" | Exporter == "ID" | Exporter == "IT" | Exporter == "US"
         | Exporter == "FR" | Exporter == "DE" | Exporter == "EC" | Exporter == "AU" | Exporter == "TH"| Exporter== "ZA")


Exporterplot2 <- ggplot(ExporterData, aes(x=Exporter))+ 
  geom_bar(binwidth=50, colour="blue", fill="light blue", alpha=0.3)
Exporterplot2

#Which Classes get poached most often? 


Classplot <- ggplot(CITES2016_Processed, aes(x=Class ))+ 
  geom_bar(aes(fill=Class))+
  labs(title = "Classes of poaching occurances 2016",
       x = "Class",
       y = "Count") +
  coord_flip()

Classplot 

#This has a lot of NAs perhaps they didn't record always the Class 

#Which Taxons get poached most often? 





