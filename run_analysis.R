runAnalysis <- function() {

  # 0. Initial - Load data to memory

  # 0a get train data
  message('reading train data...')
  x.train = read.table('./UCI HAR Dataset/train/X_train.txt')
  y.train = read.table('./UCI HAR Dataset/train/y_train.txt')
  subject.train = read.table('./UCI HAR Dataset/train/subject_train.txt')

  # 0b get test data
  message('reading test data...')
  x.test = read.table('./UCI HAR Dataset/test/X_test.txt')
  y.test = read.table('./UCI HAR Dataset/test/y_test.txt')
  subject.test = read.table('./UCI HAR Dataset/test/subject_test.txt')

  # 0c get features and activity labels
  message('reading other required files..')
  features = read.table('./UCI HAR Dataset/features.txt')
  activity.labels = read.table('./UCI HAR Dataset/activity_labels.txt')


  # 1. Merges the training and the test sets to create one data set.
  # (x, y, subject will be fully merged into one data set after step 4)
  message('merging training and test sets...')
  x <- rbind(x.train, x.test)
  y <- rbind(y.train, y.test)
  subject <- rbind(subject.train, subject.test)


  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  message('extracting specific measurements...')

  # 2a get mean and standard deviation column index
  index <- grep('(mean|std)\\(\\)', features[,2])

  # 2b filter x data set to only mean and standard deviation columns
  x <- x[, index]


  # 3. Uses descriptive activity names to name the activities in the data set
  message('using descriptive activity names...')
  y <- merge(y, activity.labels, by.x='V1', by.y='V1', sort=FALSE)


  # 4. Appropriately labels the data set with descriptive variable names.
  message('label data set appropriately...')
  names(x) <- features[index,2]
  names(y) <- c('activity.number', 'activity')
  names(subject) <- 'subject'

  # merged everything into one data set
  message('merging everything into one data set...')
  dataset <- cbind(x, y, subject)


  # 5. From the data set in step 4, creates a second, independent tidy data set
  #    with the average of each variable for each activity and each subject.
  message('creating average data set...')
  dataset.average <- ddply(dataset, .(subject, activity), function(d) colMeans(d[, -(67:69)]))


  # 6. Create the tidy data set file.
  message('writing average data set into file...')
  write.table(dataset.average, 'dataset_average.txt', row.name=FALSE)


  # 7. Return average data set.
  message('done. returning average data set.')
  dataset.average

}
