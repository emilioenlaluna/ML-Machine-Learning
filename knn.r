##install.packages('kknn',dependencies=TRUE)
library(kknn)
setwd("C:/R/MACHINE_LEARNING/Datos")
#rm(list=ls(all=TRUE))  # BORRA TODAS LAS VARIABLES DE MEMORIA
datos<-read.csv("iris.csv",sep = ";",dec='.',header=T)
datos
muestra <- sample(1:150,50)
muestra
ttesting <- datos[muestra,]
ttesting
#dim(ttesting)
taprendizaje <- datos[-muestra,]
#dim(taprendizaje)
taprendizaje
# train.kknn 
modelo<-train.kknn(tipo~.,data=taprendizaje,kmax=9)
modelo

# que tan bien predice el modelo
prediccion<-predict(modelo,ttesting[,-5])
prediccion

## Matriz de Confusion

MC<-table(ttesting[,5],prediccion)
MC

# Porcentaje de buena clasificaci�n

acierto<-(sum(diag(MC)))/sum(MC)
acierto
error<-1-acierto
error

