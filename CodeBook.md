
### About the Original Data Set
The original data was collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description of the original data is available at the official site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A short description of the original data set can be found in the file [The original Data.txt](https://github.com/Emmanuel-Filippakis/GettingAndCleaningData-TheCourseProject/blob/master/The%20original%20Data.txt) of my repository 
and information about the Features of the activities can be found in the file 
[The Features Info.txt](https://github.com/Emmanuel-Filippakis/GettingAndCleaningData-TheCourseProject/blob/master/The%20Features%20Info.txt).

### About this Project
The purpose of this project is to collect, work with, and clean the given data set and the goal is to prepare tidy data that can be used for later analysis.

### The Process
In the first phase we perform a merge of the data for each variable from the two different sets (training and test) so all records row by row are joined in a new file for each variable (files: ActivityAll, SubjectAll and FeaturesAll). Then a new merge is performed to join all three variables in a new data file that "has it all" named DataAll.

The file we receive at the end of this phase has the following characteristics:

File Name : DataAll

Variables : 563 [Variables List Here](https://github.com/Emmanuel-Filippakis/GettingAndCleaningData-TheCourseProject/blob/master/DataAll%20-%20Phase%20One%20Variables%20List.txt)

Observations  : 10299

Second phase is the process of getting out from the DataAll only the required variables which are activity, subject and the mean and the standard deviation for each measurement. This is done by subsetting the DataAll file using a filter to features variable that collects only the ones that contains words "mean()" or "std()"

The file we receive at the end of this phase has the following characteristics:

File Name : DataAll

Variables : 68 [Variables List Here](https://github.com/Emmanuel-Filippakis/GettingAndCleaningData-TheCourseProject/blob/master/DataAll%20-%20Phase%20Two%20Variables%20List.txt)

Observations  : 10299

In the fird phase of the project we assign names to all Variables that are more descriptive of the activities of the research.

These is the activity assignment list:

1->WALKING / 2->WALKING_UPSTAIRS / 3->WALKING_DOWNSTAIRS / 4->SITTING / 5->STANDING / 6->LAYING
