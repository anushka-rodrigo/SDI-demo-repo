#variables
n1 <- nrow(dfOnline)   #sample sizes
n2 <- nrow(dfPhysical) #sample sizes
df <- n1 + n2 - 2 #degree of freedom
alpha = 0.05 #level of significance

#calculating common SD for pooled t test
s <- sqrt(
  ( ((n1-1)*(sdOnline^2)) + ((n2-1)*(sdPhysical^2)) ) / (n1+n2-2) 
  )
s <- round(s, 2)

#calculating denominator for pooled t test
denominator <- sqrt( (1/n1) + (1/n2) ) 
denominator <- round(denominator, 4)
denominator <- denominator*s

#calculating t statistic 
t <- (meanPhysical-meanOnline) / denominator

#calculate critical value
t_critical <- qt(1 - alpha, df)  # upper-tailed test

#print values
cat("Test statistic T: ", round(t, 4), "\n")
cat("Critical value: ", round(t_critical, 4), "\n")

if (t > t_critical){
  cat("Reject H0,\nAt 5% of significance, there is enough evidence to reject the null hypothesis \n")
}else{
  cat("Fail to reject H0, \nAt 5% of significance, there is no enough evidence to reject the null hypothesis\n")
}

