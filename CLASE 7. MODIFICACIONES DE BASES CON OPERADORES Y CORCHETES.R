#MODIFICACIONES DE BASES DE DATOS

#OBJETIVO: Aprender a modificar bases de datos desde R, excluyendo datos, ya sea renglones o columas o de forma contraria
#seleccionando el conjunto de datos que se desea mantener, así como la modificación de bases de datos usando 
#operadores

#BASE DE DATOS: En esta clase utilizamos la base de datos de mediciones del grupo, la de ChickWeight y la de Iris
BASE
ChickWeight
iris

#RECORDAR, LOS CORCHETES AYUDAN A MANTENER Y QUITAR SOLO LOS ELEMENTOS DENTRO DEL CORCHETE
#[X, Y]----[RENGLONES, COLUMNAS]
#PARA EXCLUIR O MANTENER DATOS DE UNA BASE DE DATOS
#PRIMERO CREAMOS UN OBJETO <- DATA [X, Y]
#ejemplo
objeto1 <- BASE2 [,2] #aqui mantengo todos los renglones de la columna sexo
objeto1
View(BASE2)
#para mantener más de dos columnas
objeto2 <- BASE2 [, c(4,6, 7)]
objeto2
#PARA QUITAR ELEMENTOS SE USA EL SIGNO MENOS
objeto3 <- BASE2 [-c(8,10,5),]
objeto3

#SE PUEDE HACER LO MISMO PERO PARA QUITAR RENGLONES, O SLECCIONAR CIERTOS RENGLONES

#PARA MANTENBER RENGLONES QUE TENGA INFORMACIÓN ESPECÍFICA, Pj, Renglones que marquen solo "mujer"
objeto6 <- BASE2 [which (BASE2$sexo == "hombre"), ] #usamos which obtener las posiciones donde una condición es verdadera
objeto6  #Se seleccionan todos los renglones que correspondan a mujeres y todas las columnas

#PARA MANTENER INFORMACIÓN CON MÁS CONDICIONES
objeto7 <- BASE [ which (BASE$sexo == "mujer" & BASE$altura <= 155) , ]
objeto7 #ADEMÁS DE SELECCIONAR ÚNICAMENTE A LAS OBSERVACIONES QUE CORRESPONDAN A MUJERES, TENDRÁN QUE TENER UNA ESTATURA DE 1.55 PARA ABAJO

#FUNCIÓN: subset, sirve para seleccionar directamente filas o columnas usando condiciones.
objeto7 <- subset (BASE, sexo == "mujer" & altura <= 155)
objeto7    #Se seleccionan todas las filas que corresponden a mujeres de 155cm de altura o menos


#EJERCICIOS
View(ChickWeight)
#Utilizando la base de datos ChickWeight crea nuevos objetos que tengan
#(a) quedarse con todas las columnas solo con dieta 2
objeto10 <- ChickWeight [221:340, ]
objeto10
#las columnas weight+ time , pero solo los pollitos de la dieta 4
objeto11 <- ChickWeight [461:578, c(1,2)]
objeto11
#todas las columnas pero solo las dietas 1 y 4
objeto12 <- ChickWeight [c(1:220, 461:578), ]
objeto12
#todas las columnas , pero solo los pollitos que pesen mas de 100
objeto13 <- ChickWeight [ which (ChickWeight$weight > 100), ]
objeto13
#las tres primeras columas, pero solo los pollitos del tiempo 10
objeto14 <- ChickWeight [which (ChickWeight$Time == 10), c(1,2,3)]
objeto14

#UTILIZANDO LA BASE DE DATOS "iris"
View(iris)
# que contega unicamente especies 
objeto15 <- iris [ , 5]
objeto15
#que contenga todas las variables, menos species
objeto16 <- iris [ , 1:4]
objeto16
#que contenga unicamente flores con longitud del sépalo mayores a 5.0 
objeto17 <- iris [which (iris$Sepal.Length > 5.0), ]
objeto17
#que contenga unicamente a la especie setosa
objeto18 <- iris [which(iris$Species == "setosa"), ]
objeto18
#que contenga a las especies virginica y versicolor
objeto19 <- iris [which(iris$Species == "virginica" | iris$Species == "versicolor") , ]
objeto19

