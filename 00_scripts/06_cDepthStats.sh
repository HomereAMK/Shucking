#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N depthstats__BASE__
#PBS -e 98_log_files/Covstat/depthstats__BASE__.err
#PBS -o 98_log_files/Covstat/depthstats__BASE__.out
#PBS -l nodes=2:ppn=18:thinnode
#PBS -l walltime=10:00:00
#PBS -l mem=300gb
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

# Load module angsd
module load tools
module load ngs
module load htslib/1.11
module load angsd/0.931

## Load modules FOR R AND NGSLD
module load gsl/2.6
module load perl/5.20.1
module load samtools/1.11
module load imagemagick/7.0.10-13
module load gdal/2.2.3
module load geos/3.8.0
module load jags/4.2.0
module load hdf5
module load netcdf
module load boost/1.74.0
module load openssl/1.0.0
module load lapack
module load udunits/2.2.26
module load proj/7.0.0
module load gcc/10.2.0
module load intel/perflibs/64/2020_update2
module load R/4.0.0
module load ngstools/20190624

#var
base=__BASE__

#
R

#Clean space
rm(list=ls())

#
library(tidyverse)

basedir <- "/home/projects/dp_00007/people/hmon/Shucking" # Make sure to edit this to match your $BASEDIR
bam_list <- read_lines(paste0(basedir, "/01_infofiles/"$base".depth"))

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
write_csv(output, path="/home/projects/dp_00007/people/hmon/Shucking/output_"$base"_Lib2.csv")  #change path
output2 <- output %>%
  mutate(across(where(is.numeric), round, 3))%>% 
  write_csv(output2, path = "samplespe_per_base_depth_presenceData_"$base".csv")

#load(file = "my_work_space_depth.RData")
  # Plot the depth distribution
tibble(total_depth = total_depth, position = 1:length(total_depth))  %>%
  ggplot(aes(x = position, y = total_depth)) +
  geom_point(size = 0.1)

ggsave(filename = "depth_distribution_plot_"$base".png")

# Total depth per site across all individuals 
total_depth_summary <- count(tibble(total_depth = total_depth), total_depth)
total_presence_summary <- count(tibble(total_presence = total_presence), total_presence)
total_depth_summary %>%
  ggplot(aes(x = log(total_depth), y = n)) +
  geom_point()
total_presence_summary %>%
  ggplot(aes(x = total_presence, y = n)) +
  geom_col()
ggsave(filename = "depth_persite_acrossind_plot_"$base".png") 

save.image(file = "my_work_space_depth_"$base".RData")