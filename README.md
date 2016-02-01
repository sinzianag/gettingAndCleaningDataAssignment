# Getting and Cleaning Data Course Project

Summary of the files in this repo:

* run_analysis.R - the script that runs through the assignment and builds a data frame that will be later simplyfied by using ddply.
* run_analysis_data.txt - the first big file - this will contain all the data from all the files provided added together, no processing on them.
* run_analysis_data_mean_std.txt - data filtered to include only standard deviation and mean
* summary_run_analysis.txt - average of each variable for each activity and each subject.( This is the final data set )

I order to get from the data set originally obtained from the assignment to the final resul just run the run_analysis.R script.

The stepst that the code goes through:
1. Read the data from all the files ( Test and Train )
2. Merge the data ( Activity, Subject, Measured Data)
3. Assign the correct variable names ( Add factor info to the variable names )
4. Filter just the mean and the sd
5. Average based on activity and subject.
