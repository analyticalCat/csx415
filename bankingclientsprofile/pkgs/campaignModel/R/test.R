library(dplyr)

context("test.R")

test_that("datafilesexist", {

    datafile="data/bank-additional-full.csv"
    expect_true(file.exists(datafile))

    modelfile="pkgs/campaignModel/data/model.RDS"
    expect_true(file.exists(modelfile))
})