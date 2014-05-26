The following files were available, with test and train datasets:
* subject<set>.txt indicates which subject provided the information
* y<set>.txt gives the label of the activity
* X<set>.txt gives the measurements collected

In the X<set>, you can find the following key fields:
* activity: type of activity being measured
* labels: link to the y<set>.txt file
* subject: subject id, link to the subject<set>.txt file
and the following variables:
* tBodyAccXYZ: Body Acceleration in the 3 spatial directions
* tGravityAccXYZ: Gravity Acceleration in the 3 spatial directions
* tBodyAccJerkXYZ: Body Acceleration Jerk in the 3 spatial directions
* tBodyGyroXYZ: Body Gyroscope in the 3 spatial directions
* tBodyGyroJerkXYZ: Body Gyroscope Jerk in the 3 spatial directions
* tBodyAccMag: Magnitude of Body Acceleration
* tGravityAccMag: Magnitude of Gravity Acceleration
* tBodyAccJerkMag: Magnitude of Body Acceleration Jerk
* tBodyGyroMag: Magnitude of Body Gyroscope
* tBodyGyroJerkMag: Magnitude of Body Gyroscope Jerk

Also, some fast fourier transforms of the previous variables are available:
* fBodyAccXYZ: FFT of tBodyAccXYZ
* fBodyAccJerkXYZ: FFT of tBodyAccJerkXYZ
* fBodyGyroXYZ: FFT of tBodyGyroXYZ
* fBodyAccMag: FFT of tBodyAccMag
* fBodyAccJerkMag: FFT of tBodyAccJerkMag
* fBodyGyroMag: FFT of tBodyGyroMag
* fBodyGyroJerkMag: FFT of tBodyGyroJerkMag

For all of these variables, the following summary metrics were calculated:
* mean: Mean value
* std: Standard deviation
* mad: Median absolute deviation 
* max: Largest value in array
* min: Smallest value in array
* sma: Signal magnitude area
* energy: Energy measure. Sum of the squares divided by the number of values. 
* iqr: Interquartile range 
* entropy: Signal entropy
* arCoeff: Autorregresion coefficients
* correlation: correlation coefficient between two signals
* maxInds: index of the frequency component with largest magnitude
* meanFreq: Weighted average of the frequency components to obtain a mean frequency
* skewness: skewness of the frequency domain signal 
* kurtosis: kurtosis of the frequency domain signal 
* bandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle: Angle between to vectors.

Also, the Inertial Signals directory has x, y, and z coordinates for:
* Body acceleration signal(total acceleration minus  gravity): body_acc_<coord>_<set>.txt
* Angular velocity vector(measured by gyroscope): body_gyro_<coord>_<set>.txt
* Acceleration signal(from phone accelerometer): total_acc_<coord>_<set>.txt

