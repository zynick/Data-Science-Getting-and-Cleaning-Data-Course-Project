# Data Science - Getting and Cleaning Data Course Project

This repo was created due to my journey of learning Data Science in John Hopkin's Online Data Science Course
https://www.coursera.org/specializations/jhudatascience/1

## Data Source

Data source is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## run_analysis.R

The script consists of one function `runAnalysis()` that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


To run the script, type:

```
source('run_analysis.R')
runAnalysis()
```

Output:

```
reading train data...
reading test data...
reading other required files..
merging training and test sets...
extracting specific measurements...
using descriptive activity names...
label data set appropriately...
merging everything into one data set...
creating average data set...
writing average data set into file...
done. returning average data set.
```


## CodeBook.md

Describes the variables, the data, and any transformations or work that is performed to clean up the data.


## tidy.txt

A tidy data set generated after `runAnalysis()` is performed.
