# Set working directory and read data
import os
import pandas as pd


datos = pd.read_csv("iris.csv", sep=";", decimal=".", header=0)
print(datos)

# Segment the dataset
from sklearn.model_selection import train_test_split

X = datos.iloc[:, :-1]
y = datos.iloc[:, -1]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1)

# Create and train the model
from sklearn.naive_bayes import GaussianNB

modelo = GaussianNB()
modelo.fit(X_train, y_train)
print(modelo)

# Evaluate the model
y_pred = modelo.predict(X_test)
print(y_pred)

# Create confusion matrix
from sklearn.metrics import confusion_matrix

MC = confusion_matrix(y_test, y_pred)
print(MC)

# Calculate accuracy and error rate
acierto = sum([MC[i][i] for i in range(3)]) / sum(sum(MC))
print(acierto)
error = 1 - acierto
print(error)
