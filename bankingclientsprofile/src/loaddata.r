setwd("C:/Users/jess_/Documents/GitHub/CSX415-project/bankingclientsprofile")


# Read CSV into R
mydata <- read.csv(file="data/bank-additional-full.csv", header=TRUE, check.names=FALSE, sep=";")

#Remove poutcome as this column is same as y.  It will mess up the data.
mydata$poutcome<-NULL

#clean up unknow data with dominant majority value
# mydata$job[mydata$job == "unknown"] <- "admin."
# mydata$marital[mydata$marital =="unknown"] <- "single"
# mydata$education[mydata$education=='unknown']<-'university.degree'

#force all char type data into factor so randomforest can be run
library(dplyr)
mydata<-mydata%>%mutate_if(is.character, as.factor)

#Remove the'unknown' value from the default column as out of 41776 records, there are only 3 yeses and 8596 unknown.  The model will be built based on the status "unknown," which is missing data.
#Same applies to loan
mydata$default[mydata$default=='unknown']<-'no'
mydata$loan[mydata$loan=="unknown"]<-"no"

write.table(mydata, "data/updatedbankingdata.csv",row.names=FALSE, sep=",")
mydata <- read.csv(file="data/updatedbankingdata.csv", header=TRUE, check.names=FALSE, sep=",")
#5/7/2018  updatebankingdata is up-to-date