#CLASE 11. ANÁLISIS DE CLASIFIFCACIÓN

#CLASE 23/03/2026---Análisis y visualización de resultados
# Objetivo: Aprender a clasificar observaciones en grupos homogéneos a partir de su similitud multivariada.
#BASES DE DATOS: Iris, USArrest y mtcars
iris
USArrests
mtcars

# ANÁLISIS DE CLASIFICACIÓN
# CLASIFICACIÓN: Es un proceso medinte el cual agrupamos objetos similares en grupos bien definidos que pueden distinguirse 
# de otros grupos.
# ANÁLISIS DE CLASIFICACIÓN
# *Cluster analysis (análisis de conglomerados) : hay de partición y jerárquicos
#  El de partición consiste en dividir la muestra y de esa división es por, qué tan parecidos son, así quedan grupitos de cierta cantidad. Cada grupo tiene elementos que se parecen.
#  El jerarquico consiste en dividir la muestra por un cierto orden, como por tamaño.
# *Análisis de determinantes
# *Random forest
# De esos tres análisis se parece más el random forest con el anaálisis de clusters
#
# ANÁLISIS DE CLUSTERS
# ESTE ANÁLISIS hay n objetos, cada objeto tiene p variables que describen al elemento de estudio
# Ejemplo: características de caracoles de distintas zonas 
# p: país, ciudad, circularidad el caracol, tamaño del espiral.
# Mientras el valor comparado con otro lavlor sea menor, quiere decir que son más parecidos: Si es 0, quiere decir que son idénticos esos dos grupos.
# FUNCIONES
# ANÁLISIS DE PARTICICIÓN : kmeans()
# ANÁLISIS JERÁRQUICO : hclust()
##Un Fenograma/dendograma: Ilustra características morfológicas que son visibles
##Un Árbol filogenético: Ilustra la secuencia de nucleótidos que son parecidas, así se van agrupando

#Ejercicios en R
# 1. Partición: kmeneas() data: Iris
#con tres cñusters
iris1 <- iris [ , 1:4] # Primero creo un objeto con la bse de datos sin los datos categóricos
fit <- kmeans (iris1, 3) #Se usa la función kmeans con el objeto anterior y se pine el número de clusters que queremos
fit #imprime
#K-means clustering with 3 clusters of sizes 38, 62, 50
# Sepal.Length Sepal.Width Petal.Length Petal.Width
#1     6.850000    3.073684     5.742105    2.071053
#2     5.901613    2.748387     4.393548    1.433871
#3     5.006000    3.428000     1.462000    0.246000

#Clustering vector:
#[1] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2 1 2 2 2 2 2 2 2 2 2 2
#[64] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 1 1 1 1 2 1 1 1 1 1 1 2 2 1 1 1 1 2 1 2 1 2 1 1
#[127] 2 2 1 1 1 1 1 2 1 1 1 1 2 1 1 1 2 1 1 1 2 1 1 2

#Within cluster sum of squares by cluster:    #EN ESTA PARTE NOS ESTÁ DICIENDO QUE PORCENTAJE DE LOS GRUPOS SON TAN PARECIDOS ENTRE CADA ELEMENTO DEL GRUPO
#[1] 23.87947 39.82097 15.15100
#(between_SS / total_SS =  88.4 %)  #EN ESTE CASO, CADA ELEMENTOS DE CADA CLUSTER SE PARECE UN 88.4%

#[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"    "size"         "iter"        
#[9] "ifault"   #TODOS ESTOS VALORES TAMBIÉN NOS LOS PUEDE DAR R SI LO ESPECIFICAMOS
table (fit [[1]], iris$Species) #Con esta tabla me da de mi análisis de conglomerados que me saque "cluster [1]", con base a las especies de la data

#OTRO EJEMPLO
fit2 <- kmeans (iris1, 8)
fit2

