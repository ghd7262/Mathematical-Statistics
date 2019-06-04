#####
#Question 1
treatments = rep(c("MSWord", "Fortnite", "Chrome"), each = 4)
blocks = c("Roomate A", "Roomate B", "Roomate C", "Roomate D")
times = c(12,13,10,8,20,22,17,18,4,3,5,1)
test = data.frame(time = times, treatment = treatments, computers = blocks)

results = aov(time ~ treatment + computers, data= test)
summary(results)

#####
#Question 3

#####
#Question 4
library(BHH2)
data("penicillin.data")
data = penicillin.data
yield = data$yield
blend = data$blend0
run = data$run
treat = data$treat

results = aov(yield ~ blend+treat, data=data)
summary(results)
head(data)