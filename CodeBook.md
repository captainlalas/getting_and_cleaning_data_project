---
title: "Codebook of the project"
author: "Alex"
date: "2024-01-30"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Codebook of the Project in R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


### How to get to the tinydataset.txt:
1. Download data from the link below and unzip it into working directory of R Studio.
2. Execute the R script.

### About the data source
The data of this project is available through the link 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphones, it is from the Human Activity Recognition. A full description about the data is available at the site it was was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### About R script
File with R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):   
1. Reading in the files and merging the training and the test sets to create one data set.   
2. Extracting only the measurements on the mean and standard deviation for each measurement   
3. Using descriptive activity names to name the activities in the data set   
4. Appropriately labeling the data set with descriptive variable names   
5. Creating a new tidy data set with the average of each variable for each activity and each subject   

The code assumes all the data is present in the same folder, un-compressed and without names altered.


### About variables:   
* `X_train`, `y_train`, `X_test`, `y_test` contain the data from the downloaded files.
* `x_data` and `y_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in.
