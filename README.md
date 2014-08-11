#Readme

Run the "run_analysis.R" script.
This script will perform the following:
* combine the data from both the test and train sets
* assign names for each of the columns based on the features data set
* combine the above with the activity and subject data sets so that each row from the above sets corresponds to a specific subject and activity
* Keep only the relevant columns (columns relating to mean and standard deviation) in the data set
* Calculate the mean for each column group by the activity and subject
* Replace the activity column (based on ID) by its corresponding activity description
* Write the data into the csv file

### Instructions
* Run the script by doing the following:-
	source("run_analysis.R")
	runanalysis()
	
* Once the function completes, go to the working directory and open the resultant csv file named "tidydata.csv"

