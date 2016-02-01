 run_analysis <- function(){
        activity_labels <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt")
        features <- read.table("./UCI\ HAR\ Dataset/features.txt")

        subject_train <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
        subject_test <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")

        train_Y <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
        test_Y <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")

        train_X <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
        test_X <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt")

        # Add Factors for the activity
        train_Y$V1 <- factor(train_Y$V1,
                            levels = activity_labels$V1,
                            labels = activity_labels$V2)

        test_Y$V1 <- factor(test_Y$V1,
                             levels = activity_labels$V1,
                             labels = activity_labels$V2)

        # Name the columns before we merge the data
        colnames(train_X) <- features$V2
        colnames(test_X) <- features$V2
        colnames(subject_train) <- "SubjectID"
        colnames(subject_test) <- "SubjectID"
        colnames(train_Y) <- "Activity"
        colnames(test_Y) <- "Activity"

        # Merge the data
        total_train <- cbind(subject_train,train_Y,train_X)
        total_test <- cbind(subject_test,test_Y,test_X)

        # Here is the merged data
        total <- rbind(total_train,total_test)

        # Save the data to a file
        write.table(total, "run_analysis_data.txt", col.names = TRUE)

        # Filter only the means and the standard deviations
        total_filtered <- total[ , grepl( "mean|std" , names( total ), ignore.case = FALSE ) ]

        # Save them to a file
        write.table(total_filtered, "run_analysis_data_mean_std.txt", col.names = TRUE)

 }

