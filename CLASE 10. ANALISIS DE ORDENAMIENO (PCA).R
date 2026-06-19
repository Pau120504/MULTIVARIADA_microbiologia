#CLASE 10. ANALISIS DE ORDENAMIENO

#OBJETIVO:Aprender a reducir la dimensionalidad de un conjunto de datos multivariados mediante 
#componentes principales que expliquen la mayor parte de la variación observada.

#BASES DE DATOS: Iris
iris

#Las tecnicas de ordenamiento crean nuevas  variables (ejes principales) a lo largo de las cuales se ordenan las muestras
#Vemos comose ordenn nuestras muestras a lo largo de las distuintas variables que estamos miediendo
#La ordenación también se puede utilizar para discriminar o separar muestras a lo largo de los ejes principales
#oRDENAMOS NUESTRAS OBSERVACIONES EN DOS EJES PRINCIPALES
#EL NOMBRE DE NUESTROS EJES PRINCIPALES DEPENDE DEL ANÁLISIS DE ORDENAMIENTO QUE UTILIZAMOS: SI UTILIZAMOS UN ANALISIS DE FACTOR
#LOS EJES SE LLAMARÁN FACTOR 1, FACTOR 2

#ANALISIS DE COMPONENTES PRINCIPALES (PCA)
#OBJETIVO: Reducir la dimensionalidad de los datos multivariados creando nuevas
#Centroide: centro estimado calculando el promedio de los valores de ambas variables, tomando un plano con ejes (x,y)
#Ejemplo
#Con la base de datos de mediciones del cuerpo, tomando en cuenta dos variables, medición de altura y el cuello
#Esas variables son las variables de respuestas
#ubicamos las mediciones del cuello en eje Y, y las medicones de la altura en el eje X
#ya teniendo la grafica con la nube de puntos ubicamos el centroide
#posteriormente ubicamos el centroide en el origen de la gráfica (0,0)
#Colomas la mejor línea de ajuste (asumamos que lo hicimos con analisis de verosimilitud)
#Después medimos la ditancia de cada observación con 

#Mínimos cuadrados: Hace minima la diferencia entre el valor observado y los predichos
#*Analisis para estimar lineas de ajuste: maxima verosimilitud...
#Qué significa el eigen valor dado: 
#El eigen vector: es la medición que haces para posicionarte en el primer componente principal
#Z score
#Luego de trazar el primer componente principal debes trazar el segundo componente principal es la misma línea del primer componente principal
#pero completamente perpendicular y ortogonal al primer componente pricipal
#se rotan los ejes para ya obetener nuestros eje de una gráfica
#generalmente el componente principal casi siempre explica más del 50% de la variación
#Cda componente principal tiene un eigenvalor y el número de eigenvectores es igual al numero de variables que se tienen

#En R
#LA FUNCIÓN QUE UTILIZAREMOS ES: prcomp
prcomp
install.packages("prcomp")
#el PCA se hace con matrices de correlación y de varianza-covarianza
#   se hace con matrices de distancia

iris
iris1 <- iris [, 1:4]
iris2 <- as.matrix(iris1)
fit1 <- prcomp (iris2, scale. = TRUE)
fit1
summary(fit1)

#Problemas:El problema que tuve fue más de tipo conceptual, me costó comprender la relación con los
#eigen valores y eigen vectores

#APRENDIZAJE: En esta clase aprendí cual es el objetivo del PCA y la reducción de dimesiones
#además de comprender que todo es en base de combinaciones lineales .
