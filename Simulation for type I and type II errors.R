#Create a simulation that roughly displays the pdf of X1+X2 where X1 and X2 are a random sample of size
#2 from unif(0,theta) where we let theta = 5. The shape you get should match the algebraic formula you
#got for the pdf from question 5. Also, empirically check if your value of c gives a Type I error rate
#of 0.08, as demanded by the question.

data = replicate(100000, runif(1,0,5)+runif(1,0,5))
count = sum(data<2)
alpha = count/length(data)
plot(density(data))

#Write a simulation for a random sample of size n drawn from unif(0, theta). H0: theta =3 vs.
#H1: theta >3 using the crit region Xmax > c. If the test has alpha = 0.05 and beta = 0.12681
#when theta = 4, find the values of c and n that make this happen.
count = 0
trials = 100000
for(i in 1:trials){
  r.data = runif(7,0,4)
  if(max(r.data)>2.978){
    count = count +1
  }
}
power = count/trials
beta = 1-power
beta