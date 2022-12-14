#Data Processing 
#Goal:  data cleaning, integration, transformation, and reduction

CITESPoaching2016 <- read_csv("/home/guest/EDA_2022/EDA-Fall2022/Project/comptab_2018-01-29 16_00_comma_separated.csv")


# Replace codes with labels for 'Purpose" column. 

CITESPoaching2016$Purpose <- ifelse (CITESPoaching2016$Purpose=="B", "Breeding",
                             ifelse ( CITESPoaching2016$Purpose=="E", "Educational",
                             ifelse ( CITESPoaching2016$Purpose=="G", "Garden",
                             ifelse ( CITESPoaching2016$Purpose=="H", "Hunting",
                             ifelse ( CITESPoaching2016$Purpose=="L", "Law",
                             ifelse ( CITESPoaching2016$Purpose=="M", "Medical",
                             ifelse ( CITESPoaching2016$Purpose=="R", "Reintroduction",
                             ifelse ( CITESPoaching2016$Purpose=="P", "Personal",
                             ifelse ( CITESPoaching2016$Purpose=="Q", "Circus",
                             ifelse ( CITESPoaching2016$Purpose=="S", "Scientific",
                             ifelse ( CITESPoaching2016$Purpose=="T", "Commercial",
                             ifelse ( CITESPoaching2016$Purpose=="Z", "Zoo",
                             "Unknown"))))))))))))

#rename some of the columns

colnames(CITESPoaching2016)[which(names(CITESPoaching2016) == "Importer reported quantity")] <- "Importer_reported_quantity"

colnames(CITESPoaching2016)[which(names(CITESPoaching2016) == "Exporter reported quantity")] <- "Exporter_reported_quantity"

colnames(CITESPoaching2016)[which(names(CITESPoaching2016) == "App.")] <- "Appendix"



