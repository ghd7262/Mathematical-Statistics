#M(Mathematical Statistics)
#Find MLE CI for a geometric distribution with x=1,2,3,... Note: 1 is added after ngeom to start from x=1
trials=10000                       
z=qnorm(0.05,lower=F)              #a=0.05
times=0
n=10                               #n can be 100,1000,10000,... as n gets larger, the captured probability will converge to 0.9
for(i in 1:trials){                #10000 trials
  phat = 1/(mean(rgeom(n,2/3)+1))  #phat_MLE
  a=1/(phat^2*(1-phat))           
  lb=phat-z/sqrt(n*a)              #Lower bound of the MLE CI
  ub=phat+z/sqrt(n*a)              #Upper bound of the MLE CI
  
  if(lb<2/3&2/3<ub){
    times = times + 1
  }
}

print(times/trials)

#####
#Example of a MLE Theorem: how the geometric distribution tends to a normal distribution as n->infinity
c=2                                                     #color number
p = 2/3                                                 #success probability of the geom. dist.
plot(-500, 0, xlim = c(0,1.3),ylim = c(0,10),           
     xlab = "phat_MLE", ylab = "density", main = "pdf for phat_MLE")
n = c(5,20,50,100)                                      #different plots for when n=5,20,50,100

for(i in 1:n){
  phat_MLE=replicate(10000,1/(mean(rgeom(n[i],p)+1)))
  lines(density(phat_MLE), col=c)
  c=c+1
}

abline(v=2/3,col='black')         
