
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
In the first phase we perform a merge of the data for each variable from the two different sets (training and test) so all records for each variable row by row are joined in a new file. Then a new merge is performed to join all three variables in a new data file that "has it all"...

The file we receive at the end of this phase has the following characteristics:

