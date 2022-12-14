#Data Analysis 

#Linear modeling 

#1.How Does Reported Poaching Quantity vary over Class and Term for only Appendix 1.

Poaching.2way <- aov(data = AppendixI_Facet, Reported_quantity ~ Class + Term)
summary(Poaching.2way)

#P-value is small. Reject our null hypothesis that the mean across our groups is different. 
#Not enough information to tell us which groups are differing

Poaching.2way2lm <- lm(data = AppendixI_Facet, Reported_quantity ~ Class + Term)
summary(Poaching.2way2lm)

#means are different. Reject null 

TukeyHSD(Poaching.2way)

#check interaction between the variables 

Poaching.2way3 <- aov(data = CITES2016_Processed, Reported_quantity ~ Class * Appendix)
summary(Poaching.2way3)

#Interaction is not significant between variables




#2. How Does Reported Poaching Quantity vary over Class and Appendix for entire data

Poaching.2way.test <- aov(data = CITES2016_Processed, Reported_quantity ~ Class + Appendix)
summary(Poaching.2way.test)

#P-value is small. Reject our null hypothesis that the mean across our groups is different. 
#Not enough information to tell us which groups are differing

Poaching.2way2lm.test <- lm(data = CITES2016_Processed, Reported_quantity ~ Class + Appendix)
summary(Poaching.2way2lm.test)

#means are different. Reject null 

TukeyHSD(Poaching.2way.test)

#check interaction between the variables 

Poaching.2way3 <- aov(data = CITES2016_Processed, Reported_quantity ~ Class * Appendix)
summary(Poaching.2way3)

#significant because the pvalue is <2e-16 

TukeyHSD(Poaching.2way3) 

Poaching.interaction <- with(CITES2016_Processed, interaction(Class, Appendix))

Poaching.anova.2way5 <- aov(data = CITES2016_Processed, Reported_quantity ~ Poaching.interaction)

Poaching.groups <- HSD.test(Poaching.anova.2way5, "Poaching.interaction", group = TRUE)
Poaching.groups

# Plot the results
# Edit this graph to make it more visually appealing.
# Add letters to represent statistical groupings.
Poaching.anova.plot <- ggplot(CITES2016_Processed, aes(y = Reported_quantity, x = Class, color = Appendix )) +
  geom_boxplot()
print(Poaching.anova.plot)

