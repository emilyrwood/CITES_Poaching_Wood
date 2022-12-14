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
require(ggplot2)

Classplot1 <- ggplot(CITES2016_Processed, aes(x=Class ))+ 
  geom_bar(aes(fill=Class))+
  labs(title = "Classes of poaching occurances 2016",
       x = "Class",
       y = "Count") +
  coord_flip()

Classplot1 


#This has a lot of NAs perhaps they didn't record always the Class 
#Faceted by appendix 

Classplot2 <- ggplot(CITES2016_Processed, aes(x=Class ))+ 
  geom_bar(aes(fill=Class))+
  labs(title = "Classes of poaching occurances 2016",
       x = "Class",
       y = "Count") +
  coord_flip()+
  facet_grid(rows = "Appendix")+
  theme(axis.text = element_text(size = 5))
Classplot2 

#create a facet dataset for Appendix I

AppendixI_Facet <- CITES2016_Processed %>%
                    filter(Appendix == "I")


#A closer look at Mammalia 

Mammalia_terms <- ggplot(subset(AppendixI_Facet, Class %in% "Mammalia"), aes(x = Term)) + 
  geom_bar(aes(fill= Term)) +
  coord_flip() +
  theme(axis.text = element_text(size = 5),
      legend.key.size = unit(.2, 'cm'),
      legend.key.height = unit(.2, 'cm'), 
      legend.key.width = unit(.2, 'cm'),
      legend.title = element_text(size=3), 
      legend.text = element_text(size=3))

Mammalia_terms

#A closer look at Aves 

Aves_terms <- ggplot(subset(AppendixI_Facet, Class %in% "Aves"), aes(x = Term)) + 
  geom_bar(aes(fill= Term)) +
  coord_flip() +
  theme(axis.text = element_text(size = 5),
        legend.key.size = unit(.2, 'cm'),
        legend.key.height = unit(.2, 'cm'), 
        legend.key.width = unit(.2, 'cm'),
        legend.title = element_text(size=3), 
        legend.text = element_text(size=3))

Aves_terms

#A closer look at Reptilia

Reptilia_terms <- ggplot(subset(AppendixI_Facet, Class %in% "Reptilia"), aes(x = Term)) + 
  geom_bar(aes(fill= Term)) +
  coord_flip() +
  theme(axis.text = element_text(size = 5),
        legend.key.size = unit(.2, 'cm'),
        legend.key.height = unit(.2, 'cm'), 
        legend.key.width = unit(.2, 'cm'),
        legend.title = element_text(size=3), 
        legend.text = element_text(size=3))

Reptilia_terms

#Why arent plants represented in Class? monocotyledons or dicotyledons not depicted so potentiall in NAs

AppendixI_Facet["Class"][is.na(AppendixI_Facet["Class"])] <- "Not_recorded"
 
NA_terms <- ggplot(subset(AppendixI_Facet, Class %in% "Not_recorded"), aes(x = Term)) + 
  geom_bar(aes(fill= Term)) +
  coord_flip() +
  theme(axis.text = element_text(size = 5),
        legend.key.size = unit(.2, 'cm'),
        legend.key.height = unit(.2, 'cm'), 
        legend.key.width = unit(.2, 'cm'),
        legend.title = element_text(size=3), 
        legend.text = element_text(size=3))

NA_terms
