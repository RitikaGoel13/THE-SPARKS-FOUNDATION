#Import the data in R and check the head
data<-read.csv("C:\\Users\\User\\Desktop\\GRIP\\20201202_030540.csv")
iris_data<-data[,2:5]
head(iris_data)

#Create a function which calculates the differences with its cluster 
#centers using k-means
f<-function(k){
  within_diff<-kmeans(iris_data,k)$tot.withinss
}

#Plot these differences a to know where there is a kink
k<-1:15
plot(k,sapply(k,f),type="o",lwd=1,ylab="Square differences",
     xlab="Number of clusters",main="Elbow method")

#the optimum number if clusters is the point where we can see an
#elbow shape(kink), which in this case is 3
iris_model<-kmeans(iris_data,3)
iris_model

#Make a model using 3 custers
table(data$Species,iris_model$cluster)

#Plot the clusters 
plot(iris_data$SepalLengthCm,iris_data$SepalWidthCm,
     col=iris_model$cluster,pch=19,xlab="Sepal Length",
     ylab="Sepal Width",lwd=2,main="Clusters")

#Plot the centroids
points(iris_model$centers[,1:2],col="yellow",pch=19,lwd=2)

#Give appropriate legend
legend("topright",c("Iris-setosa","Iris-versicolour","Iris-virginica",
                    "Centroids"),col=c(unique(iris_model$cluster),
                                       "yellow"),pch=19)
