#####
H_0 = 8.3                 # Null hypothesis
sd = 3.2                  # Standard deviation
n = 100                   # The sample size
alpha = 0.03              # Significance level
beta = 0.029              # The desired maximum Type II error probability
pow = 1 - beta            # The minimum desired power
z.alpha = qnorm(1-alpha)  # P( Z > z.alpha ) = alpha
z.beta = qnorm(1-beta)    # P( Z > z.beta ) = beta


curve(pnorm(sqrt(n)*(x - H_0)/sd - z.alpha), 
      from = H_0, 
      to = H_0+4*sd/sqrt(n), 
      col="blue", 
      main="Power Curve", 
      xlab="Avg Stress Level", 
      ylab="Density", 
      lwd=2, add=NA)

abline(h=pow, col="red", lwd=2)

abline(v=H_0+(z.alpha+z.beta)*sd/sqrt(n), col="green",lwd=2) 