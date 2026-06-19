#CLASE 14. PCA GRÁFICAS
#OBJETIVO: Aprender a graficar los resultads deL Análisis de Componenetes principales
#BASES: En esta clase se utilizaron las bases de dats de las mediciones del grupo y la base de Iris
iris
BASE

#LAS ETIQUETAS DE LOS EJES: COMPONENETE PRINCIPAL 1 Y COMPONENTE PRINCIPAL 2  (PC1, PC2)
#cada punto de la grafica es una observación, puntos muy cercanos quieres decir que se parecen mucho
#Los puntos alejados entre sí quiere decir que no son parecidas
#Dos puntos muy cercanos de la misma especie quiere decir que se parecen mucho en las variable originales
#en lagráfica vemos una nube de puntos
#Qué tan larga es la flecha indica qué tan importante es esa variable, la flecha del vector, cada flecha correponde a las variables originales
# Los vectores (flechas en la gráfica), las felchas pueden estar 

#La longitud de la flecha indica las importancia de la varaible en la combinación lineal
#SUMA DE LOS CUADRADOS DE LAS DISTANCIAS
#no PODEMOS ASUMIR NADA RESPECTO A UN ANALISIS DE ORDENAMIENTO, NI SE PUEDE PONER A PRUEBA NINGUNA HIPÓTESIS
#HA
#El **Análisis de Componentes Principales (PCA)** es una técnica de reducción de dimensionalidad que transforma un conjunto de variables posiblemente correlacionadas en un
#nuevo conjunto de variables **no correlacionadas**, llamadas **componentes principales**.

#Estos componentes:
  
# - Son combinaciones lineales de las variables originales  
#- Están ordenados según la cantidad de varianza que explican  
#- Son **ortogonales** entre sí  

#El objetivo de PCA es **reducir la dimensionalidad de los datos conservando la mayor cantidad de variabilidad posible**.

---
  
  ## ¿Para qué se usa?
  
# PCA se utiliza comúnmente para:
  
#- Visualizar datos de alta dimensión  
#- Reducir ruido  
#- Eliminar redundancia entre variables  
#- Preprocesar datos antes de clasificación  
#
#Usaremos la base de datos `iris`.

data(iris)

# Variables numéricas
variables <- iris[,1:4]

# Estandarización (media de 0 para centrar y desviación estándar de 1)
X_scaled <- scale(variables) #Aquí tomas tus variables numéricas (variables) y las estandarizas:
pca_model <- prcomp(X_scaled) #prcomp() calcula los componentes principales- Reduce 4 variables → nuevas variables llamadas componentes principales (PC1, PC2, …)
summary(pca_model) # summary() te dice: cuánta varianza explica cada componente Y qué tan útil es cada uno

library(ggplot2)
pca_df <- data.frame(PC1 = pca_model$x[,1], #pca_model$x = coordenadas de cada punto en el nuevo espacio.
                     PC2 = pca_model$x[,2],  #matriz con resultados del Principal Component Analysis # $ seleccionas cierta columna
                     Species = iris$Species)                                  #columna 1 → PC1 #columna 2 → PC2 #Agregas la especie #PC2 = pca_model$x[,2]  #Species = iris$Species)
ggplot(pca_df, aes(PC1, PC2, color = Species)) + #eje X = PC1 eje Y = PC2 #color = especie, para que nos de un color por especie
  geom_point(size = 2, alpha = 0.7) +  #tamaño y transparencia de los puntos
  labs(title = "Proyección en componentes principales", #labs: Título y nombres de ejes  #para asignar titulo a la grafica
       x = "PC1",   #para asignar nombre a eje X
       y = "PC2") +  #para asignar nombre a eje X
  theme_minimal()  #Aplica un estilo limpio (sin fondo pesado)

#otra gráfica con porcentajes mostrados


# Usar solo los primeros 2 componentes
X_pca <- pca_model$x[,1:2]
especie <- iris$Species

set.seed(123)  #para fijar un numéro aleatorio
train_index <- sample(1:nrow(X_pca), size = 0.8*nrow(X_pca)) #nrow(X_pca) → número de filas (observaciones) #sample(...) → selecciona índices aleatorios #size = 0.8 * ... → 80% de los datos

X_train <- X_pca[train_index,] # Indica los datos de entrenamiento (80%)
X_test  <- X_pca[-train_index,] #X_test- Datos de prueba (20%) -train_index → todo lo que NO está en entrenamiento

y_train <- especie[train_index] #y_train → etiquetas para entrenar
y_test  <- especie[-train_index] #y_test → etiquetas reales para evaluar

library(class)
# Clasificación con K = 5
predicciones <- knn(train = X_train,
                    test = X_test,
                    cl = y_train,
                    k = 5)

# Matriz de confusión
tabla <- table(Predicho = predicciones, Real = y_test)
tabla

