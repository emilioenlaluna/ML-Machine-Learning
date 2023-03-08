

setwd("C:/Users/emili/Downloads")
datos<-read.csv("prostate.csv",sep=",",dec='.',header=TRUE)
head(datos)
cor(datos)
modelo<-lm(lpsa~lcavol,data=datos)
modelo
plot(datos$lcavol,datos$lpsa,col="red")
abline(modelo,col="blue")

pred<-predict(modelo,data.frame(lcavol=c(0.70,0.41,-0.23)))
pred

modelo<-lm(lpsa~age,data=datos)
modelo

pred<-predict(modelo,data.frame(age=c(45,77,58)))
pred

plot(datos$age,datos$lpsa,col="red")
abline(modelo,col="blue")


