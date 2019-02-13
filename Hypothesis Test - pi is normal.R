set.seed(2019)
a = 0.05                                                         #alpha                                                   
x = 314                                                          #314 random samples
H_0 = 0.5                                                        #(null hypothesis)
#H_1 != 0.5 (alternate hypothesis)

setwd("~/Desktop/UCSD MATH/Math 181A")
data = read.csv("pibinary.csv", head = T)                        #load dataset
data.matrix(data)                                                #Change data frame into matrix
random = data[sample(nrow(data), size = x, replace = F),]        #Pick random 314 rows without replacement
n = sum(random)                                                  #Proportion of 1s out of 314 random samples

prop.test(n, x, H_0, alternative = c("two.sided"), conf.level = 1-a, correct = F)