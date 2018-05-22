myData<-regData
install.packages("Rtsne", dependencies = TRUE)
library(Rtsne)
head(myData,2)
myData.Un<-unique(myData)
tsne <- Rtsne(myData.Un[,-14], dims = 2, perplexity=30, verbose=TRUE, max_iter = 500)


ir<-iris
head(ir,2)
ir<-unique(ir)
tsne<-Rtsne(ir[,-5], dims = 2, perplexity=30, verbose=TRUE, max_iter = 500)
names(tsne)
head(tsne$Y,2)
plot(tsne$Y)
summary(iris)
km<-kmeans(tsne$Y,centers = 3)
ts<-tsne$Y
ts<-as.data.frame(ts)
ts$clust<-km$cluster
head(ts)
plot(x = ts$V1, y = ts$V2, col=ts$clust)
