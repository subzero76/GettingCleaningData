#Readme

Run the "run_analysis.R" script.
This script will perform the following:
1. combine the data from both the test and train sets
2. assign names for each of the columns based on the features data set
3. combine the above with the activity and subject data sets so that each row from the above sets corresponds to a specific subject and activity
3. Keep only the relevant columns (columns relating to mean and standard deviation) in the data set
4. Calculate the mean for each column group by the activity and subject
6.Replace the activity column (based on ID) by its corresponding activity description
7. Write the data into the csv file
---

### Instructions
1. Run the script by doing the following:-  
	source("run_analysis.R")  
	runanalysis()  
	
2. Once the function completes, go to the working directory and open the resultant csv file named "tidydata.csv"  

