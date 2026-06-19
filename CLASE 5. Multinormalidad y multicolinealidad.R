#Multinormalidad y outliers

#OBJETIVO: Lograr comprender el comportamiento que tienen conjuntos de datos multivariados en base a la multinormalidad, multicolinealidad y outliers mutivariados,
#así como lograr entender estos conceptos en la estadística multivariada.

#Es importante decir que en la estadística mutivariada la mayoría de los análisis multivariados asumen que todas las variables originales y las
#combinaciones lineales de estas variables se ajustan a una distribución normal (que asumen multinormalidad).

#También otra cosa es importante es que distribución multivariada más sencilla es la multi-binomial, la cual depende de los promedios,
#desviaciones estándar y el nivel correlación entre ambas variables.

#CONCEPTO IMPORTANTE- CENTROIDE:
#En el espacio multivariado, donde cada dimension es una variable, el centroide es una medida del “centro” de una distribución multivariada. 
#No es un valor, es un punto que representa la “ubicación” del centro de las distribuciones de cada una de las variables.
                                                                        
#MULTICOLINEALIDAD
#La multicolinealidad ocurre cuando las variables independientes en un modelo de regresión 
#están altamente correlacionadas entre sí, lo que dificulta aislar el efecto individual de cada una sobre la variable dependiente

#Cuando las correlaciones entre las múltiples variables independientes son muy altas (|0.9|), decimos que hay multicolinealidad.

#MULTINORMALIDAD
#La multinormalidad (o normalidad multivariante) indica que todas las variables siguen 
#conjuntamente una distribución normal


#RECORDAR: COMBINACIONES LINEALES= Z
#Si las combinaciones lineales se ajustan a distribucion gaussiana con dos variables, una en en X y otra en Y, la grafica se ve como una montañita justo en el centro
#tal como una campana de Gauss

#OUTLIER MULTIVARIADO: Observación que corresponde a la combianción lineal de un modelo, cuya observación es atípica en un modelo en el que se están considerando múltiples variables simultáneamente.
#pueden haber outliers solo para una de las variables, es decir, que sea outlier del eje Y pero no del X, PERO SIGUE SIENDO OUTLIER MULTIVARIADO, esto depende mucho de la dimensión. 

#DISTANCIA DE Mahalanobis: DISTANCIA QUE HAY DESDE EL CENTROIDE HASTA EL OUTLIER MULTIVARIADO

#*MATRIZ DE VARIANZA-COVARIANZA: Matriz que muestra cómo varían las variables y cómo se relacionan entre ellas. 
#En la diagonal están los valores correspondientes a las varianzas de las combinaciones de las variables de la matriz (varianza: medición de las dispersión que hay de un punto respecto a su media),
#y los valores fuera de la diagonal  de ella muestran los variables de covarianza (covarianza: mide cómo cambian dos variables juntas)
#
#EL LEAVERAGE  es que tan lejos está un punto respecto a los otros como un outlier, un subconjunto de objetos de datos se desvía colectivamente de forma significativa del conjunto de datos, 
#aunque los objetos de datos individuales no sean valores atípicos. 
#Medida que indica cuánto se aleja el valor de una variable independiente respecto a su media.

#MATRIZ DE DISTANCIA: Matriz que muesta qué tan diferentes o similares son los datos entre sí, calculando la distancia entre cada par de observaciones. 
#sirve para comparar individuos o muestras y ver cuáles son más parecidos o más distintos. Son matrices diagonales

#Si el valor absoluto es muy alto como 0.95 quiere decir que hay multicolinealidad= el valor de correlación es muy alto a tal grado de que si tenemos 5 variables, 
#en realidad estamos midiendo una sola porque están mucha multincolinealidad
#VALOR DE MULTICOLINEALIDAD= Valor absoluto de > o igual a 0.9
#La redundancia está relacionada con la singularidad, matrices singulares no tienen solución porque sus determinantes tienen valores cercanos a cero!
#Matrices singulares: Matriz que no tiene matriz inversa, por lo cual no tienen solución, y no se puede sacar eigen valores ni vectores, por lo tanto no sería 
#estadística multivariada.

#RECORDAR CONCEPTOS
#VARIANZA: La varianza es la medida de la dispersión estadística que representa 
#la variabilidad de un conjunto de datos respecto a su media aritmética

#COVARIANZA: La covarianza es una medida que indica cómo dos variables cambian juntas.

#PROBLEMAS: En esta clase me costó mucho entender qué es la varianza, EL OUTLIER MULTIVARIADO Y EL CENTROIDE

#¿QUÉ APRENDÍ? Esta clase pude comprender el concepto de multinormalidad y multicolinealidad, además de que con este script pude comprender qué es la
#matriz de varianza-coovarianza y la matriz de distancia
















