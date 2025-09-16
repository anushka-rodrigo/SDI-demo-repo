#install package if not installed and set working directory if not set
install.packages("readxl")
setwd("C:/Users/USER/Downloads/SDI grp project") #put your file location

library(readxl)

# Read the data
df <- read_excel(
  "Sample_Responses.xlsx",
  sheet = "Online learning impact",
  range="A1:J44"
)

# Add row totals
df$RowTotal <- rowSums(df[ , ], na.rm = TRUE)

# Calculate the mean of the last column
mean_last_col <- mean(df[[ncol(df)]], na.rm = TRUE)
meanOnline <- round(mean_last_col, 2)

#add new row to calc the SD
df$SquaredDeviation <- (df$RowTotal-meanOnline)^2
df$SquaredDeviation <- round(df$SquaredDeviation,4)

#SD calc
sd_sum <- sum(df[[ncol(df)]], na.rm = TRUE)
variance <- sd_sum/(nrow(df)-1)
sd <- sqrt(variance)
sd <- round(sd,2)

#print final calculations
cat("Final Mean for Online Learning sample: ", meanOnline, "\n")
cat("Final Standard Deviation for Online Learning sample: ", sd)
