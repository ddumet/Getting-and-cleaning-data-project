<p>This code book describes the data produced by the <b>run_analysis.R</b> R script that can also be found in this repo.</p>
<h1>Study design</h1>
<p>The initial data set can be obtained from <a
href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">this address</a>. A full description of the data contained into this data set is available <a
href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here</a></p>
<p>The data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ of the smartphone worn by the experiments' participants.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).</p>
<h1>Code book</h1>
<p>Several steps have been performed to transform the initial data to the tidy data (<b>tidyData.txt</b> produced by <b>run_analysis.R</b>):</p>
<ul>
<li>Merging Test and Train data set.</li>
<li>Keeping only the mean and standard deviation for the variables.</li>
<li>Adding the activity for which measurements have been made.</li>
<li>Cleaning labels for each variable.</li>
<li>Producing the average of each variable for each activity and each subject.</li>
</ul>
<p>As a result <b>tidyData.txt</b> contains the following data:</p>
<ul>
<li><b>subjectId</b><p>A number (1 to 30) identifying the subject (participant of the experiment)</p></li>
<li>Keeping only the mean and standard deviation for the variables.</li>
<li>Adding the activity for which measurements have been made.</li>
<li>Cleaning labels for each variable.</li>
<li>Producing the average of each variable for each activity and each subject.</li>
</ul>
<p>As a result <b>tidyData.txt</b> contains the following data:</p>
<ul>
<li><b>subjectId</b><p>A number (1 to 30) identifying the subject (participant of the experiment).</p></li>
<li><b>activity</b><p>The activity for which the measurements have been made. It can be WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.</p></li>
<li>The average value per activity/subject for the MEAN and STANDARD DEVIATION of the smartphone's accelerometer and gyroscope 3-axial raw signals:</li>
<ul>
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ul>
</ul>
