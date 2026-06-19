#CARAS DE CHERNOFF

#OBJETIVO: Visualizar datos multivariados mediante caras de Chernoff para facilitar la comparación entre individuos u observaciones.
#ÚNICAMENTE ES UN ANÁLISIS VISUAL, NO ES UN ANÁLISIS ESTADÍSTICO

#CARAS DE Chernoff: nos ayuda a conocer características o similitudes rápido entre variables
#las caras de chernoff no se hacen tomando en cuenta todos los renglones de una base muy grande
#Las caras de chernoff solo nos permiten medir 15 variables, si tenemos más de 15, solo mide las 15 primeras
##Cuando tenemos menos variables de 15, se va a rellenar y repetir las que tenemos.
#Las caras de chernoff se hacen con las variables, cada parte de la cara es una variable,cada renglón/observación será una carita

#EN esta clase utilizams la base de datos del grupo Y base de datos IRIS
BASE
iris

#EJERCICIO CON BASE DE DATOS
install.packages("aplpack")# esta librería es para hacer las caras de chernoff y significa " Another Plot Package"
library(aplpack)# instalar y cargar la librería
View(iris)
objeto1 <- BASE [, -c(1,2)]  #Quitamos las columnas con datos discretos
objeto1
as.matrix(objeto1)  #Transformamos la base en matriz
faces (objeto1) #Función: Faces, es para las caras de chernoff
faces (objeto1, labels = BASE2$id) #esto parte del código es para que ponga los nombres, labels (Etiquetas)= la etiquetas serán los ID

#RESULTADO: Se imprimes las caras, cada una corresponde a una persona de la base de datos y están identificados por el ID
#Se ven múltiples formas de caritas, lo que nos dice que las mediciones de las variables si cambian entre cada observación, por otro lado
#hay caritas que se parecen más entre sí, esto nos dice que esas mediciones entre las observaciones son similares.


#EJERCICIO por hombre/mujer
#un objeto con dos renglones, cada uno con su promedio

objeto3 <- BASE[which (BASE$sexo == "mujer" | BASE$sexo == "hombre"), ] #separamos la base de datos por hombre y mujer
objeto3
objeto4 <- objeto3 [, -c(1,2)] #ESTO ES PARA QUITAR LAS COLUMNAS CATEGÓRICAS, quitar ambas al mismo tiempo
objeto4
objeto5 <- colMeans (objeto4, na.rm = FALSE) #colMeans saca los promedios de cada columna, na.rm= para quitar los valores de NA
objeto5
objeto6 <- matrix(objeto5, nrow=2) #Para convertir la base de datos en una matriz de 2x7
objeto6

#PARA HACER LAS CARAS DE CHERNOFF DE LA BASE DE DATOS POR HOMBRE Y MUJER
objeto7 <- BASE %>% group_by(sexo)%>% # esta parte del código es para agrupar los datos de la base según la variable de sexo, separando en hombre y mujer
summarise( across (where (is.numeric), mean))  #summarise: para sacar el resumen de cada grupo por hombres y mujeres, is.numeric: selecciona solo datos numéricos
objeto7                                            #y saca los promedios, across: es una función para hacer todo lo anterior en las variables seleccionadas
objeto7 <- ungroup(objeto7)  #ungroup: elimina la agrupación por sexo del objeto 7
objeto8 <- as.matrix (objeto7 [, -1]) #hacer la atriz del objeto 7 pero sin la columa de sexo
faces(objeto8, labels= objeto7$sexo,  face.type = 2) #línea de código para hacer las caras, usando el último objeto
#, labels= para poner las etiquetas por sexo, face.type= indica el estilo de las caras, en este caso en con gorrito y barba navideña

#RESULTADO: Se agruparon todos las mediciones en dos grandes grupos, el de hombres y el de mujeres
#únicamente salen las dos caras y se ven claras diferencias entre ambos grupos, pero es lo único que se logra visualizar a simple vista
#La caras son muy diferentes, lo que nos dice que las características y mediciones en ambos grupos son completamente diferentes.

#AHORA CON EL EJEMPLO PERO CON IRIS
View(iris)
objeto9 <- iris %>%   #para grupar por especies 
  group_by(Species) %>% 
  summarise( across (where (is.numeric), mean))  #agrupar datos solo numéricos
objeto9
objeto10 <- ungroup(objeto9)
objeto10
objeto11 <- as.matrix (objeto10 [ , -1])  #quitar la primera columna que es categórica
faces(objeto11, labels= objeto10$Species)# imprime las caras

#RESULTADOS: lo que nos sale so tres caras que corresponden a las tres especies de la base iris, las tres mantienen
#diferencias, sin embargo, se puede observar que virgina y versicolor son ligeramente parecidas debido a que ciertos rasgos de la cara 
#son parecidos

library(dplyr)
install.packages("dplyr")
library(aplpack)
View(container)
library(tidyverse)

#PROBLEMAS: En esta clase si tuve varios problemas de código, el primero fue al usar la función calMeans, que me
#marcaba un error, otro problema que tuve fue al usar %>%, ese me costó más porque seguía marcándome error,
#tambipen tuve otro error al crear la matriz y en esta línea de código: BASE$sexo == "mujer" | BASE$sexo == "hombre"

#APRENDIZAJE: En esta clase aprendí principalmente a corregir los problemas de código que tuve, sin embargo,
#tuve que recurrir a la inteligencia artificial para poder solucionarlo, aún con todo ello pude saber en qué me había equivocado
#Aprendí a solucionar los problemas al usar  %>%, lo primero que entendí es que se debe cargar la librería, además de que al usarlo
#debe colocarse al inicio y final de la línea de código. Otra cosa fue al usar colMeans y es que supe que no me marcaba un erro porque
#la base de datos que estaba usando aún tenía datos no numéricos, por lo que la función no puede calcular los promedios de esos datos.
#el problema de la matriz fue que yo estaba colocando ajustando los renglones y columnas de forma que la matriz no se podría acomodar porque el 
#número de datos no coincidía para hacer una matriz cuadrada.
#Finalmente la parte del código BASE$sexo == "mujer" | BASE$sexo == "hombre" al inicio había usado &, lo cual me daba un objeto vacío, sin datos 
#y esto era porque en la base de datos no hay ninguna observación en el que haya una mujer y hombre al mismo tiempo.

