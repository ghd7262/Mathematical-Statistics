#Exploratory Data Analysis notes 
getwd()                                             #Identifies current working directory
setwd("~Users/Okiedukki/Desktop/R Programming")     #Sets working directory
data <- read.table("textfilename.txt", header=TRUE) #load data from a textfile located in the wd and assign name as 'data', here head=True means that the first row are the variable names
head(data)                                          #loads first 6 columns of the data
data[data == 99] <- NA                              # assign values that are unknown (here the unknown values are saved as '99') to NA
sum(is.na(data))                                    #find out how many values of 'NA' are there
data$age                                            #returns an array of values (rows of values)
data['age']                                         #returns a dataframe (columns of values)
attach(data)
age                                                 #to 'attach' data to the variable called age
age[1] <- 28                                        #assign 28 to the first element of age
detach(data)
