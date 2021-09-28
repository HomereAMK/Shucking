################################################# SCANDINAVIA
#code color 27 sep 2021
#norway="#364B9A"
#Sweden="#4A7BB7"
#Denmark="#C2E4EF"
#Croatia="#DD3D2D"
#England="#FEDA8B"
#Corsica="#A50026"
#France="#FDB366"
#"Netherlands"="darkseagreen4"
#"Scotland"=

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

COUNTRY <- dt_scand$Country


Scand_map_loc <- basemap(limits = c(4, 13, 55, 63),glaciers = FALSE, 
                         bathymetry = TRUE, bathy.style = "poly_greys",
                         legends = FALSE,
                         land.col = "#eeeac4") +
                  annotation_scale(location = "br") + 
                  annotation_north_arrow(location = "tr",which_north = "true") +
                  labs(x = NULL, y = NULL) +
                  geom_point(transform_coord(dt_scand), 
                             aes(lon, lat, color=Country),size=4, 
                             shape=20, alpha = 0.6) +
                scale_colour_manual(values =c("#C2E4EF","#364B9A","#4A7BB7")+
                geom_text(data = transform_coord(dt_scand)+
                          aes(x = lon, y = lat,label=dt_scand$Locality),hjust=0, vjust=0))

#tiff("~/Documents/Campaign_sampling2021/R_map/02_results/Scandinavia27sep2021_bycountry.tiff",width = 7, height = 7,units = 'in', res = 600 )
Scand_map_loc2 <- basemap(limits = c(4, 13, 55, 63),glaciers = FALSE, 
                          bathymetry = FALSE, 
                          legends = FALSE,
                          land.col = "#eeeac4") +
                    annotation_scale(location = "br") + 
                     annotation_north_arrow(location = "tr",which_north = "true") +
                   labs(x = NULL, y = NULL) +
              geom_point(data = transform_coord(dt_scand), 
                    aes(x = lon, y = lat, colour=COUNTRY),size=6, 
                    shape=20, alpha = 0.8) +
                scale_colour_manual(values =c("#C2E4EF","#364B9A","#4A7BB7"))+
                geom_text_repel(data = transform_coord(dt_scand), 
                          aes(x = lon, y = lat,label=dt_scand$Locality),
                          size=2,
                          fontface=3,
                          box.padding = 0.5,
                          point.padding = 0.5,
                          nudge_y = 1,
                          segment.curvature = -0.1,
                          segment.ncp = 3,
                          segment.angle = 60,
                          max.overlaps = Inf,
                          segment.color = 'grey50',
                          )+ 
                theme(legend.title = element_blank())

Scand_map_loc2
last_plot()
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Scandinavia27sep2021_bycountry.pdf")
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Scandinavia27sep2021_bycountry.png", width = 14, height = 14)
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Scandinavia27sep2021_bycountry.pdf", width = 14, height = 14 )
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

COUNTRY<-dt$Country
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
             aes(x = lon, y = lat, colour=dt$Country),size=6, 
             shape=20, alpha = 0.6)+
  
  geom_label_repel(data = transform_coord(Noscand), 
                   aes(x = lon, y = lat,label=Noscand$Locality),
                   size=3,
                   fontface=1,
                   force = 3,
                   force_pull=6,
                   nudge_x= 1,
                   box.padding = 0.5,
                   point.padding = 0.5,
                   segment.curvature = 2,
                   segment.ncp = 2,
                   segment.angle = 20,
                   max.overlaps = Inf,
                   segment.color = 'grey50',)+ 
  theme(legend.title  = element_blank())+
  scale_colour_manual(values = cols)
Europe
Europe
last_plot()
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Europe_sep2021_bycountry.pdf")
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Europe_27sep2021_bycountry_14_14.png", width = 14, height = 14)
ggsave(file = "~/Documents/Campaign_sampling2021/R_map/02_results/Europe_27sep2021_bycountry_14_14.pdf", width = 14, height = 14 )
dev.off()