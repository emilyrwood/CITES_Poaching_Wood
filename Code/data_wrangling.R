#Data Wrangling
#Goal: cleaning the raw dataset into a format compatible


#Remove Null Values and combine Export and Import amounts into a total reported quantity column 

CITESPoaching2016["Importer_reported_quantity"][is.na(CITESPoaching2016["Importer_reported_quantity"])] <- 0

CITESPoaching2016["Exporter_reported_quantity"][is.na(CITESPoaching2016["Exporter_reported_quantity"])] <- 0

CITESPoaching2016$Reported_quantity <- CITESPoaching2016$Importer_reported_quantity + CITESPoaching2016$Exporter_reported_quantity 

#Limit dataset to poaching occurrence measured by count not by weight. 
#I'm choosing count because the majority of cases are recorded in count not weight. 
#Select relevant columns 

CITESPoaching2016["Unit"][is.na(CITESPoaching2016["Unit"])] <- "Count"

str_count(CITESPoaching2016$Unit) 

CITES2016_Processed<-CITESPoaching2016 %>%
                    filter(Unit == "Count") %>%
                    select(Year, Appendix, Class, Genus, 
                           Importer, Exporter, Importer_reported_quantity, 
                           Exporter_reported_quantity, Term, Purpose, Reported_quantity)  %>%
                     group_by(Appendix)

#Save the processed dataframe to processed folder 

write.csv(CITES2016_Processed, row.names = FALSE, file = "./Data_Processed/CITES2016_Processed.csv")

