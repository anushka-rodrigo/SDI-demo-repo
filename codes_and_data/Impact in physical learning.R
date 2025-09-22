#install package if not installed and set working directory if not set
install.packages("readxl")
setwd("C:/Users/USER/Downloads/SDI grp project") #put your file location

library(readxl)

# Read the data
df <- read_excel(
  "Sample_Responses.xlsx",
  sheet = "Initial Response Calc",
  range="A16:D26"
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
cat("Grand mean for impact in physical learning is", grand_mean) 

#grand mean evaluation
if (grand_mean<2.45){
  result <- "Negative"
} else {
  result <- "Positive"
}
cat("We can interpret the grand mean as ", result)
