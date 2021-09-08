
#Clean space
rm(list=ls())


#
library(Rserve)
library(tidyverse)

#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.RIAE.depth"))

for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.RIAE.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.RIAE.Lib2.csv")

#Clean space
rm(list=ls())


#
library(Rserve)
library(tidyverse)

#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.SVAL.depth"))

for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.SVAL.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.SVAL.Lib2.csv")

  


  
#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.SYDK.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.SYDK.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.SYDK.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.TOLL.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.TOLL.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.TOLL.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.SYDK.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.SYDK.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.SYDK.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.VADE.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.VADE.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.VADE.Lib2.csv")

#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.VAGS.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.VAGS.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.VAGS.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.VENO.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.VENO.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.VENO.Lib2.csv")


#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.WADD.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.WADD.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.WADD.Lib2.csv")

  



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.ZECE.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.ZECE.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.ZECE.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.WADD.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.WADD.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.WADD.Lib2.csv")

  



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.AGAB.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.AGAB.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.AGAB.Lib2.csv")


  #Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.BARR.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.BARR.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.BARR.Lib2.csv")




#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.NISS.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.NISS.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.NISS.Lib2.csv")


 #Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.PONT.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.PONT.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.PONT.Lib2.csv")


#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.RAMS.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.RAMS.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.RAMS.Lib2.csv")

#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.RIAE.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.RIAE.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.RIAE.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.COLN.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.COLN.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.COLN.Lib2.csv")

  #Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.CORS.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.CORS.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.CORS.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.COLN.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.COLN.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.COLN.Lib2.csv")

  #Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.HFJO.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.HFJO.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.HFJO.Lib2.csv")


#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.CRES.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.CRES.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.CRES.Lib2.csv")


#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.FURI.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.FURI.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.FURI.Lib2.csv")




#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.GASO.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.GASO.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.GASO.Lib2.csv")





#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.GREV.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.GREV.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.GREV.Lib2.csv")


#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.HAFR.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.HAFR.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.HAFR.Lib2.csv")





#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.GREV.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.GREV.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.GREV.Lib2.csv")


#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.HAUG.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.HAUG.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.HAUG.Lib2.csv")




#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.HAVS.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.HAVS.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.HAVS.Lib2.csv")

#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.Havs.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.Havs.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.Havs.Lib2.csv")























#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.INNE.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.INNE.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.INNE.Lib2.csv")

#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.KALV.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.KALV.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.KALV.Lib2.csv")















#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.KLEV.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.KLEV.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.KLEV.Lib2.csv")

#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.LILL.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.LILL.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.LILL.Lib2.csv")



#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.NELL.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.NELL.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.NELL.Lib2.csv")





#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.BOVA.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.BOVA.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.BOVA.Lib2.csv")






































































#Clean space
rm(list=ls())
#
library(Rserve)
library(tidyverse)
#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.HAVS.depth"))
for (i in 1:length(bam_list)){

  bamfile = bam_list[i]
  # Compute depth stats
  depth <- read_tsv(paste0(bamfile), col_names = F)$X1
  mean_depth <- mean(depth)
  sd_depth <- sd(depth)
  mean_depth_nonzero <- mean(depth[depth > 0])
  mean_depth_within2sd <- mean(depth[depth < mean_depth + 2 * sd_depth])
  median <- median(depth)
  presence <- as.logical(depth)
  proportion_of_reference_covered <- mean(presence)

# Bind stats into dataframe and store sample-specific per base depth and presence data
  if (i==1){
    output <- data.frame(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered)
    total_depth <- depth
    total_presence <- presence
  } else {
    output <- rbind(output, cbind(bamfile, mean_depth, sd_depth, mean_depth_nonzero, mean_depth_within2sd, median, proportion_of_reference_covered))
    total_depth <- total_depth + depth
    total_presence <- total_presence + presence
  }
}
print(output)
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.HAVS.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.HAVS.Lib2.csv")












































































