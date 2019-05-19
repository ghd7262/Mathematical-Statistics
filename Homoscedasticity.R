#Homoscedasticity and ANOVA issues

data <- read.csv('ANOVASadness.csv', head=T)
head(data)

####Box plot to check equal variances
boxplot(vals ~ group, data=data)

####Histogram to check normality of the data
group1 <- data[data$group == 1,]
group2 <- data[data$group == 2,]
group3 <- data[data$group == 3,]

par(mfrow=c(1,3))
hist(group1$vals)
hist(group2$vals)
hist(group3$vals)

####Result of the ANOVA test
results <- aov(vals ~ as.factor(group), data = data)
summary(results)


##########################################################################
data <- read.csv('BankData.csv', head=T)

group1 <- data[data$bankID ==1,]
group2 <- data[data$bankID ==2,]
group3 <- data[data$bankID ==3,]
group4 <- data[data$bankID ==4,]

var(group1$customerCount)
var(group2$customerCount)
var(group3$customerCount)
var(group4$customerCount)

data$SqrtCustomerCount <- sqrt(data$customerCount)

result <- aov(SqrtCustomerCount ~ as.factor(bankID), data=data)
summary(result)

############################################################################
f <- function(x,y){
  return(t.test(x, y, var.equal = T)$p.value < (0.05 /3))
}

mu <- runif(3, 0, 5)
sigma <- runif(1, 0, 10)
group1 <- rnorm(4, -1, 1)
group2 <- rnorm(4, 0, 1)
group3 <- rnorm(4, 1, 1)
groups <- c(rep(1,4), rep(2,4), rep(3,4))

for(i in 1:1000){
  groups <-  as.factor(groups)
  d <- data.frame("vals" = c(group1, group2, group3), "groups" = groups)
  result <- aov(vals ~ groups, data = d)
  p <- summary(result)[[1]][["Pr(>F)"]][1]
  H_0 <- p > 0.05
  t <- (f(group1, group2 || f(group1, group3) || f(group2, group3)))
  if (H_0 && t){
    break
  }
}


###Example from the lecture for Homoscedasticity
k = 4 #k different random exponential observations
i = 50 #number of observations per population
lambdas = runif(k, 0, 4)
OrigData = matrix(0, i, k)

for (j in 1:k) OrigData[,j] = rexp(i, lambdas[j])

boxplot(OrigData, main = "Original Data")
apply(OrigData, 2, var) #take the variance of each of the columns '2' represents the second dimension

scaledData = log(OrigData)
boxplot(scaledData, main = "Transformed Data")
apply(scaledData, 2, var)