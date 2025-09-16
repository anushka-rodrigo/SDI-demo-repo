#install package if not installed and set working directory if not set
install.packages("readxl")
setwd("C:/Users/USER/Downloads/SDI grp project") #put your file location

library(readxl)

# Read the data
dfOnline <- read_excel(
  "Sample_Responses.xlsx",
  sheet = "Online learning impact",
  range="A1:J44"
)

# Add row totals
dfOnline$RowTotal <- rowSums(dfOnline[ , ], na.rm = TRUE)

# Calculate the mean of the last column
mean_last_col <- mean(dfOnline[[ncol(dfOnline)]], na.rm = TRUE)
meanOnline <- round(mean_last_col, 2)

#add new row to calc the SD
dfOnline$SquaredDeviation <- (dfOnline$RowTotal-meanOnline)^2
dfOnline$SquaredDeviation <- round(dfOnline$SquaredDeviation,4)

#SD calc
sd_sum <- sum(dfOnline[[ncol(dfOnline)]], na.rm = TRUE)
variance <- sd_sum/(nrow(dfOnline)-1)
sdOnline <- sqrt(variance)
sdOnline <- round(sdOnline,2)

#print final calculations
cat("Final Mean for Online Learning sample: ", meanOnline, "\n")
cat("Final Standard Deviation for Online Learning sample: ", sdOnline)
