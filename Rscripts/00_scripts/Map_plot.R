################################################# SCANDINAVIA
#code color 27 sep 2021
#"Norway" ="#364B9A",
#"Sweden"="#4A7BB7",    
#"Scotland"="#6EA6CD",
#"Ireland"="#98CAE1",
#"Denmark"="#C2E4EF",
#"Netherlands"="darkseagreen4"
#"England"="#FEDA8B",
#"France"="#FDB366",
#"Spain"= "#F67E4B",
#"Croatia"="#DD3D2D",
#"Corsica"= "#A50026",
#"USA"="red", #to change
#"Lurida"="black"
#Sardignia= ?
#Italia(Ancona)= ?
rm(list=ls(all.names = TRUE))

#devtools::install_github("MikkoVihtakari/ggOceanMapsData") # required by ggOceanMaps
#devtools::install_github("MikkoVihtakari/ggOceanMaps")

library(ggOceanMaps)
library(ggOceanMapsData)
library(ggOceanMaps)
library(tidyverse)
library(ggthemes)
library(RColorBrewer)
library(ggrepel)

dt <- read.csv("~/Desktop/Scripts/Shucking/01_infofiles/Master_list_pop.csv"
               , header = TRUE)
dt$lon <-as.numeric(dt$lon)
dt$lat <-as.numeric(dt$lat)
str(dt)
dt
dt_scand <- dt[c(4:8,16:24,31:45),]


#tiff("~/Documents/Campaign_sampling2021/R_map/02_results/Scandinavia27sep2021_bycountry.tiff",width = 7, height = 7,units = 'in', res = 600 )

Scand_map_loc2 <- basemap(limits = c(4, 14, 56, 63),glaciers = FALSE, 
                          bathymetry = FALSE, 
                          legends = FALSE,
                          land.col = "#eeeac4") +
  annotation_scale(location = "br") + 
  annotation_north_arrow(location = "tr",which_north = "true") +
  labs(x = NULL, y = NULL) +
  geom_point(data = transform_coord(dt_scand), 
             aes(x = lon, y = lat, colour=dt_scand$Country),size=5, 
             shape=20, alpha = 0.9) +
  scale_colour_manual(values =c("#C2E4EF","#364B9A","#4A7BB7"))+
  geom_text_repel(data = transform_coord(dt_scand), 
                  aes(x = lon, y = lat,label=dt_scand$Locality),
                  seed = 333333,
                  size=3,
                  fontface=3,
                  nudge_x = .15,
                  force_pull = 0.5,
                  box.padding = 0.5,
                  point.padding = 0.25,
                  segment.curvature = -0.1,
                  segment.ncp = 10,
                  segment.square    = FALSE,
                  segment.inflect   = TRUE,
                  segment.angle = 20,
                  max.overlaps = Inf,
                  segment.color = 'grey50',
  )+ 
  theme(legend.title = element_blank())

Scand_map_loc2
last_plot()
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Scandinavia28sep2021_13x9.png", width = 13, height = 9, dpi=300)

dev.off()





#########EUROPE
rm(list=ls(all.names = TRUE))

#devtools::install_github("MikkoVihtakari/ggOceanMapsData") # required by ggOceanMaps
#devtools::install_github("MikkoVihtakari/ggOceanMaps")

library(ggOceanMaps)
library(ggOceanMapsData)
library(ggOceanMaps)
library(tidyverse)
library(ggthemes)
library(RColorBrewer)
library(ggrepel)

dt <- read.csv("~/Desktop/Scripts/Shucking/01_infofiles/Master_list_pop.csv", header=TRUE)
dt$lon <-as.numeric(dt$lon)
dt$lat <-as.numeric(dt$lat)
dt <- dt[-46,] #remove USA pop
#dt <- [,-7]
str(dt)

unique(dt$Country)

Noscand <- dt %>%
  filter(Country %in% c("Croatia",   "England",     "Corsica",    "France",    
                        "Netherlands",   "Scotland",  "Ireland"  , "Spain"  ))

cols <- c("Croatia" = "#DD3D2D",  "England" = "#FEDA8B", "Corsica"  = "#A50026", "France"="#FDB366", 
          "Netherlands"="darkseagreen4" ,"Scotland"="#6EA6CD","Spain"= "#F67E4B",  "Ireland"="#98CAE1", 
          "Denmark" = "#C2E4EF", "Sweden" ="#4A7BB7" ,"Norway" ="#364B9A")

Europe <- basemap(limits = c(-12, 20, 36, 73),glaciers = FALSE, 
                  bathymetry = FALSE,
                  legends = FALSE,
                  land.col = "#eeeac4") + 
  annotation_scale(location = "br") + 
  labs(x = NULL, y = NULL) +
  geom_point(data = transform_coord(dt), position = "jitter",
             aes(x = lon, y = lat, colour=dt$Country),size=5, 
             shape=20, alpha = 0.85)+
  geom_label_repel(data = transform_coord(Noscand), 
                   aes(x = lon, y = lat,label=Noscand$Locality),
                   seed = 333333,
                   size=3,
                   fontface=1,
                   nudge_x = .15,
                   force_pull = 0.5,
                   box.padding = 0.5,
                   point.padding = 0.25,
                   segment.curvature = -0.1,
                   segment.ncp = 10,
                   segment.square    = FALSE,
                   segment.inflect   = TRUE,
                   segment.angle = 0,
                   max.overlaps = Inf,
                   segment.color = 'grey50',
  )+ 
  theme(legend.title  = element_blank())+
  scale_colour_manual(values = cols)
Europe
last_plot()
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Europe_28sep2021.png" , width = 13, height = 9, dpi=300)
dev.off()