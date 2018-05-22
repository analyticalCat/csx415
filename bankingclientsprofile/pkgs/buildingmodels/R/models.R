
#' cpPredict Function
#' This function will load the traied model and apply it to given data to predict the possibilities of the upcoming 
#' saved in files called model_prediction_glm.csv," "model_prediction_svm.csv," and "model_prediction_svm.csv"
#' @param mydata No default.  If null is passed, it will load data from "updatedbankingdata.csv under the data folder 
#' @keywords models
#' @export
#' @examples
#' BoPModels()

BoPModels <- function(mydata=NULL){
    if (is.null(mydata)) {
        mydata<-loadData()
    }

    train<-mydata$train
    test<-mydata$test
    test_x<-mydata$test
    test_x$y<-NULL
  
    #random forest
    train.rf<-randomForest(y~., data=train, importance=TRUE)
    train.rf.predictions<-predict(train.rf, test_x, type="prob")
    train.rf.predictions.f<-predict(train.rf, test_x, type="response")
    train.rf.cfMatrix<-confusionMatrix(train.rf.predictions.f, test$y)
    #plot(roc(test$y, train.rf.predictions[,2]))

    #Save the model to /data folder as the RDA file.
    save(train.rf, file="pkgs/buildingmodels/data/model.RDA")
    #return(train.rf)
}



#' test Function
#'
#' This function will make sure the code is stable and extensible
#' @keywords testthat
#' @export
#' @examples
#' testthat()

test_that("Data Stable", {

    # The data file is crutial to the success of the model building.
    setwd("../../")
    datafile="data/bank-additional-full.csv"
    expect_true(file.exists(datafile))

    mymodel<-BoPModels()
    expect_false(is.null(mymodel))

})