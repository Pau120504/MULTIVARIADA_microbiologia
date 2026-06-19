#CLASE 1- INTRODUCCIÓN
#Esta fue una clase de repaso de bioestadística

#ESTO ES UNA MODIFICACIÓN DE PRUEBA PARA GITHUB (2) 

#RECORADTORIO
#PARA INSTALAR PAQUETES: install.packages ("se pone el paquete entre comillas")
install.packages("Rmisc")
library (Rmisc) #SE DEBE CARGAR LA LIBRERÍA DEL PAQUETE
#CARGAR LA LIBRERÍA (FUNCIÓN): library

#DEBEMOS SACAR EL summarySE() de nuestra base de datos
#summarySE(): Recordar que esta función nos da un resumen de la base de datos
#Nos da la media, desviación estándar (la cual es la dispersión de los datos), tamaño de la muestra (n)
#y el error estándar (estimación de la variabilidad). Básicamente nos resume la información de una variable continua 
#dentro de una base de datos

#En esta clase usamos la base de datos ChickWeight
ChickWeight  #La corrimos para verla y comprobar que se ha cargado
#Primero creamos un objeto para sacar el summarySE de una variable numérica de nuestra base de datos
#en este caso para el peso y queremos que ese resumen sea por cada dieta

#CÓDIGO
resumen <- summarySE(ChickWeight, measurevar = "weight", groupvars = "Diet") #Objeto llamado "resumen"
#sacamos el summarySE de la base de Chickweight, measurevar: Indica con qué variable va a realizar la medición (sacar promedio),
#en este caso lo hicimos con el peso "weight"
#y groupvars: Indica con qué variable realizará los grupos 
#Ya en conjunto sacará los promedios del peso por dieta.

#Imprimimos el objeto con la función "print"
print(resumen) #LO QUE CORRE ES UNA TABLA CON DIET, N = individuos por dieta, weight= saca el promedio del peso en cada dieta
# saca la desviación estándar, el error estándar y el intervalo de confianza

#AHORA: PARA SACAR LAS GRÁFICAS COMO HISTOGRAMA, BOXPLOT, ETC
library(ggplot2) #cargamos la librería de ggplot2
#PARA HACER UN HISTOGRAMA
grafica <- ggplot(ChickWeight, aes(x= weight))+ #creamos un objeto <- ggplot(BaseD, aes, (x=variable que irá en el eje X)+
  geom_histogram(fill="red", colour="blue")  #usamos la función para hacer histogramas: geom_histogram p (fill= "ponemos el color del que queremos el relleno de las barras")
print(grafica)  #colour= "colocamos el color del que queremmos las orillas de las barras"
#finalmente imprimimos el objeo para visualizar la gráfica

#BOXPLOT
grafica0 <- ggplot(ChickWeight, aes(x= weight))+ #creamos un objeto <- ggplot(BaseD, aes, (x=variable que irá en el eje X)+
  geom_boxplot(fill="purple") #usamos la función geom_boxplot, la cual es para hacer un boxplot con ggplot
print(grafica0) #imprimimos el objeto para ver el boxplot

grafica2 <- ggplot(ChickWeight, aes(x= Diet, y= weight))+ #creamos un objeto <- ggplot(BaseD, aes, (x=variable que irá en el eje horizontal, y= variable que irá en eje vertical)+
  geom_boxplot(fill="purple", colour="lightblue") #Para agregar color, fill= "colocamos el color la caja",colour= "colocamos el color de las orillas de la caja
print(grafica2) #Imprimir objeto y ver gráfica

#ESTO ES PARA HACER UN BOXPLOT CON UNA CAJA PERSONALIZADA POR DIETA
grafica3 <- ggplot(ChickWeight, aes(x= weight, y= Diet, fill= Diet))+ #Aquí cambiamos la orientación, únicamente cambiando las variables de los ejes, además colocamos fill= Diet, para indicar que el relleno de la cada caja será por dieta
  scale_fill_manual(values = c("1"="red", "2"= "pink", "3"= "white", "4"= "cyan"))+ #Ahora utilizamos la función  scale_fill_manual (values = c("1"="red", "2"= "pink", "3"= "white", "4"= "cyan") para colocar los nombres de las dietas (1,2,3,4), y a cada uno le asignamos su color
geom_boxplot() #Usamos la función geom_boxplot() que es para hacer el boxplot
print(grafica3)# imprimimos el objeto y vemos la gráfica


#PARA HACER UN DENSITY PLOT
grafica4 <- ggplot(ChickWeight, aes(x= weight))+ #aes: indica la estética, en este caso señalamos que queremos el peso en el eje x
  geom_density(colour= "red") #Usamos geom_density para hacer un density plot con ggplot2
print(grafica4) #Imprimimos

#AHORA CON LA BASE DE DATOS ORANGE
Orange #CARGAMOS LA BASE 
regresion <- lm(age ~ circumference, Orange) #REALIZAMOS UNA REGRESIÓN, PARA ESO CREAMOS OBJETO <- usamos lm (de linear model), (colocamos variable de respuesta  ~ Variable independiente, Base de datos )
summary(regresion) #Sacamos el summary del objeto, el cual da los residuales: (diferencia entre valores reales y predichos), coeficients: 
#(Intercept):  valor de age cuando circumference = 0
#circumference: cuánto cambia age por cada unidad que aumenta circumference
print(regresion)#finalmete imprimios el objeto, el cual nos da un resumen más generalizado de nuestro objeto
