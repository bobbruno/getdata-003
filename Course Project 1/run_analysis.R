##############################################################################################################
#  run_analysis.R: script created to subset, integrate, format and summarize data from the UCI HAR dataset
#  
#  Created by Roberto Bruno Martins (bobbruno@writeme.com) for the "Getting and Cleaning Data" course
#  
##############################################################################################################

# Function to get an entire set (data, labels and subjects), merges their data, adds labels.
# Chooses only the data columns that are specified and returns the resulting dataset
# desired.columns should specify what columns are desired from the dataset. If NULL, 
#     all columns will be returned.
# column.names specifies the column names to add to the data. If NULL, no column names will be applied.
#     If specified, must have desired.length length if it was specified or have all the columns of the dataset.
getSet = function(setName = "train", desired.columns = NULL, column.names = NULL) {
    # Generate file names
    datFile = paste0(setName, "/X_", setName, ".txt")
    labFile = paste0(setName, "/y_", setName, ".txt")
    subFile = paste0(setName, "/subject_", setName, ".txt")
    
    #Get the data
    activityLabels = read.table("activity_labels.txt")
    data.DF = read.table(datFile)
    label.DF = read.table(labFile)
    sub.DF = read.table(subFile)
    
    # Filtering only the columns we care about
    if (!is.null(desired.columns)) {
        data.DF = data.DF[1:dim(data.DF)[1],desired.columns]
    } 
    
    # Giving columns a good name (descriptive activity names)
    if (!is.null(column.names)) {
        colnames(data.DF) = column.names
    }
    
    #merging data, labels and subjects. I'll move these to the beginning of the dataset, before other columns
    data.DF$activity = as.factor(activityLabels$V2[label.DF$V1])  # Add descriptive activity names
    data.DF$subject = sub.DF$V1         # Add the subject
    numCols = dim(data.DF)[2]
    data.DF = data.DF[c(numCols, numCols-1, 1:(numCols-2))]    # And get them to the front of the dataframe
    return(data.DF)
}

# First, let's capture the feature list and filter those that are relevant, namely those that have "mean()" or
# "std() at the end of their names. I'll store their indexes on varList.
# The expressions used below deliberately exclude the columns with meanFreq and gravityMean on their names.

# This command is based on regular expressions.
featuresDF = read.table(file="./features.txt", col.names=c("feature.num", "feature.name"))
varList = grep("[tf](Body+|Gravity)(Acc|Gyro)(Jerk|Mag)*-(mean|std)\\(\\)", featuresDF$feature.name)

# Next, let's create nicer names for the columns, based on the original but a bit more readable
# This command is based on regular expressions and substitution.
varNames = sub("([tf])(Body+|Gravity)(Acc|Gyro)(Jerk|Mag)*-(mean|std)\\(\\)-?([XYZ]?)",
               "\\1.\\2.\\3\\4.\\5.\\6", featuresDF$feature.name)

# Read and format train and test datasets
train = getSet("train", varList, varNames[varList])
test = getSet("test", varList, varNames[varList])

# Combine them in one complete dataframe
complete = rbind(train, test)

# And generate the tidy dataframe with the average of each variable for each activity and each subject
tidy = aggregate(. ~ subject+activity, complete, mean)

write.table(tidy, "./tidy.csv", row.names=FALSE, quote=FALSE, sep=",")
