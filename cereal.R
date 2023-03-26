library(caret)
library(readxl)
library(tidyverse)
library(dplyr)
library(ggfortify)
library(STAT)
library(outliers)
library(factoextra)
library(cluster)


getwd()
cereal_data= read.csv("cereal.csv")
view(cereal_data)


## Normalizing - min max

process <- preProcess(as.data.frame(cereal_data), method=c("range"))

norm<- predict(process, as.data.frame(cereal_data))

cereal_data2 <- norm |> select(4,5,6,7,8,9,10,11,12,13,14,15)

#number of clusters , screeplot
fviz_nbclust(cereal_data2,kmeans, method="wss")

## Creating clusters using k-means, where k = 5
#K-means
km_cereal2=kmeans(cereal_data2,centers = 5)
km_cereal2
library(factoextra)
fviz_cluster(km_cereal2,cereal_data2)

#Appending the cluster to original data
cereal_data=cereal_data%>%mutate(clusters=km_cereal2$cluster)
View(cereal_data)


write.csv(cereal_data,"/Users/amiteshjk/Desktop/5cluster.csv")

## K=3

cereal_data= read.csv("cereal.csv")
cereal_data3 <- norm |> select(4,5,6,7,8,9,10,11,12,13,14,15)

#number of clusters , screeplot
fviz_nbclust(cereal_data3,kmeans, method="wss")

## Creating clusters using k-means, where k = 3
#K-means
km_cereal3=kmeans(cereal_data3,centers = 3)
km_cereal3
library(factoextra)
fviz_cluster(km_cereal3,cereal_data3)

#Appending the cluster to original data
cereal_data=cereal_data%>%mutate(clusters=km_cereal3$cluster)
View(cereal_data)

write.csv(cereal_data,"/Users/sanjana/Desktop/3cluster.csv")

