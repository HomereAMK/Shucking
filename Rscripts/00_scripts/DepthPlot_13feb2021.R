#Clean space
rm(list=ls())
#setwd(dir = "Desktop/Sequencing_depth_lcWGS/")
library(tidyverse)

#Load depth csv
#df <- read_csv('depthPilotLib1.csv')
#df<-read_delim("Desktop/Scripts/Shucking/Rscripts/02_data/384_statsDepth.Lib2.csv", delim = ";")
df<-read_csv("Desktop/Scripts/Shucking/Rscripts/02_data/384_statsDepth.Lib2.csv")
dfé <- select(df, bamfile, mean_depth, proportion_of_reference_covered) 

#remove path bamfile
dfé$bamfile=sub(".bam","",dfé$bamfile)
dfé
dfé$bamfile=sub(".+/","",dfé$bamfile)
length(dfé$bamfile)
dfé$bamfile
dfé$bamfile=sub(".depth.gz","",dfé$bamfile)
length(dfé$bamfile)
#pop=substr(dfé$bamfile,0,3) #name only 3characters -> works for Lib2
summary(dfé)

#dfé <- cbind(dfé, pop)

##########
#ggplot(data = dfé) + 
#  geom_point(mapping = aes(x = bamfile, y = proportion_of_reference_covered, color = bamfile)) 

#ggplot(data = dfé) + 
#  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, file = bamfile))


####### Add pop column 
dfyes <- dfé %>% add_column(pop=substr(dfé$bamfile,0,3))
write.csv(dfyes, file = "Desktop/Scripts/Shucking/Rscripts/03_results/Table_sequencing_Lib2andPilot.csv")
#write.table(dfyes, "Table_sequencing_Lib1andPilot.txt", sep="\t")
library(DT)
library(glue)
library(tidyverse)
package_names <- tidyverse:::core
datatable(
  dfyes, 
  options = list(pageLength = 100)
)
saveWidget(dfyes, "Desktop/Scripts/Shucking/Rscripts/03_results/Table_Lib2.stats.Depth.html")


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



###subset
Nor_lib2 <- dfyes %>%
  filter(pop %in% c("AGA",   "HAF",     "HAU",    "INN",    
                        "LAN",   "OST",  "VAG"  ))
####TRY-0ut
###### % ref covered
p <-  ggplot(data = Nor_lib2) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, fill = pop))
#axis.text.x = element_blank()
p + theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())
p + scale_y_continuous(name="Proportion of flat oyster genome covered", limits=c(0, 1))
p+ theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())
###### mean depth1
p2 <-  ggplot(data = Nor_lib2) + 
  geom_col(mapping = aes(x = bamfile, y = mean_depth, fill = bamfile))
#axis.text.x = element_blank()
p2 + theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())




#####FINAL PLOTS
###### % ref covered
p <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, fill = pop))
p

summary(dfyes) # to get the yintercept for Mean_depth plot and prop_genom_cov
##########################
Prop<-p+labs(x = " samples", y = "Proportion of flat oyster genome covered")+
 theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
Prop + geom_hline(yintercept=0.62864, color="red")
ggsave(filename = "Desktop/Scripts/Shucking/Rscripts/03_results/Prop_genomeCoveredLib2.png") #change path
# Add horizontal line at mean y = 0.5761

###### mean depth1
p2 <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = mean_depth, fill = pop))
p2
MeanD<-p2+labs(x = " samples", y = "Mean depth")+
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
MeanD
summary(dfyes)
# Add horizontal line at y = 1.2088
MeanD <-MeanD + geom_hline(yintercept=1.48776, color="red")
ggsave(filename = "Desktop/Scripts/Shucking/Rscripts/03_results/MeanDepthLib2.png") #change path
MeanD
ggsave(filename = "Desktop/Scripts/Shucking/Rscripts/03_results/MeanDepthLib2.png") #change path


#remove all ind below 30% Mean Depth or/and % genome covered
df_30per<- dfé %>% filter_all(any_vars(is.numeric(.) & . > 0.3))
df_30per
summary(df_30per)
write.csv(df_30per$bamfile, file = "Desktop/Scripts/Shucking/Rscripts/03_results/above30Lib2_bamfile.csv")
