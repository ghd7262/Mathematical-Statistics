data <- read.csv('SportsAges.csv', head=T)

n <- nrow(data)
k <- 4 - 1

yddot <- sum(data$Age)

NFL <- data[data$Sport == 'NFL',]
NBA <- data[data$Sport == 'NBA',]
MLB <- data[data$Sport == 'MLB',]
NHL <- data[data$Sport == 'NHL',]

n_1 <- nrow(data[data$Sport == 'NFL',]) #NFL
n_2 <- nrow(data[data$Sport == 'NBA',]) #NBA
n_3 <- nrow(data[data$Sport == 'MLB',]) #MLB
n_4 <- nrow(data[data$Sport == 'NHL',]) #NHL

ybardot1 <- (1/n_1)*sum(NFL$Age) #NFL
ybardot2 <- (1/n_2)*sum(NBA$Age) #NBA
ybardot3 <- (1/n_3)*sum(MLB$Age) #MLB
ybardot4 <- (1/n_4)*sum(NHL$Age) #NHL

ybarddot <- (1/n)*yddot

STR1 <- n_1*(ybardot1 - ybarddot)^2
STR2 <- n_2*(ybardot2 - ybarddot)^2
STR3 <- n_3*(ybardot3 - ybarddot)^2
STR4 <- n_4*(ybardot4 - ybarddot)^2

SSTR <- STR1 + STR2 + STR3 + STR4

var <- var(data$Age)

test.stat <- SSTR / var

pchisq(test.stat, df = k)
