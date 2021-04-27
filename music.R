rm(list = ls()) #removes all variables stored previously

library(Hmisc) #imports Hmisc

data <- read.csv('~/Desktop/R Programming/RMusicNet/musicnet_metadata.csv')

#SECONDS
#Claim: Museopen publishes longer pieces than European Archive

euarchive <- subset(data, source == 'European Archive') 
#Creates a subset of all publications by European Archive

museopen <- subset(data, source == 'Museopen')
#Creates a subset of all publications by Museopen

mean(euarchive$seconds, na.rm = TRUE) #Mean number of seconds in European Archive pieces
mean(museopen$seconds, na.rm = TRUE) #Mean number of seconds in Museopen Archive pieces
#Is this statistically significant?

t.test(museopen$seconds, euarchive$seconds, alternative = "two.sided", conf.level = 0.95)
#Normally, if p-value>0.05, the null hypothesis is rejected.
#Here, p-value ~0.08585 so the null hypothesis is not rejected
#I.e, Museopen does indeed publish longer pieces than European Archive

