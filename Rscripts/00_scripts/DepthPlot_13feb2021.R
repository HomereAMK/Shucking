#Clean space
rm(list=ls())
#setwd(dir = "Desktop/Sequencing_depth_lcWGS/")
library(tidyverse)

#Load depth csv
#df <- read_csv('depthPilotLib1.csv')
#df<-read_delim("Desktop/Scripts/Shucking/Rscripts/02_data/384_statsDepth.Lib2.csv", delim = ";")
df<-read_csv("~/Desktop/Scripts/Shucking/Rscripts/02_data/Lib4_depth_1dec21.csv")
dfé <- select(df, bamfile, mean_depth, proportion_of_reference_covered) 
list<-read_csv("~/Desktop/Scripts/Shucking/01_infofiles/Master_list_pop.csv")
unique(list$Tag)

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
dfyes <- dfé %>% add_column(pop=substr(dfé$bamfile,0,4))
write.csv(dfyes, file = "~/Desktop/Scripts/Shucking/Rscripts/03_results/Table_sequencing_Lib4_1dec21.csv")
#write.table(dfyes, "Table_sequencing_Lib1andPilot.txt", sep="\t")
library(DT)
library(glue)
library(tidyverse)
package_names <- tidyverse:::core
datatable(
  dfyes, 
  options = list(pageLength = 100)
)
saveWidget(dfyes, "~/Desktop/Scripts/Shucking/Rscripts/03_results/Table_Lib4.1dec21.stats.Depth.html")


############## Color ############## 
library(RColorBrewer)
# Define the number of colors you want
library(RColorBrewer)
n <- 60
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))
col <- col_vector[sample(1:50)]







###### % ref covered ###### 
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



###SCANDINAVIA
Norway,Innerøyen_lagoon,5.409845737,60.17063094,darkblue,Cultured,INNE
Norway,Haugevågen,5.190326,59.290170,darkblue,Wild,HAUG
Norway,Hafrsfjord,5.662765418,58.93247195,darkblue,Wild,HAFR
Norway,Aga_Bømlo,5.242439352,59.84047175,darkblue,Cultured,AGAB
Norway,Ostrevigtjønn_Hauge_I_Dalane,6.250541688,58.32230603,darkblue,Cultured,OSTR
Norway,Vågstranda,7.167058078,62.615043,darkblue,NA,VAGS
Norway,Langesand_Sørlandsleia,8.954965771,58.62348802,darkblue,Wild,LANG
Norway,Bunnefjorden_Oslofjord,10.7245,59.7474,darkblue,Wild,BUNN
Norway,Dolvågskiten_Agder,8.14725640611987,58.129163479886486,darkblue,Wild,DOLV
Sweden,Kalvö,11.14794005,58.76564257,deepskyblue3,Wild,KALV
Sweden,Klevkilen,11.28639,58.37366,deepskyblue3,Cultured,KLEV
Sweden,Svallhagen_Tjärnö,11.15399,58.86836,deepskyblue3,Wild,SVAL
Sweden,Sydkoster,11.04764,58.89518,deepskyblue3,Cultured,SYDK
Sweden,Väderöarna,11.06491,58.58228,deepskyblue3,Wild,VADE
Sweden,Gåsö_N,11.40287,58.24189,deepskyblue3,Wild,GASO
Sweden,Halsefjord,11.77585,58.12099,deepskyblue3,Wild,HFJO
Sweden,Ramsholmen,11.05228,58.85028,deepskyblue3,Wild,RAMS
Sweden,Lilla_Tenholmen,10.99123,58.88207,deepskyblue3,Wild,LILL
Sweden,Bovallstrand,11.31499,58.48281,deepskyblue3,Wild,BOVA
Sweden,Örnevik,11.31673,58.38378,deepskyblue3,Wild,ORNE
Sweden,Havstensund,11.16155,58.76366,deepskyblue3,Wild,HAVS
Sweden,Havstensund(Hatchery_broodstock),11.16155,58.76366,deepskyblue3,Cultured,Havs
Sweden,Hyppeln_GothenburgArchipelago,11.6169,57.7632,deepskyblue3,Cultured,HYPP
Sweden,Hallands_Väderö,11.6169,57.7632,deepskyblue3,Wild,HVAD
Denmark,Venø._Station_5,8.688497442,56.52527582,seagreen,Wild,VENO
Denmark,Nissum_Station_1,8.333110177,56.62974821,seagreen,Wild,NISS
Denmark,Fur,9.013793907,56.84438203,seagreen,Wild,FURI
Denmark,Løgstør,9.140570528,56.97357973,seagreen,Wild,LOGS
Denmark,Hals,10.36706482352431,57.004718683560434,seagreen,Wild,HALS
Denmark,Thisted,8.694316983439798,56.94912297297896,seagreen,Wild,THIS

