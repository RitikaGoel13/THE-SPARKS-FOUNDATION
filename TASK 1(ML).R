#Import the data in R
student.data<-read.csv("C:\\Users\\User\\Desktop\\GRIP\\5_6215462502226985478.csv")

#Check if you have imported the correct data by checking the head
head(student.data)

#Plot the Hours studied against the scores
plot(student.data$Hours,student.data$Scores,xlab="Hours studied",
     ylab="Scores",main="Hours Studies VS Scores",col="blue")

#Make a linear regression model using 'lm' function
student.reg<-lm(Scores~Hours,student.data)
summary(student.reg)
abline(student.reg,col="red")
#Predict the percentage of a student by entering study hours
new_hour<-data.frame(Hours=9.25)
predict(student.reg,new_hour)

#The predicted score when the student studied for 9.25 hours is 92.9

#Check the error
p<-predict(student.reg)
AP<-data.frame(student.data$Scores,p)
AP
aberror<-mean(abs(student.data$Scores-p))
aberror




