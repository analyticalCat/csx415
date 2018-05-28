#' cppredict Function
#'
#' This function will predict the result of your next campaign call.  The parameter infile should be a , separated csv files. A dataframe with the prediction will be returned.
#' @param infile Defaults to "next_campaign_data.csv" under the data folder
#' @keywords cppredict
#' @return a dataframe of campaign result predictions
#' @export
#' @examples
#' cppredict(infile)
 
cppredict<- function(infile="bankingclientsprofile/data/next_campaign_data.csv"){
    
    # Read CSV into R
    mydata <- read.csv(file="bankingclientsprofile/data/past_campaign_data.csv", header=TRUE, check.names=FALSE, sep=",")
    mydata<-mydata%>%mutate_if(is.character, as.factor)
    mytestdata <- read.csv(file=infile, header=TRUE, check.names=FALSE, sep=",")
 
    #equalize scoring data with training data
    mytestdata<-rbind(mydata[1,],mytestdata)
    mytestdata<-mytestdata[-1,]

    #get model from RDS file
    mymodel<-readRDS("bankingclientsprofile/pkgs/campaignModel/data/model.RDS")
    myresults<-predict(mymodel, mytestdata, type="prob")

    return(myresults)
}
