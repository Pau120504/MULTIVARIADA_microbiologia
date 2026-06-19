
#CLASE 12.ANÁLISIS DE COORDENADAS PRINCIPALES (PCoA)
#OBJETIVO: Reducir la dimensionalidad de una matriz de distancias para identificar patrones de agrupación y separación entre observaciones.
#BASES. En esta clase utilizamos las bases de datos: Base de datos de mediciones del grupo y mtcars
BASE
mtcars

#disminuyte el número d dimensiones para poder visualizar las distancia entre pares de objetos
#La diferencia entre el PCA y PCoA es que el PCA se basa en una matriz de varianza-covarianza, mientras que el PCoA se basa en matrices de distancia
##CUÁLES SON LAS MÉTRICAS DE DISTANCIA
##se puede hacer uso de cualquier método de distancia; si utilizamaos la distancia "chi-square"
#El ANALISIS DE ORDENAMIENTo se hace primero y luego se analisis estadístico

#ordenamos a todas nuentras muestras
#los eigen vectores en un PCA= el peso que tienen cada una de las variables en formar las combinaciones lineales
#cUÁLES SON LAS MÉTRICAS DE DISTANCIA, para qué sirven?

install.packages("vegan")
library(vegan)
#FUNCIÓN : vegdist
#NOS DA ESTAS MÉTRICAS DE DISTANCIA:  "manhattan", "euclidean", "canberra", "clark", "bray", "kulczynski", "jaccard", "gower", "altGower",
#"morisita", "horn", "mountford", "raup", "binomial", "chao", "cao", "mahalanobis", "chisq", "chord",
#"hellinger", "aitchison", or "robust.aitchison".

#LA FUNCIÓN dist nos da estas: 
#La funión cmdscale: nos da las observaciones acomodadas de acuerdo al número de 
View(mtcars)
mtcars
vd <- mtcars [, c(2,4,8,9,10,11)]
vd
cmdscale
matriz1 <- vegdist(mtcars, method ="euclidean" )
a1 <- cmdscale(matriz1, k=2)
a1
#PARA GRAFICAR
x <- a1 [,1]
y <- a1 [,2]
grafica1 <- plot(x,y, xlab="Coordenada 1", ylab = "Coordenada 2")

#OTRO EJEMPLO CON LA BASE DE DATOS DE NUESTRAS MEDICIONES

base2 <- BASE [, -c(1,2)]  #esta base de datos tiene columnas con caracteres, por ello las quitamos, también podríamos transformalos a datos numéricos
base2 #imprimimos el objeto
matriz2 <- vegdist (base2, method= "canberra")  #utilizamos la función vegdist
a2 <- cmdscale (matriz2, k=2)
a2
x <- a2 [,1]
y <- a2 [,2]
grafica2<- plot(x,y, xlab="Coordenada 1", ylab = "Coordenada 2") #Dentro de esta gráfica hay un outlier que tiene mediciones incongruentes,
#por quitamnos mejor esa observación

base3 <- BASE [-(41), -c(1,2)]
base3
matriz3 <- vegdist (base3, method = "bray")
a3 <- cmdscale ( matriz3, k=2)
a3
x <- a3 [,1]
y <- a3 [,2]
grafica3 <- plot (x,y,  xlab="Coordenada 1", ylab = "Coordenada 2")

#CON LA GRÁFICA CORRIDA NO PODEMOS DISTINGUIR ENTRE HOMBRES Y MUJERES, PARA ELLO AGREGAMOS ETIQUETAS
etiquetas  <- BASE$sexo
colores <- function(variable)
{if (lenght(grep ("mujer", variable)))
{"deeppink"}
else
{"blue"}}

etiquetas_colores_sexo <- unlist (loppy(etiquetas))

base3 <- BASE[-41, -c(1,2)]
matriz3 <- vegdist(base3, method = "bray")
a3 <- cmdscale(matriz3, k = 2)

x <- a3[,1]
y <- a3[,2]
nombres <- BASE[-41, 1]
sexo <- BASE[-41, 2]
colores <- ifelse(sexo == "Hombre", "blue", "red")
plot(x, y,
     xlab = "Coordenada 1",
     ylab = "Coordenada 2",
     col = colores,
     pch = 19)
text(x, y,
     labels = nombres,
     pos = 3,
     cex = 0.7)
legend("topright",
       legend = c("Hombre", "Mujer"),
       col = c("blue", "red"),
       pch = 19)
                                        
                                   