#OPERADORES EN R
#OPERADOR PIPE
#INSTALAR PAQUETE dplyr
install.packages("dplyr")
library(dplyr)

#Ejemplos para usar el operador pipe
#df %v% select (col1, col2)
#df %v% select (-col1)
#df %v% select (starts_with ("sepal"))

#PARA FILTRAR RENGLONES, quitar o poner - EQUIVALENTE A SUBSET
#df %v% filter (col1, col2)
#df %v% filter (-col1)
#df %v% filter (starts_with ("sepal"))

#PARA ORDENAR LOS RENGLONES
#df %v% arrange (Sepa.lenght) # reorganiza los renglones de valor mas chico a la mas grande

#CREAR O MODIFICAR COLUMNAS
#df %>% mutate (sepal.area= sepal. lenght*sepal. width)
#df %>% mutate (log_area= log(sepal. Area))

#para reordenar las columnas
#df %v% relocate (Sepa.lenght, .after= Species)

#para hacer un resumen estadístico, pero funciona mejor summarySE
#df %v% summarise (mean_lenght= mean (sepal.lenght))

#USAR EL OPERADOR PIPE PARA HACER MUCHAS COSAS
#filter (species == "setosa") %<%
#mutate(Sepal. Area = Sepal.lenght *Sepal.width) %>%
#group_by (Species) %>%
#summarise (mean_area= mean)

#EJERCICIOS EN CLASE
View(ChickWeight)
str(ChickWeight)
names(ChickWeight)
ChickWeight

#(a) quedarse con todas las columnas solo con dieta 2
ChickWeight %>% filter (Diet == 2)

#las columnas weight+ time , pero solo los pollitos 4
ChickWeight %>% filter (Diet == 4) %>% select (weight, Time) 


#todas las columnas pero solo las dietas 1 y 4
ChickWeight %>% filter (Diet == 1 | Diet == 4) 

#todas las columnas , pero solo los pollitos que pesen mas de 100
ChickWeight %>% filter (weight > 100 ) 

#las tres primeras columas, pero solo los pollitos del tiempo 10
ChickWeight %>% filter (Time == 10) %>% select (weight, Time, Chick) 

#UTILIZANDO LA BASE DE DATOS "iris"
View(iris)
# que contega unicamente especies 
iris %>% select (Species)

#que contenga todas las variables, menos species
iris %>% select (-Species)

#que contenga unicamente flores con longitud del sépalo mayores a 5.0 
iris %>% filter (Sepal.Length > 5)

#que contenga unicamente a la especie setosa
iris %>% filter (Species == "setosa")

#que contenga a las especies virginica y versicolor
iris %>% filter (Species == "virginica" | Species == "versicolor")

#RESULTADOS: Tanto en los ejercicios de uso de los corchetes como en los que se usó el operador pipe
#se lograron modificar correctamente las bases de datos de iris y chickWeight, cada una con las condiciones puestas.

#Problemas: El único problema que tuve fue a la hora de colocar condiciones específicas, como la altura o el sexo, en las que 
#me marcaba error pero esto se debe ponía las condiciones de una forma diferente a como se encontraba realmente en la base
#de datos, por ejemplo en la base de datos la altura está en centímetros y yo las ponía en metros, o en el sexo ponía "Mujer"
#cuando en la base está como "mujer"

#APRENDIZAJE: Con esta clase me llevo un gran aprendizaje en cuanto a cómo modificar una base de datos,
#sobre todo hablando de la odificación con corchetes, en realidad usando el operador pipe se me hizo más complicado


