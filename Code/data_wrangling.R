#Data Wrangling
#Goal: cleaning the raw dataset into a format compatible

#rename some of the columns

colnames(CITESPoaching2016)[which(names(CITESPoaching2016) == "Importer reported quantity")] <- "Importer_reported_quantity"

colnames(CITESPoaching2016)[which(names(CITESPoaching2016) == "Exporter reported quantity")] <- "Exporter_reported_quantity"

colnames(CITESPoaching2016)[which(names(CITESPoaching2016) == "App.")] <- "App"

#Remove Null Values and combine Export and Import amounts into a total reported quantity column 

CITESPoaching2016["Importer_reported_quantity"][is.na(CITESPoaching2016["Importer_reported_quantity"])] <- 0

CITESPoaching2016["Exporter_reported_quantity"][is.na(CITESPoaching2016["Exporter_reported_quantity"])] <- 0

CITESPoaching2016$Reported_quantity <- CITESPoaching2016$Importer_reported_quantity + CITESPoaching2016$Exporter_reported_quantity 