import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix

# read the data from csv file
datos = pd.read_csv("iris.csv", sep=";", decimal='.', header=0)

# create a random sample of size 50 from the data
muestra = datos.sample(n=50)

# separate the sample into testing data and training data
ttesting = muestra
taprendizaje = datos.drop(muestra.index)

# create the KNN classifier model with kmax=9
modelo = KNeighborsClassifier(n_neighbors=9)
modelo.fit(taprendizaje.iloc[:, :-1], taprendizaje.iloc[:, -1])

# predict the target values of the test data using the model
prediccion = modelo.predict(ttesting.iloc[:, :-1])

# create a confusion matrix to evaluate the accuracy of the model
MC = confusion_matrix(ttesting.iloc[:, -1], prediccion)

# calculate the accuracy and error rates of the model
acierto = sum(MC.diagonal()) / MC.sum()
error = 1 - acierto

# print the results
print(MC)
print("Accuracy:", acierto)
print("Error rate:", error)
