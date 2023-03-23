#packages.install("ROCR",dependencies=TRUE)
library(ROCR)

pred<-prediction(c(0,0,0,0,0,1,1,1,1,1),c(0,1,0,1,0,1,1,1,1,1))

perf<-performance(pred,"tpr","fpr")

plot(perf,col="red")
segments(0,0,1,1,col="black")

grid()

