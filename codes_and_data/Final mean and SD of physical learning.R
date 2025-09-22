#install package if not installed and set working directory if not set
install.packages("readxl")
setwd("C:/Users/USER/Downloads/SDI grp project") #put your file location

library(readxl)

# Read the data
dfPhysical <- read_excel(
  "Sample_Responses.xlsx",
  sheet = "Physical learning impact",
  range="A1:J39"
)

# Add row totals
dfPhysical$RowTotal <- rowSums(dfPhysical[ , ], na.rm = TRUE)

# Calculate the mean of the last column
mean_last_col <- mean(dfPhysical[[ncol(dfPhysical)]], na.rm = TRUE)
meanPhysical <- round(mean_last_col, 2)

#add new row to calc the SD
dfPhysical$SquaredDeviation <- (dfPhysical$RowTotal-meanPhysical)^2
dfPhysical$SquaredDeviation <- round(dfPhysical$SquaredDeviation,4)

#SD calc
sd_sum <- sum(dfPhysical[[ncol(dfPhysical)]], na.rm = TRUE)
variance <- sd_sum/(nrow(dfPhysical)-1)
sdPhysical <- sqrt(variance)
sdPhysical <- round(sdPhysical,2)

#print final calculations
cat("Final Mean for Physical Learning sample: ", meanPhysical, "\n")
cat("Final Standard Deviation for Physical Learning sample: ", sdPhysical)
