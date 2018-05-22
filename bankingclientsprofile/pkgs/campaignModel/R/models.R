#' cppredict Function
#'
#' This function allows you to update the "updatedbankingdata.csv" from the infile of your choice.  The infile should be ; separated csv files. The dataframe will be returned.
#' @param infile Defaults to "next_campaign_data.csv" under the data folder
#' @keywords cppredict
#' @return a dataframe of campaign result predictions
#' @export
#' @examples
#' cppredict(infile)
 
cppredict<- function(infile="data/next_campaign_data.csv"){
    
    # Read CSV into R
    mydata <- read.csv(file="data/updatedbankingdata.csv", header=TRUE, check.names=FALSE, sep=",")
    mytestdata <- read.csv(file=infile, header=TRUE, check.names=FALSE, sep=",")
 
    #equalize scoring data with training data
    mytestdata<-rbind(mydata[1,],mytestdata)
    mytestdata<-mytestdata[-1,]

    #get model from RDS file
    mymodel<-readRDS("pkgs/campaignModel/data/model.RDS")
    myresults<-predict(mymodel, mytestdata, type="prob")

    return(myresults)
}

#' test Function
#'
#' This function will make sure the code is stable and extensible
#' @keywords testthat
#' @examples
#' testthat()

test_that("Data Stable", {

    # The data file is crutial to the success of the model building.
    setwd("../../")
    datafile="data/bank-additional-full.csv"
    expect_true(file.exists(datafile))

    setwd("pkgs/campaignModel")
    modelfile="data/model.RDS"
    expect_true(file.exists(modelfile))
    setwd("../../")
})