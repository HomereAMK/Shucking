#Clean space
rm(list=ls())

#
library(tidyverse)

basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/list_depth"))

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
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output_Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData.csv")

#load(file = "my_work_space_depth.RData")
  # Plot the depth distribution
tibble(total_depth = total_depth, position = 1:length(total_depth))  %>%
  ggplot(aes(x = position, y = total_depth)) +
  geom_point(size = 0.1)

ggsave(filename = "depth_distribution_plot.png")

# Total depth per site across all individuals 
total_depth_summary <- count(tibble(total_depth = total_depth), total_depth)
total_presence_summary <- count(tibble(total_presence = total_presence), total_presence)
total_depth_summary %>%
  ggplot(aes(x = log(total_depth), y = n)) +
  geom_point()
total_presence_summary %>%
  ggplot(aes(x = total_presence, y = n)) +
  geom_col()
ggsave(filename = "depth_persite_acrossind_plot.png") 

save.image(file = "my_work_space_depth.RData")
