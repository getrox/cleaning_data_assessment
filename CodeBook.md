How does it work?
========================================================

First of all run_analysis loads the following files:
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt
Then the code combines the train and test sets into one.
After that labels for activities is loaded and y values
(activity indexes) are changed for the labels.
Then all the features are loaded. There are only chosen that
which are mean or std values. With that values a new cleaned 
data is made. The last steps are: generating the labels 
for the output data and computing the average of the variables
for subjects and for activities. The result of computation and
created labels are combined into the output tidy data, which is saved into file called output.txt.