#FUNCIÓN: fviz_nbclust determina y visualiza el numero óptito de clusters usando diferentes métodos
install.packages("factoextra")
library(factoextra)
fviz_nbclust (iris1, kmeans, method = "wss") #método 1
#CON ESTA GRÁFICA TENEMOS QUE ANALIZAR EN QUE PUNTO LA CAIDA YA NO ES BRUSCA

fviz_nbclust (iris1, kmeans, method = "silhouette") #método 2
#CON ESTE MÉTODO EN LA GRAFICA YA NOS MARCA UNA LÍNEA DE EL NÚMERO DE CLUSTERS OPTIMO

fviz_nbclust (iris1, kmeans, method = "gap_stat") #método 3
#CON ESTE TAMBIÉN NOS MARCA UNA LINEA DEL NUMERO DE CLUSTERS OPTIMO


#METERME A LA GALERIA GRAFICA DE R, NOS VAMOS A LA PARTE DE DENDOGRAMA
install.packages("ggraph")
library(ggraph)

install.packages("collapsibletree")
library(collapsibletree)

library(ggplot2)


install.packages("dendextend")
library(dendextend)

install.packages("cluster")
library(cluster)

install.packages("factoextra")
library(factoextra)

#BASES DE DATOS 
USArrests
head(USArrests)
mtcars

#función: hclust()
#EJERCICIO
#Para usar la función hclust(), primero se hace la matriz de distancia
dist1 <- dist (USArrests, "manhattan")   #métrica de distancia,   se crea un objeto, se pone función dist
dist1
#HACER EL ANÁLISIS
fit1 <- hclust (dist1, "average")
plot(fit1) #para imprimir el dendograma
plot(fit1, hang = -1, cex=1, main= NA)
#as.dendogram : es para que R interprete mi análisis estadístico pero con propiedades de dendograma
grafica <- as.dendrogram (fit1)

plot(grafica, type = rectangle)

install.packages("tidyverse")
library(ggraph)
library(igraph)
library(tidyverse)
library(RColorBrewer) 

ggraph(grafica, layout = 'dendrogram', circular = FALSE) + 
  geom_edge_diagonal() 

grafica2 <- ggraph(grafica, layout = 'dendrogram') + 
  geom_edge_diagonal() +
  geom_node_text(aes( label=label, colour = label) , angle=90 , hjust=1, nudge_y=-0.1) +
  geom_node_point(aes(filter=leaf, size= 2, color= label) , alpha=0.6) +
  ylim(-.6, NA) +
  theme(legend.position="none")
grafica2

names(USArrests)
summary(USArrests)

grafica3 <-ggraph(grafica, layout = 'dendrogram', circular = FALSE) + 
  geom_edge_link(colour="purple") +
  scale_edge_colour_distiller(palette = "RdPu") +
  geom_node_text(aes(x = x*1.15, y=y*1.15, filter = TRUE , label= label, hjust= TRUE, angle =90 , colour=label), size=4, alpha=2) +
  geom_node_point(aes(filter = leaf, x = x*1.07, y=y*1.07, colour= label, size=0.5, alpha=2)) +
  scale_colour_manual(values= rep( brewer.pal(9,"Paired") , 30)) +
  scale_size_continuous( range = c(0.1,10) ) +
  theme_void() +
  theme(
    legend.position="none",
    plot.margin=unit(c(0,0,0,0),"cm"),
  ) +
  expand_limits(x = c(-1.3, 1.3), y = c(-1.3, 1.3))
grafica3
#PROBLEMÁTICAS: Los problemas que tuve fueron más de tipo conceptual, como tal para saber diferenciar los análisis de clasificación 
#con análisis de clústers
#
#APRENDIZAJE:Con esta clase aprendí que los análisis de clasificación consisten en
#clasificar observaciones en grupos de acuerdo con su similitud multivariada, además de
#Comprender cómo las medidas de distancia entre variables permiten cuantificar la semejanza entre individuos y cómo los métodos me vimos facilitan la identificación de patrones y estructuras dentro de los datos.