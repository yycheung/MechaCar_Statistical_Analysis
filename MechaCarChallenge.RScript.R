library(dplyr)
library(tidyverse)

# import MechaCar data
MechaCar_df <- read_csv(file = "Resources/data/MechaCar_mpg.csv")
MechaCar_df

# perform linear reqression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df)

# determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df))

# import Suspension_Coil data
Suspension_Coil_df <- read_csv(file = "Resources/data/Suspension_Coil.csv")
Suspension_Coil_df

# creates a total_summary dataframe
total_summary <- Suspension_Coil_df %>% summarize(Mean_PSI = mean(PSI),
                                                  Median_PSI = median(PSI),
                                                  Variance_PSI = var(PSI),
                                                  SD_PSI = sd(PSI),
                                                  .groups = 'keep' )
total_summary 

# creates a lot_summary dataframe
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean_lot = mean(PSI),
                                                                                Median_lot = median(PSI),
                                                                                Variance_lot = var(PSI),
                                                                                SD_lot = sd(PSI),
                                                                                .groups = 'keep')
lot_summary 

#box plot: PSI each Lot
plt_lot <- ggplot(Suspension_Coil_df,aes(x=Manufacturing_Lot,y=PSI)) 
pl_lot + geom_boxplot()
