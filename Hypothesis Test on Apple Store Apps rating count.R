#R1 You've just made the best app ever! You plan to upload it to the app store and are curious how
#many reviews you might get from users. The histogram of review counts for various apps in the Apple
#store is very right skewed: most apps get a small number of reviews, but some apps - like Pandora,
#PayPal, and LinkedIn - get millions. It turns out that ln(review count) is roughly normally distributed
#with sd = 2.6 (for those apps with more than 5 reviews). Your friend claims that the average review 
#count for apps is 660, but you think it's higher: people love rating stuff in the moder era! Using the
#data set AppleStore.csv (found on TED), conduct a hypothesis test to determine whom to momentarily believe
#in life. This data set contains informatino on 7197 random apps from Apple's app store. Load this into R
#using the "Import Dataset" button in the upper right window of R studio. Make sure to remove rows with 5
#or fewer reviews. Your answer will be a mix of R code and written work. Use alpha = 0.01. The
#rating_count_tot column lists how many times a given app has been rated/reviewed by users.

mydata = read.csv("AppleStore.csv")                 #import dataset
mydata = mydata[!mydata$rating_count_tot < 6,]      #remove rows with 5 or fewer reviews

sd = 2.6                                            #standard deviation of review count
a = 0.01                                            #alpha = 0.01
n = nrow(mydata)                                    #number of rows
xbar = sum(mydata$rating_count_tot)/n               #This is your test data / xbar

#step 1: Identify the hypothesis
H_0 = 660                                           #your friend's guess of avg rating count (null hypothesis)
#H_1 != 660                                         #This is your alternate hypothesis

#step 2: Calculate the distribution according to xbar
new_sd = 2.6/sqrt(n)                                #Notice E(xbar) = H_0, so we have xbar~N(660,0.03349337)

#Step 3: Graph the critical region
ub = qnorm(0.01, H_0, new_sd, lower = F)