# Exactitud
accuracy <- sum(diag(tabla)) / sum(tabla)
accuracy

#-----------------------
install.packages("plotly")
library(plotly)
library(stats)
data(iris)
X <- subset(iris, select = -c(Species))
prin_comp <- prcomp(X, rank = 2)
components <- prin_comp[["x"]]
components <- data.frame(components)
components <- cbind(components, iris$Species)
components$PC2 <- -components$PC2
explained_variance <- summary(prin_comp)[["sdev"]]
explained_variance <- explained_variance[1:2]
comp <- prin_comp[["rotation"]]
comp[,'PC2'] <- - comp[,'PC2']
loadings <- comp
for (i in seq(explained_variance)){
  loadings[,i] <- comp[,i] * explained_variance[i]
}

features = c('sepal_length', 'sepal_width', 'petal_length', 'petal_width')

fig <- plot_ly(components, x = ~PC1, y = ~PC2, color = ~iris$Species, colors = c('#636EFA','#EF553B','#00CC96'), type = 'scatter', mode = 'markers') %>%
  layout(
    legend=list(title=list(text='color')),
    plot_bgcolor = "#e5ecf6",
    xaxis = list(
      title = "0"),
    yaxis = list(
      title = "1"))
for (i in seq(4)){
  fig <- fig %>%
    add_segments(x = 0, xend = loadings[i, 1], y = 0, yend = loadings[i, 2], line = list(color = 'black'),inherit = FALSE, showlegend = FALSE) %>%
    add_annotations(x=loadings[i, 1], y=loadings[i, 2], ax = 0, ay = 0,text = features[i], xanchor = 'center', yanchor= 'bottom')
}

fig




library(vegan)
#SCRIPT 
#INTENTO DE HACER LA GRÁFICA N°2
datos2 <- BASE2 [,3:16]
dist_datos <- vegdist (datos2, method = "bray")
pcoa_datos <- cmdscale (dist_datos, 2)

x <- pcoa_datos [ ,1]
y <- pcoa_datos [ ,2]
plot (x, y, xlab = "Coordenada 1", ylab = "Coordenada 2", main = "data = datos multivariada 2026", pch = 1)

datos3 <- BASE2 [-41, ]
dist_datos1 <- vegdist (datos3 [ , 3:16], method = "bray")

pcoa_datos1 <- cmdscale (dist_datos1, 2)

x1 <- pcoa_datos1 [ ,1]
y1 <- pcoa_datos1 [ ,2]
plot (x1, y1, xlab = "Coordenada 1", ylab = "Coordenada 2", main = "datos 2026 sin la observación rara", pch = 1)

#ESTO ES PARA AGREGAR LAS ETIQUETAS Y QUE CADA OBSERVACIÓN TENGA SU COLOR DEPENDIENDO DE SI 
etiquetas_sexo <- datos3$sexo

colores_sexo <- function (variable)
{if (length (grep ("mujer", variable )))
{"hotpink4"}  #Este color corresponde a las mujeres 
  else
  {"olivedrab3"}   #Este color corresponde a los hombres
}
#ESTA GRÁFICA ES PARA PONER LOS NOMBRES DE LOS EJES Y DE LA GRÁFICA 
etiquetas_colores_sexo <- unlist (lapply (etiquetas_sexo, colores_sexo))
plot (x1, y1, xlab = "Coordenada 1", ylab = "Coordenada 2", main = "Triángulos por observación",
      pch= 17, col = etiquetas_colores_sexo)   #pch: es para que cada observación tenga forma de triángulo relleno, el pch =2 es para triángulos huecos

#Este código es para la gráfica con el nombre de las personas en lugar de puntos, usando un sólo color
etiquetas_nombres <- datos3$id
plot (x1, y1, xlab = "Coordenada 1", ylab = "Coordenada 2", type = "n", main = "Gráfica con nombres")
text (x1, y1, labels = etiquetas_nombres, col= "deeppink", cex = 1)

#Este código es para hacer la gráfica, pero con los dos colores
etiquetas_nombres_colores <- unlist (lapply (datos3$sexo, colores_sexo))
plot (x1, y1, xlab = "Coordenada 1", ylab = "Coordenada 2", type = "n", main = "Gráfica con nombres y colores")
text (x1, y1, labels = etiquetas_nombres, col = etiquetas_nombres_colores, cex = 1)

#gráfica con leyenda
plot (x1, y1, xlab = "Coordenada 1", ylab = "Coordenada 2", type = "n", main = "con nombres y colores")
text (x1, y1, labels = etiquetas_nombres, col = etiquetas_nombres_colores, cex = 1)
legend ("bottomright", legend = c ("mujer", "hombre"), col = c ("hotpink4", "olivedrab3"), pch = 1, cex = 1)
