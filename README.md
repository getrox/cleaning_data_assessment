README
========================================================

To get this script working it is necessary to put it in
the directory of Samsung (e.g. UCI HAR Dataset) so that
features.txt, activity_labels.txt, features_info.txt and 
test and train folders are in the same location as the run_analysis.R.

Example of launching the script:
```{r}
source('run_analysis.R')
```
The expected output is the output.txt file which contains 
the proper tidy data.

