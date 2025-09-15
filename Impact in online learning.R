#install package if not installed
install.packages("readxl")

library(readxl)

# Read the data
df <- read_excel(
  "Questionaire_calculations.xlsx",
  sheet = "Initial Response Calc",
  range="B2:E12"
)

# Define weights (order must match columns)
weights <- c(4, 3, 2, 1)

# Ensure all data is numeric
df_numeric <- as.data.frame(lapply(df, as.numeric))

# Calculate weighted mean for each row
weighted_means <- apply(df_numeric, 1, function(x) {
  sum(x * weights) / sum(x)  # divide by total respondents
})

#round to 2 decimal places
weighted_means_rounded <- round(weighted_means, 2)

# View results, printed in each line
cat(weighted_means_rounded, sep = "\n")

#grand mean calculation
grand_mean <- round(mean(unlist(weighted_means)), 2)
cat("Grand mean for impact in online learning is", grand_mean) 

