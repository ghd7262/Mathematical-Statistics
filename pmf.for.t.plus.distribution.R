par(mfrow = c(2,3))
for(n in seq(4, 24, by = 4)){
  max = n*(n+1)/2
  prob = dsignrank(0:max, n)
  sd = sqrt(n*(n+1)*(2*n+1)/24)
  plot(0:max, prob, type = 'h')
  
  x = seq(0, max, by = 0.01)
  y = dnorm(x, mean = max/2, sd = sd)
  lines(x,y, col = 'blue')
}
