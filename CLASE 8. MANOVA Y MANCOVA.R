#CLASE 8. MANOVA, MANCOVA Y Hotelling test

#OBJETIVO: Poder comparar y encontrar diferencias entre grupos a partir de vectores de medias, en modelos con múltiples variables de respuesta, mediante el uso
#de la prueba de Hotelling, MANOVA y MANCOVA.

#BASES: En esta clase utilizamos la base de datos de Iris
iris

#MANOVA
#NOS PERMITE EXAMINAR SI HAY DIFERENCIAS ENTRE 2+ GRUPOS TOMANDO EN CUENTA TODAS LAS VARIABLES. EN PARTICULAR EXAMINAMOS EL FECTO DE VARIOS FACTORES 
#(INCLUSO LAS INTERACCIONES) SOBRE UNA MATRIZ DE RESPUESTA 
#MANOVA: Compara los vectores de medias de dos o más grupos considerando múltiples variables de respuesta simultáneamente.

#HIPÓTESIS DE MANOVA
#Ho: x1= X2=x3
#Ha: .....
#Las pruebas posthoc para este análisis son anovas individuales (para cada una de las variables de respuesta)
#supuestos: 
#1. MULTI-NORMALIDAD
#2. HOMOGENEIDAD DE VARIANZA (EN LAS MATRICES varianza-covarianza)
#3. Hay independencia entre las observaciones 

#MANCOVA- Son los mismos supuestos
#MANCOVA: Comparar los vectores de medias de dos o más grupos controlando el efecto de covariables (variable continua que influye sobre la variable de respuesta)

#MANOVA, Función: manova()   data: iris
#MANCOVA Función: manova(Y especies+Z, data)

#PRUEBAS ESTADÍSTICAS
# a) Wilk´s Lambda: relación de los determinantes
# b) Hotelling_Lawley trace: relaciónde los determinantes
# c) Pillai trace: suma de los eigenvalores 

#EJECICIOS MANOVA
iris
View(iris)
attach(iris) #Permite usar directamente los nombres de las columnas.
respuesta1 <- cbind (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) #Función para construir la matriz
fit <- manova (respuesta1 ~ Species, data= iris) # objeto<- manova (variable de respuesta ~ variable dependiente, data)
summary.manova(fit) #miesntras mas grande valor de F, más significativo
#SALE VALOR DE F= 53.466 , VALOR DE P= < 2.2e-16, esto nos dice que rechazamos Ho, pero aún no sabemos que Ha aceptar
summary.aov(fit)

#PARA NO ESCRIBIR COLUMNA POR COLUMNA (SOLO ES OTRA FORMA DE PONER LA VARIABLE DE RESPUESTA)
fit1 <- manova (as.matrix(iris [ , 1:4])  ~ Species, data= iris)
fit1
summary.manova(fit1)
summary.aov(fit1)

#Prueba de shapiro para comprobar el primer supuesto:  MULTI-NORMALIDAD
library(rstatix)
head(iris)
mshapiro_test(iris [, 1:4]) #p= 0.0234

#Prueba para comrprobar segundo supuesto: HOMOGENEIDAD DE VARIANZA (EN LAS MATRICES varianza-covarianza)
box_m(iris [, 1:4], iris$Species) 
#p= 3.35e-20 es significativo, por lo cual el supuesto no se cumple

#MATRIZ DE VARIANZA-COVARIANZA/ MATRICES DE COVARIANZA
#Matrices de distancia

#Mancova ejercicio
#manova asumiendo que el largo de sepalo es la covariable
respuesta2 <- cbind ( iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width) # cbind(nos acomoda los valores de las variables en columnas, cada variable a acomodar )
fit2 <- manova (respuesta2 ~ Species+ Sepal.Length, data= iris)
summary(fit2)
summary.aov(fit2)
names(iris)

#Problemas: Los problemas que tuve no fueron en cuanto al código, más bien fue por entender los resultados
#que salen al imprimir los summary.

#APRENDIZAJE: Con esta clase aprendí la diferencia entre las pruebas multivariadas y univariadas, en este caso
#MANOVA Y MANCOVA como pruebas de multivariadas de ANOVA Y ANCOVA; además de la prueba de  Hotelling, prueba multivariada
#de la prueba de t, a lo que me refiero es que entendí a que se refiere el hecho de que sean pruebas multivariadas si
#visualizarlas como pruebas univariadas, esto entendiendo el concepto de vector de medias

