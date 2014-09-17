# Code Book for the Course Project of Gatting and Cleaning Data

## 1. The following is a list of terms explaining the meaning of the signals in the feature variables: 

##### '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ : The body accelartion signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

tGravityAcc-XYZ: The gravity accelaration signals captured by the accelerameter 3-axial in the X, Y and Z diretioons.

tBodyAccJerk-XYZ:  The body jerk signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

tBodyGyro-XYZ: The body accelartion signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.

tBodyGyroJerk-XYZ:  The body jerk signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.

tBodyAccMag: The Euclidean norm of the body accelartion signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

tGravityAccMag: The Euclidean norm of the gravity accelaration signals captured by the accelerameter 3-axial in the X, Y and Z diretioons.

tBodyAccJerkMag: The Euclidean norm of the body jerk signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

tBodyGyroMag: The Enclidean norm of the body accelartion signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.

tBodyGyroJerkMag: The Enclidean norm of the body jerk signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.

fBodyAcc-XYZ: The fast Fourier transform of the body accelartion signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

fBodyAccJerk-XYZ:  The fast Fourier transform of the body jerk signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

fBodyGyro-XYZ: The fast Fourier transform of the body accelartion signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.

fBodyAccMag: The fast Fourier transform of the Euclidean norm of the body accelartion signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

fBodyAccJerkMag: The fast Fourier transform of the Euclidean norm of the body jerk signals captured by the accelerometer 3-axial in the X, Y and Z diretioons.

fBodyGyroMag: The fast Fourier transform of the Enclidean norm of the body accelartion signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.

fBodyGyroJerkMag: The fast Fourier transform of the Enclidean norm of the body jerk signals captured by the gyroscope 3-axial in the X, Y and Z diretioons.


## 2. The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of 
values. 

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

## 3. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

