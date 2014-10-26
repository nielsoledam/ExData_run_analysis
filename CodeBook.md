Code Book
===
___
Info about the 2 ID variables and 66 data variables in tidydata.txt. 
___
The tidydata.txt file was produced using the following steps:

1. The training and the test sets was merged to create one data set.
2. The measurements on the mean and standard deviation for each measurement was extracted. 
3. The activity names was used to name the activities in the data set.
4. The data set was labeled with descriptive variable names. 
5. A second, independent tidy data set with the average of each variable for each activity and each subject was produced.
6. The tidy data set was saved to the file named tidydata.txt.

___
The ID's
___

*subject*  
The id of the test subjects (integer).
Values:

		1..32

*activity*  
The type of activity (string).
Values:

		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING
			
___
The variables (all numeric)
___
*tbodyaccmeanx  
tbodyaccmeany  
tbodyaccmeanz  
tbodyaccstdx  
tbodyaccstdy  
tbodyaccstdz  
tgravityaccmeanx  
tgravityaccmeany  
tgravityaccmeanz  
tgravityaccstdx  
tgravityaccstdy  
tgravityaccstdz  
tbodyaccjerkmeanx  
tbodyaccjerkmeany  
tbodyaccjerkmeanz  
tbodyaccjerkstdx  
tbodyaccjerkstdy  
tbodyaccjerkstdz  
tbodygyromeanx  
tbodygyromeany  
tbodygyromeanz  
tbodygyrostdx  
tbodygyrostdy  
tbodygyrostdz  
tbodygyrojerkmeanx  
tbodygyrojerkmeany  
tbodygyrojerkmeanz  
tbodygyrojerkstdx  
tbodygyrojerkstdy  
tbodygyrojerkstdz  
tbodyaccmagmean  
tbodyaccmagstd  
tgravityaccmagmean  
tgravityaccmagstd  
tbodyaccjerkmagmean  
tbodyaccjerkmagstd  
tbodygyromagmean  
tbodygyromagstd  
tbodygyrojerkmagmean  
tbodygyrojerkmagstd  
fbodyaccmeanx  
fbodyaccmeany  
fbodyaccmeanz  
fbodyaccstdx  
fbodyaccstdy  
fbodyaccstdz  
fbodyaccjerkmeanx  
fbodyaccjerkmeany  
fbodyaccjerkmeanz  
fbodyaccjerkstdx  
fbodyaccjerkstdy  
fbodyaccjerkstdz  
fbodygyromeanx  
fbodygyromeany  
fbodygyromeanz  
fbodygyrostdx  
fbodygyrostdy  
fbodygyrostdz  
fbodyaccmagmean  
fbodyaccmagstd  
fbodybodyaccjerkmagmean  
fbodybodyaccjerkmagstd  
fbodybodygyromagmean  
fbodybodygyromagstd  
fbodybodygyrojerkmagmean  
fbodybodygyrojerkmagstd*  
