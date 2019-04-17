p = c(pnorm(260,272.1,9), pnorm(284,272.1,9)- pnorm(260,272.1,9), 1-pnorm(284,272.1,9))
x = rmultinom(1, 100, p=p)
y = rmultinom(10000, 100, p=p)
mean(y[3, ])

counts = y[2,]
exp = rbinom(10000, 100, p=pnorm(284,272.1,9)- pnorm(260,272.1,9))


hist(counts, col='pink')
hist(exp,col='skyblue', add=T)