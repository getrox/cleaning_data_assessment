## Loading necessary data files...
subject1<-read.table('test/subject_test.txt');
x1<-read.table('test/X_test.txt');
y1<-read.table('test/y_test.txt');
subject2<-read.table('train/subject_train.txt');
x2<-read.table('train/X_train.txt');
y2<-read.table('train/y_train.txt');
# Combining test and train sets together
x<-rbind(x1,x2);
y<-rbind(y1,y2);
subject<-rbind(subject1,subject2);
# Loading activities table
activities<-read.table('activity_labels.txt',stringsAsFactors=FALSE);
activities<-activities[,2];
# Changing activity numbers to a well named labels
activity_labels<-activities[y[,1]];
# Loading feature table
f<-read.table('features.txt',stringsAsFactors=FALSE);
# Get the features that contains means and stds
indexes<-sort(c(grep('mean()',f[,2]),grep('std()',f[,2])));
# Extract these features from the data
x_mean_std<-x[,indexes];
# Create a clean data with means and stds
clean_dataset<-data.frame(activity_labels,subject,x_mean_std);
colnames(clean_dataset)<-c('Activity','Subject',as.list(f[indexes,2]));
# write.frame(clean_dataset, file = "output.txt", sep = " ")

# Generate labels for final tidy data
output_labels=c();
for (subject in 1:30) {
  for (activity in 1:6){
    output_labels[6*(subject-1)+activity]<-sprintf("SUBJECT %i ACTIVITY %s",subject,activities[activity]);
  }  
}

# Computing the means of every variable for every subject and every activity
output_data=matrix(0,180,length(clean_dataset)-2);
for (subject in 1:30) {
  for (activity in 1:6){
    for (col in 3:length(clean_dataset))
    {
      tmp<-subset(clean_dataset,Subject==subject & Activity==activities[activity],select=col);
      output_data[[6*(subject-1)+activity,col-2]] = mean(tmp[,1]);
    }
  }
}

# Combining the labels and the data
output_new=data.frame(cbind(output_labels,output_data));
colnames(output_new)<-c('Name',as.list(f[indexes,2]));
# Saving output data in a file
write.table(output_new, file = "output.txt", sep= "\t",col.names=colnames(output_new))
