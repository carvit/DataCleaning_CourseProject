---
title: CodeBook for the Project of Data Cleaning Course
author: Robert H.
date: 11/19/2016
---

# Original Dataset Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

    mean(): Mean value
    std(): Standard deviation
    mad(): Median absolute deviation 
    max(): Largest value in array
    min(): Smallest value in array
    sma(): Signal magnitude area
    energy(): Energy measure. Sum of the squares divided by the number of values. 
    iqr(): Interquartile range 
    entropy(): Signal entropy
    arCoeff(): Autorregresion coefficients with Burg order equal to 4
    correlation(): correlation coefficient between two signals
    maxInds(): index of the frequency component with largest magnitude
    meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    skewness(): skewness of the frequency domain signal 
    kurtosis(): kurtosis of the frequency domain signal 
    bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


# TIDY DATASET

All variables in the corresponding datased are averaged by ACTIVITY and SUBJECT_ID. The description of the original data can you find at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

*For variable naming conventions see the previous paragraph


## 1. ACTIVITY      
Factor variable with 6 levels:

* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

## 2. SUBJECT_ID         
Integer variable with values 1:30 designated to people conducting the activities.

## 3. tBodyAcc-mean()-X             
Numeric variable

## 4. tBodyAcc-mean()-Y                   
Numeric variable

## 5. tBodyAcc-mean()-Z                   
Numeric variable

## 6. tGravityAcc-mean()-X                
Numeric variable

## 7. tGravityAcc-mean()-Y                
Numeric variable

## 8. tGravityAcc-mean()-Z                
Numeric variable

## 9. tBodyAccJerk-mean()-X               
Numeric variable

## 10. tBodyAccJerk-mean()-Y               
Numeric variable

## 11. tBodyAccJerk-mean()-Z               
Numeric variable

## 12. tBodyGyro-mean()-X                  
Numeric variable

## 13. tBodyGyro-mean()-Y                  
Numeric variable

## 14. tBodyGyro-mean()-Z                  
Numeric variable

## 15. tBodyGyroJerk-mean()-X              
Numeric variable

## 16. tBodyGyroJerk-mean()-Y              
Numeric variable

## 17. tBodyGyroJerk-mean()-Z              
Numeric variable

## 18. tBodyAccMag-mean()                  
Numeric variable

## 19. tGravityAccMag-mean()               
Numeric variable

## 20. tBodyAccJerkMag-mean()              
Numeric variable

## 21. tBodyGyroMag-mean()                 
Numeric variable

## 22. tBodyGyroJerkMag-mean()             
Numeric variable

## 23. fBodyAcc-mean()-X                   
Numeric variable

## 24. fBodyAcc-mean()-Y                   
Numeric variable

## 25. fBodyAcc-mean()-Z                   
Numeric variable

## 26. fBodyAcc-meanFreq()-X               
Numeric variable

## 27. fBodyAcc-meanFreq()-Y               
Numeric variable

## 28. fBodyAcc-meanFreq()-Z               
Numeric variable

## 29. fBodyAccJerk-mean()-X               
Numeric variable

## 30. fBodyAccJerk-mean()-Y               
Numeric variable

## 31. fBodyAccJerk-mean()-Z               
Numeric variable

## 32. fBodyAccJerk-meanFreq()-X           
Numeric variable

## 33. fBodyAccJerk-meanFreq()-Y           
Numeric variable

## 34. fBodyAccJerk-meanFreq()-Z           
Numeric variable

## 35. fBodyGyro-mean()-X                  
Numeric variable

## 36. fBodyGyro-mean()-Y 
Numeric variable

## 37. fBodyGyro-mean()-Z                  
Numeric variable

## 38. fBodyGyro-meanFreq()-X              
Numeric variable

## 39. fBodyGyro-meanFreq()-Y              
Numeric variable

## 40. fBodyGyro-meanFreq()-Z              
Numeric variable

## 41. fBodyAccMag-mean()                  
Numeric variable

## 42. fBodyAccMag-meanFreq()              
Numeric variable

## 43. fBodyBodyAccJerkMag-mean()          
Numeric variable

## 44. fBodyBodyAccJerkMag-meanFreq()      
Numeric variable

## 45. fBodyBodyGyroMag-mean()             
Numeric variable

## 46. fBodyBodyGyroMag-meanFreq()         
Numeric variable

## 47. fBodyBodyGyroJerkMag-mean()         
Numeric variable

## 48. fBodyBodyGyroJerkMag-meanFreq()     
Numeric variable

## 49. angle(tBodyAccMean,gravity)         
Numeric variable

## 50. angle(tBodyAccJerkMean),gravityMean)
Numeric variable

## 51. angle(tBodyGyroMean,gravityMean)    
Numeric variable

## 52. angle(tBodyGyroJerkMean,gravityMean)
Numeric variable

## 53. angle(X,gravityMean)                
Numeric variable

## 54. angle(Y,gravityMean)                
Numeric variable

## 55. angle(Z,gravityMean)                
Numeric variable

## 56. tBodyAcc-std()-X                    
Numeric variable

## 57. tBodyAcc-std()-Y                    
Numeric variable

## 58. tBodyAcc-std()-Z                    
Numeric variable

## 59. tGravityAcc-std()-X                 
Numeric variable

## 60. tGravityAcc-std()-Y                 
Numeric variable

## 61. tGravityAcc-std()-Z                 
Numeric variable

## 62. tBodyAccJerk-std()-X                
Numeric variable

## 63. tBodyAccJerk-std()-Y                
Numeric variable

## 64. tBodyAccJerk-std()-Z                
Numeric variable

## 65. tBodyGyro-std()-X                   
Numeric variable

## 66. tBodyGyro-std()-Y                   
Numeric variable

## 67. tBodyGyro-std()-Z                   
Numeric variable

## 68. tBodyGyroJerk-std()-X               
Numeric variable

## 69. tBodyGyroJerk-std()-Y               
Numeric variable

## 70. tBodyGyroJerk-std()-Z               
Numeric variable

## 71. tBodyAccMag-std()                   
Numeric variable

## 72. tGravityAccMag-std()                
Numeric variable

## 73. tBodyAccJerkMag-std()               
Numeric variable

## 74. tBodyGyroMag-std()                  
Numeric variable

## 75. tBodyGyroJerkMag-std()              
Numeric variable

## 76. fBodyAcc-std()-X                    
Numeric variable

## 77. fBodyAcc-std()-Y                    
Numeric variable

## 78. fBodyAcc-std()-Z                    
Numeric variable

## 79. fBodyAccJerk-std()-X                
Numeric variable

## 80. fBodyAccJerk-std()-Y                
Numeric variable

## 81. fBodyAccJerk-std()-Z                
Numeric variable

## 82. fBodyGyro-std()-X                   
Numeric variable

## 83. fBodyGyro-std()-Y                   
Numeric variable

## 84. fBodyGyro-std()-Z                   
Numeric variable

## 85. fBodyAccMag-std()                   
Numeric variable

## 86. fBodyBodyAccJerkMag-std()           
Numeric variable

## 87. fBodyBodyGyroMag-std()              
Numeric variable

## 88. fBodyBodyGyroJerkMag-std()          
Numeric variable

