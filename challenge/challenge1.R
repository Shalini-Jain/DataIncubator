setwd("C:/Users/Anshu/Downloads/challenge")
library(plyr)
library(sqldf)
crime_data <- read.csv("Crimes_2001_to_present.csv",header=TRUE,sep=",")
head(crime_data)
names(crime_data)[c(6)]<-c("PrimaryType")
//plot graph for Total count of different crimes
total_crime_count <- sqldf("Select PrimaryType, count(*) as cnt from crime_data Group by PrimaryType")
png('Crime Reported - Crime Category based.png')
plot(total_crime_count$PrimaryType,total_crime_count$cnt, type = "h",xlab="Crime Categories",ylab= "Total Crime Reported",main="Crime Reported - Crime Category based",col="blue")
dev.off()

//plot graph for Total crimes - year summary

yearly_crime_count <- sqldf("Select Year, count(*) as cnt from crime_data Group by Year")

png('Crime Reported - Year based.png')
plot(yearly_crime_count$Year,yearly_crime_count$cnt, type = "h",xlab="Year",ylab= "Total Crime Reported",main="Crime Reported - Year based",col="blue")
dev.off()
