#install package if not installed and set working directory if not set
install.packages("readxl")
setwd("C:/Users/USER/Downloads/SDI grp project") #put your file location

library(readxl)

# Read the data
df <- read_excel(
  "Sample_Responses.xlsx",
  sheet = "Physical learning impact",
  range="A1:J39"
)

# Add row totals
df$RowTotal <- rowSums(df[ , ], na.rm = TRUE)

# Calculate the mean of the last column
mean_last_col <- mean(df[[ncol(df)]], na.rm = TRUE)
meanPhysical <- round(mean_last_col, 2)

#add new row to calc the SD
df$SquaredDeviation <- (df$RowTotal-meanPhysical)^2
df$SquaredDeviation <- round(df$SquaredDeviation,4)

#SD calc
sd_sum <- sum(df[[ncol(df)]], na.rm = TRUE)
variance <- sd_sum/(nrow(df)-1)
sd <- sqrt(variance)
sd <- round(sd,2)

#print final calculations
cat("Final Mean for Physical Learning sample: ", meanOnline, "\n")
cat("Final Standard Deviation for Physical Learning sample: ", sd)
