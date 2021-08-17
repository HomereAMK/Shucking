#Clean space
rm(list=ls())


#
library(Rserve)
library(tidyverse)

#var
basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/list.SVALL.depth"))

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
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output.SVALL.Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.SVALL.csv")