#NOrway
Norway <- dfyes %>%
  filter(pop %in% c("INNE",   "HAUG",     "HAFR",    "AGAB",    
                        "OSTR",   "VAGS",  "LANG",
                    "BUNN", "DOLV" ))
####TRY-0ut
###### % ref covered
p <-  ggplot(data = Norway) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, fill = pop))
#axis.text.x = element_blank()
p + theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())
p + scale_y_continuous(name="Proportion of flat oyster genome covered", limits=c(0, 1))
p+ theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())
###### mean depth1
p2 <-  ggplot(data = Norway) + 
  geom_col(mapping = aes(x = bamfile, y = mean_depth, fill = bamfile))
#axis.text.x = element_blank()
p2 + theme(
  axis.text.x = element_blank(), axis.ticks.x = element_blank())




#####FINAL PLOTS#####
###### % ref covered
#remove duplicate rows
dfyes <-dfyes %>%  distinct()
#remove Lurida
dfyes <- dfyes %>%
  filter( ! str_detect(pop, "Luri") )
#first plot
p <-  ggplot(data = dfyes) + 
  geom_col(mapping = aes(x = bamfile, y = proportion_of_reference_covered, fill = pop))
summary(dfyes) # to get the yintercept for Mean_depth plot and prop_genom_cov
##########################
Prop<-p+labs(x = " samples", y = "Proportion of flat oyster genome covered")+
 theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())+
          geom_hline(yintercept=0.60511, color="red")+
          theme(legend.key = element_blank()) +
  theme(legend.title=element_blank()) +
  theme(axis.title.x = element_text(size = 10, color="#000000", face="bold", margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size = 10, color="#000000", face="bold", margin = margin(t = 0, r = 20, b = 0, l = 0))) +
  theme(legend.text=element_text(size=11)) +
  theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank()) +
  theme(axis.line = element_line(colour = "#000000", size = 0.3)) +
  theme(panel.border = element_blank())
Prop
ggsave(filename = "~/Desktop/Scripts/Shucking/Rscripts/03_results/Prop_genomeCoveredLib4_1dec21.pdf") #change path
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
MeanD <-MeanD + geom_hline(yintercept=1.38932, color="red")+
  theme(legend.title=element_blank()) +
  theme(axis.title.x = element_text(size = 10, color="#000000", face="bold", margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size = 10, color="#000000", face="bold", margin = margin(t = 0, r = 20, b = 0, l = 0))) +
  theme(legend.text=element_text(size=11)) +
  theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank()) +
  theme(axis.line = element_line(colour = "#000000", size = 0.3)) +
  theme(panel.border = element_blank())
MeanD
ggsave(filename = "Desktop/Scripts/Shucking/Rscripts/03_results/MeanDepthLib4_1dec21.png") #change path


#remove all ind below 30% Mean Depth or/and % genome covered
df_30per<- dfé %>% filter_all(any_vars(is.numeric(.) & . > 0.3))
df_30per
summary(df_30per)
write.csv(df_30per$bamfile, file = "Desktop/Scripts/Shucking/Rscripts/03_results/above30Lib4_bamfile_1dec21.csv")


#Badly sequenced samples
Bad<- dfé %>% filter_all(any_vars(is.numeric(.) & . < 0.3))
summary(Bad)
write.csv(Bad$bamfile, file = "Desktop/Scripts/Shucking/Rscripts/03_results/Bad_allLib4_bamfile_1dec21.csv")

