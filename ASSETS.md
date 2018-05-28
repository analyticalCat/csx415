# Input
All data files are stored under bankingclientsprofile/data folder.  
1. past_campaign_data.csv. This file contains 14,828 records from past campaigns. We use this data file for model building and performance analysis.  
2. next_campaign_data.csv. This file contains 3 campaign records for the next campaign.  We need to predict the outcome of these calls.  


# Data
1. pkgs/campaignModel -- the package that contains necessary code and data to predict future results.
2. pkgs/campaignModel/data/model.RDS -- the model we will use to predict future results
  
# Code
All code files are stored under bankingclientsprofile/srv folder.  
1. loaddata.R -- This file contains the code to load the data from the original data file (bank-additional-full.csv) and to clean the data for modeling.
2. initialanalysis.R -- The naive analysis is run from this file.  A histogram is generated from this block of code and is stored and displayed in project-performance.Rmd.
3. training.R -- This file contains the majority of the code for training and modeling.  Multiple algorithms are run and compared.

# Output:  
All graph files are stored in bankingclientsprofile/graphs folder and all reports are in bankingclientsprofile/reports folder.
1. There are five graphs generated for this project. They are stored at 
  -The initial output-age analysis histogram Naive-age.jpeg
  -The ROC curve for glm, randomForest and svm.
  -A graph combines the ROC for three algorithm for comparison and analysis.  

2. crMatrix.txt -- contains the confusion matrix for all three algorithms.

3. project-performance.pdf, project-performance.html, and project-performance.docx -- project performance analysis in three different formats.

4. problem statement -- This file stated the mission of the project, stakeholders, team composition as wel as the success criteria.  
