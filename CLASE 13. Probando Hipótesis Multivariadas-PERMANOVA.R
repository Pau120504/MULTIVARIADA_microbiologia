#CLASE 13: Probando Hipótesis Multivariadas- PERMANOVA  27/04/2026

#1. Objetivo: Poner a prueba hipótesis con datos multivariados 
#Generalmente este tipo de pruebas se hacen después de haber hecho un análisis de ordenamiento.
#Cargar la librería vegan
library(vegan)

#BASE DE DATOS: PARA ESTA CLASE UTILIZAMOS LA BASE DE DATOS DE NUESTRAS MEDICIONES
View(base)

##* PRUEBAS DE HIPÓTESIS: análisis de similitud y PERMANOVA
 
##* Análisis de similitud
##* Este análisis compara la distancia entre dos o más grupos. Ha : distancia entre grupos > distancia dentro de grupos. Ho: la distancia entre grupos es igual (no hay diferencia)
##* La función que utilizamos es vegdist y anosim.
##* vegdist: Saca la matriz de distancia
##* anosim: realiza el análisis para conocer las distancias entre grupos
#ENTONCES...

##* Primero tenemos que obtener la matriz de distancia y después hacemos el análisis.
# MATRIZ DE DISTANCIA
datos1 <- base [-41, ], #aquí excluímos el reglón 41 porque es una medición mal hecha que representa un outlier

datos2 <- datos1 [ , 3:16] # aquí mantuvimos todas las filas a excepción del que quitamos, y mantuvimos la columnas de la 3 a la 16
#para quitar a las variables categóicas no numéricas

dist_datos2 <- vegdist (datos2, method = "bray") # utilizamos el paquete vegdist para sacra matriz de distancia
#vegdist: primer argumento: matriz de base de datos, segundo argumento: método

#Análisis de la matriz de distancia- con función: anosim
#La idea de usar anosim es querer saber si la diferencia que ves es real o solo azar

fit1 <- anosim (dist_datos2, datos1$sexo, permutations = 1500)
fit1  #el valor de permutaciones tiene un impacto en el valor de p

#Resultados corriendo fit 1
#CON 1500 permutaciones

#ANOSIM statistic R:  0.59, el valor de R es el mismo idependientemente del valor de permutaciones
#Significance: 0.00066622, mientras más permutaciones, más te acercas al valor real de p, pero llega un punto en donde 
# el valor de p solo aumenta pero sigue siendo significativo, ya no tiene sentido agregar más permutaciones si ya habíamos llegado a un valor con p significativo



#Terms:
#                smoker      age      sex   weight smoker:age smoker:sex  age:sex smoker:weight
#Sum of Squares  184.6055   2.9250   6.0971  57.3480    15.2574     1.7051   8.0205       84.2042
#Deg. of Freedom        1        2        1        2          2          1        2             2
#                 age:weight sex:weight smoker:age:sex smoker:age:weight smoker:sex:weight
#Sum of Squares      9.4505     2.3112        11.6891           24.9873           19.5959
#Deg. of Freedom          4          2              2                 4                 2
#                   age:sex:weight smoker:age:sex:weight Residuals
#Sum of Squares          6.2758                1.3250  668.8796
#Deg. of Freedom              4                     2       477

#smoker es el factor más importante, con mayor efecto en la variación
#mientras que weight tiene efecto moderado en la variación
#age es un factor que explica poca de la variación

#El valor de R: Indica el tamaño de la separación entre grupos
#Vlor de p: Nos dice Qué tan raro es R bajo el azar

# b) PERMANOVA
#BÁSICAMENTE ES UN ANÁLISIS DE VARIANZA PERO AGREGANDO UN VALOR DE variable de respuesta= matriz de distancia
#USAMOS LA BASE DE DATOS: dune

#La Ha: SI EXISTE DIFERENCIA ENTRE LOS GRUPOS
#Es un análisis de varianza, pero nuestra variable de respuesta es la matriz de distancia.
#Ha : distancia entre grupos es diferente La función que utilizamos es adonis2. Haremos el análisis con los datos de “dune”. Estos datos están en dos partes. 
#dune contiene la abundancia de 30 especies en 20 sitios. dune.env contiene el metadata, todos los factores. Ya que tenemos la matriz de distancia, sólo tenemos que pensar en la fórmula del modelo estadístico.

data (dune)
data (dune.env)
dist_dune <- vegdist (dune, method = "bray")
fit1 <- adonis2 (dist_dune ~ Management*Use, data = dune.env, permutations = 999)
fit1
