runanalysis <- function () {
		
	## Read the Training Set
	data1 <-read.table ("./train/X_train.txt")

	## Read the Test Set
	data2 <-read.table("./test/X_test.txt")

	## Combine both sets of data into one
	cdata <-rbind(data1,data2)
	
	## Read the features list
	features <- read.table ("./features.txt")
	
	## Set the column names of the combined data
	colnames(cdata) <- features [,2]

	## Read the Training labels
	ytrain <-read.table("./train/Y_train.txt")

	## Read the Test labels
	ytest <-read.table("./test/Y_test.txt")

	## Combine both labels 
	activitylist <-rbind(ytrain, ytest)

	## Read the activity labels
	activitylbl <-read.table("./activity_labels.txt")
	colnames(activitylbl) <- c("activityid", "activity")

	## Read the train subjects
	trainSub <-read.table("./train/subject_train.txt")

	## Read the test subjects 
	testSub <-read.table("./test/subject_test.txt")

	## Combine the subjects into one set
	subjects <- rbind (trainSub, testSub)
	colnames(subjects) <-"subject"
	colnames(activitylist) <-"activityid"
	
	## extract only related columns - mean & std
	cdata2<-cdata[,grep("mean\\(\\)|std",colnames(cdata))]
	## change all column names to lower case
	colnames(cdata2)<-tolower(colnames(cdata2))
	## Remove brackets () and -
	colnames(cdata3)<-gsub("\\(\\)|-","",colnames(cdata3),)

	## Combine the activity and subject into the combined data
	cdata3<-cbind(activitylist,subjects,cdata3)
	
	cdata3<-cdata3[order(cdata3$activityid,cdata3$subject),]
	cdata3<-data.table(cdata3)
	cdata3<- cdata3[,lapply(.SD,mean,na.rm=TRUE),by=list(activityid,subject)]
	
	cdata3 <-merge(activitylbl,cdata3,all=TRUE)
	
	## Remove the activityid column
	cdata3 <-subset(cdata3 ,select=-(activityid))
	file<-tempfile()
	write.table(cdata3 ,"./tidydata.txt",sep=",",row.names=FALSE,col.names=TRUE,quote=FALSE)

		
}


