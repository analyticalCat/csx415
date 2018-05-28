# Overview:

This file contains instructions for deployment as well as model usage for CSX415 Project: The Telephone Campaign Result Prediction  

###Assumptions  
-This project is designed for users with intermedia R and Git skills.  If you are not familiar with either, please stop and get yourself familiar with those technology before proceeding.  
-After you get the project from github, we will set the R working directory to the csx415-project directory.  In most cases, we assume that directory is the current working directory.  


### Deployment Instructions

-Download and install R from (cran.r-project.org)on your machine.  The preferred version is 3.4.4.  if you have a newer version of R, everything should still work.  If your version of R is really old, please upgrade your R studio to 3.4.4 or later.  
-Download and install R Studio from (rstudio.com)
-Download and install Git on your machine.  If you are using Mac, you already have Git.  if you are using Windows, please install git from [here](git-scm.com/downloads).  	

``` r
setwd("<folder of your choice>")
```

-To get the project, you have two choices:  
Option 1: Clone the project from [my project repository](https://github.com/JessZhangCSX/csx415-project). (This option is easy to do but you may need to install some packages later)


Option 2: Use packrat  
+Download the packrat bundle from [my dropbox link](https://www.dropbox.com/s/zo025m6zvzoaape/csx415-project-2018-05-27.tar.gz?dl=0)  
+Extract the `csx415-project-2018-05-27.tar.gz` file to the location of your choice. If you cannot extract the file, please run the following r script:

``` r
library(packrat)
packrat::unbundle(`csx415-project-2018-05-27.tar.gz`)
```  

-Start a R session and change your directory to csx415-project folder.  Most actions in this project will assume you are under this folder.  

Now you have all the code you need to for this project and you are ready to run the project.  


###Project Reuse Instructions   
-The code that generates the model is stored in "bankingclientsprofile/src/training.r,"  The code can be reused when more data is gathered.  
-The model is stored in "bankingclientsprofile/pkgs/campaignModel/model.RDS." The model can be used to score new campaign input.
-To get the predictions for the data in the next_campaign_data.csv, please run the following r script:

``` r
cppredict()
```  
