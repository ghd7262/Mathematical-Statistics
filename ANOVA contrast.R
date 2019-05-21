data <- read.csv('winescores.csv', head=T)
data <- subset(data, country %in% c('US', 'Mexico', 'Canada', 'France', 'Spain'))
data <- droplevels(data)
contrasts(data$country)


#Draw a boxplot
boxplot(data$points ~ data$country)

#ANOVA contrast
country <- data$country
contrasts(country) <- c(1/3, -1/2, 1/3, -1/2, 1/3)
contrasts(country)
results <- aov(data$points ~ country, data = data)
summary.lm(results)





#data <- data[which(data$country == c('Spain', 'France', 'US', 'Canada', 'Mexico')),]
#data <- data[c(-1,-3,-4,-6,-7,-8)]
#newdat <- data[c(-3,-4,-5)]

#boxplot(points ~ country, data = newdat)

#US <- data[which(data$country == 'US'),]
#Canada <- data[which(data$country == 'Canada'),]
#Mexico <- data[which(data$country == 'Mexico'),]
#Spain <- data[which(data$country == 'Spain'),]
#France <- data[which(data$country == 'France'),]


