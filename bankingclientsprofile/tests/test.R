library(dplyr)

context("test.R")

test_that("datafilesexist", {

    datafile="bankingclientsprofile/data/past_campaign_data.csv"
    expect_true(file.exists(datafile))

    modelfile="bankingclientsprofile/pkgs/campaignModel/data/model.RDS"
    expect_true(file.exists(modelfile))
})