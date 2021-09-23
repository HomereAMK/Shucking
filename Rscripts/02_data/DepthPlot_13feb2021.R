rm(list=ls())
setwd(dir = "Desktop/Scripts/Shucking/Rscripts/")
library(tidyverse)

#Load depth csv
#df <- read_csv('depthPilotLib1.csv')
df<-read_delim("Rscripts/02_data/merged_lib1_2.csv", delim = ",")

dfé <- select(df, bamfile, mean_depth, proportion_of_reference_covered) 

#remove path bamfile
dfé$bamfile=sub(".bam","",dfé$bamfile)
dfé
dfé$bamfile=sub(".+/","",dfé$bamfile)
length(dfé$bamfile)
dfé$bamfile
dfé$bamfile=sub(".depth.gz","",dfé$bamfile)
length(dfé$bamfile)
dfé$bamfile

summary(dfé)


##########
ggplot(data = dfé) + 
  geom_point(mapping = aes(x = bamfile, y = proportion_of_reference_covered, color = bamfile)) 

ggplot(data = dfé) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, file = bamfile))


####### Add pop column 
dfyes <- dfé %>% add_column(pop=substr(dfé$bamfile,0,4))
write.csv(dfyes, file = "Table_depthStats_Lib1_2.csv") #change path
write.table(dfyes, "Table_depthStats_Lib1_2.csv", sep="\t") #change path
library(DT)
library(glue)
library(tidyverse)
package_names <- tidyverse:::core
datatable(
  dfyes, 
  options = list(pageLength = 100)
)
saveWidget(dfyes, "Table_depthStats_Lib1_2.html") #change path


##############
library(RColorBrewer)
# Define the number of colors you want
nb.cols <- 18
mycolors <- colorRampPalette(brewer.pal(8, "Set3"))(nb.cols)
# Create a ggplot with 18 colors 
# Use scale_fill_manual
p3 <-ggplot(dfyes) + 
  geom_col(mapping=aes(x=bamfile, y=mean_depth, fill = pop) +
             scale_fill_manual(values = mycolors) +
             theme_minimal() +
             theme(legend.position = "top"))
p3






###### % ref covered
p <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, fill = pop))
  #axis.text.x = element_blank()
p + theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())
p + scale_y_continuous(name="Proportion of flat oyster genome covered", limits=c(0, 1))
p+ theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())
###### mean depth1
p2 <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = mean_depth, fill = pop))
#axis.text.x = element_blank()
p2 + theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())





#################################PILOTSEQ+LIB1########################################
#Load depth csv
#df <- read_csv('Computerom/depthPilotLib1.csv')

dfé <- select(df, bamfile, mean_depth, proportion_of_reference_covered) 

#remove path bamfile
dfé$bamfile=sub(".bam","",dfé$bamfile)
dfé
dfé$bamfile=sub(".+/","",dfé$bamfile)
length(dfé$bamfile)
dfé$bamfile
dfé$bamfile=sub(".depth.gz","",dfé$bamfile)
length(dfé$bamfile)
dfé$bamfile

summary(dfé)

##########
ggplot(data = dfé) + 
  geom_point(mapping = aes(x = bamfile, y = proportion_of_reference_covered, color = bamfile)) 

ggplot(data = dfé) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, file = bamfile))





#############################LIB1 AND 2 7septembre2021####################################
setwd("~/Desktop/Scripts/Shucking/Rscripts")
####### Add pop column 
dfyes <- dfé %>% add_column(pop=substr(dfé$bamfile,0,4))  #first 4 letters = name pop

###### % ref covered
p <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, fill = pop))
p
##########################
Prop<-p+labs(x = " samples", y = "Proportion of flat oyster genome covered")+
 theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
ggsave(filename = "Prop_genomeCoveredLib1and2_sep21.png")
# Add horizontal line at mean y = 0.61596
Prop + geom_hline(yintercept=0.61596, color="red")
ggsave(filename = "Prop_genomeCoveredLib1and2_sep21.png")

###### mean depth1
p2 <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = mean_depth, fill = pop))
p2
MeanD<-p2+labs(x = " samples", y = "Mean depth")+
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
MeanD
ggsave(filename = "MeanDepthLib1and2_sep21.png")

summary(dfyes)
# Add horizontal line at y = 1.2088
MeanD + geom_hline(yintercept=1.41763, color="red")
ggsave(filename = "MeanDepthLib1and2_sep21.png")
