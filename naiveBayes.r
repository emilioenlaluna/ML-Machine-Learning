install.packages('e1071',dependencies=TRUE)

library(e1071)

setwd("C:/Users/emili/Downloads/iris")
datos<- read.csv("iris.csv",sep = ";",dec=".",header = TRUE)
datos

#segmenta la tabla (dataset)

muestra<-sample(1:105,45)
muestra



ttesting<-datos[muestra,]
ttesting

taprendizje<-datos[-muestra,]
taprendizje
dim(taprendizje)

#sise capas ocultas
#rang pesos iniciales
#

modelo<-naiveBayes(tipo~.,data=taprendizje,size=6)
modelo


#Que tan bien predice el modelo
prediccion<-predict(modelo,ttesting[,-5])
prediccion

#Matriz de confusiOn
MC<-table(ttesting[,5],prediccion)
MC

#Porcentaje de buena clasificaciOn
acierto<-(sum(diag(MC)))/sum(MC)
acierto
error<-1-acierto
error
