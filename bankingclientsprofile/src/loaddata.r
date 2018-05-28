#Most code in this file is deprecated since the "past_campaign_data.csv" is a clean version of the original data.  The commented code can be reused to clean future data

#setwd("~/GitHub/CSX415-project")

# Read CSV into R
#mydata <- read.csv(file="bankingclientsprofile/data/past_campaign_data.csv", header=TRUE, check.names=FALSE, sep=",")

#Remove poutcome as this column is same as y.  It will mess up the data.
#mydata$poutcome<-NULL

#write.table(mydata, "data/past_campaign_data.csv",row.names=FALSE, sep=",")


mydata <- read.csv(file="bankingclientsprofile/data/past_campaign_data.csv", header=TRUE, check.names=FALSE, sep=",")
#force all char type data into factor so randomforest can be run
library(dplyr)
mydata<-mydata%>%mutate_if(is.character, as.factor)
