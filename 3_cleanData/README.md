# README
##Tidy Data
The definition of tidy data is closely related to the flexibility of the dataset for further researches. Because reshaping the dataset, for example, adding a variable call `dimension` with three levels(X,Y,Z), will introduce a lot of NA values in `magnitude(mag)` variables, which are one-dimentional, the default variables are good enough for further analysis. Therefore, my tidy dataset, a 180x68 data frame, contains the mean of mean and standard deviation of every signals for each activity and each subject, the `subject` variable for identifying different subjects and the `label` variable for identifying different activities.

##RScript
The run_analysis.R includes the whole data processing, from loading data to writing the final tidy dataset.

##The CodeBook
The CodeBook includes the naming methods of variables and transformations that I performed to clean up the data 

