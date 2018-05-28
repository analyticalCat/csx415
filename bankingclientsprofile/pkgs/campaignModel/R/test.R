library(dplyr)

context("test.R")

test_that("datafilesexist", {

    datafile="../../data/past_campaign_data.csv"
    expect_true(file.exists(datafile))

    modelfile="data/model.RDS"
    expect_true(file.exists(modelfile))
})