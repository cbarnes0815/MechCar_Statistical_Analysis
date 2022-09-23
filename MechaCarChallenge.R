library (dplyr)

#Linear Regression to predict mpg

# Read the MechaCar_mpg.csv
MechaCar_table<- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# Generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_table)

# Generate Summary Statistics for Linear Regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_table))

# Summary Statistics for Suspension Coils

#Read Susupension_Coil.csv
SCoil_table <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors=F)

#Total Summary stats
total_summary = SCoil_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Summary Stats grouped on Manufacturing_Lot
lot_summary = SCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#T-TESTS on Suspension Coils

# t-tests across all lots
t.test(SCoil_table$PSI, mu=1500)

# t-test for Lot 1
t.test(subset(SCoil_table$PSI, SCoil_table$Manufacturing_Lot == 'Lot1'), mu=1500)

# t-test for Lot 2
t.test(subset(SCoil_table$PSI, SCoil_table$Manufacturing_Lot == 'Lot2'), mu=1500)

# t-test for Lot 3
t.test(subset(SCoil_table$PSI, SCoil_table$Manufacturing_Lot == 'Lot3'), mu=1500)
