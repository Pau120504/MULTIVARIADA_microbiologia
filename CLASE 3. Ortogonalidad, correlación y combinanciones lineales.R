# Clase Ortogonalidad
#Objetivo: Entender qué es la ortogonalidad, la correlación y cómo se diferencia con la covarianza, también se logró comprender el concepto de combinación lineal

#La ortogonalidad es cuando dos variables (y1, y2) son completamente independientes y que son además variables de respuesta, eso quiere decir que son completamente ortogonales
#por ejemplo si medimos en un eje la inteligencia y en otro la altura, la nube de puntos debería de ser muy dispersa porque 
#en realidad no existe una relación entre niguna entre las variables
#Por lo tanto, cuando dos variables son completamente independientes quiere decir que la correlación lineal entre ambas es de 0

#Es importante detacar que la correlación está estandarizada y tiene un límite
#CORRELACIÓN DE PEARSON (SOLO PODEMOS TENER CORRELACIONES DE (-1 A +1)
#CORRELACIÓN DE SPEARMAN (NO EXISTE UN RANGO DE CORRELACIÓN ESTRICTA COMO EL DE PEARSON -1 A +1)

#CUANDO VEMOS QUE UNA VARIABLE AUMENTA Y LA OTRA TAMBIÉN O AL CONTRARIO, UNA DISMINUYE Y LA OTRA TAMBIÉN= NO SON ORTOGONALES porque sí existe cierta correlación
#Correlación de 1= una variable aumenta y la otra también en el mismo grado
#CORRELACIÓN de 0 = no existe ninguna relación entre ninguna y se ve completamente disperso, hay ortogonalidad y no se observa una tendencia de cambio en conjunto de las variables
#Correlación de -1= una disminuye y la otra aumenta también en el mismo grado
#la correlación no indica causalidad X: el hecho de que dos variables cambien juntas al mismo tiempo no significa que una provoque o sea la causa de la otra. 

#correlación = r(no confundir con R).
#UNA CORRELACIÓN MUY GRANDE CON NIVELES MUY ALTOS NO INDICA CAUSALIDAD, NO EXPLICA LA CAUSA
#Una regresión nos dice qué tanta de la variación en Y se ve explicada por X, esa es la diferencia entre ambas 
# En la regresión si vemos el efecto de una variable sobre a otra pero en la correlación solo observamos el cambio de ambas variables juntas pero quiere decir que el cambio de una esté dado por la otra.

#COVARIANZA: MEDIDA DE dispersión que mide cómo dos variables cambian juntas. (medida de dispersión conjunta entre dos variables independientes)
#La diferencia con la correlación es que la covarinaza mide únicamente cómo cambian dos variables, nos dice dirección, si es positiva o negativa
#Mientras que la correlación mide lo mismo, pero indica la dirección y la fuerza, ya que está tiene un parámetro de -1 a +1
#Covarianza  de (-infinito a +infinito), mide de la nube de puntos que tanto se mueven en conjunto
#EN BIOLOGÍA NO HAY ORTOGONALIDAD, SIEMPRE EXISTE UNA AUNQUE SEA MÍNIMA DEPENDENCIA ENTRE LAS VARIABLES

##++++++++++COMBINACIONES LINEALES EN LAS VARIABLES ORIGINALES
##+La idea general de las tecnicas multivariada es combinar las múltiples variables de respuesta para reducir las dimensiones con las que trabajaremos
##+Consiste en una manera de realizar la combinación de todas las variables para reducir las dimensiones a solo dos sin perder información
##+PARA HACER ESO HACEMOS COMBINACIONES LINEALES 
##+AL COMBINAR LAS VARIABLES ORIGINALES NO SE PIERDE INFORMACIÓN, RESUMIMOS LA VARIACIÓN DE LOS DATOS ORIGINALES Y OBTENERMOS NUEVAS VARIABLES QUE SÍ SON ORTOGONALES ENTRE SÍ
##+VARIABLE Z= Combinación lineal
##+
##+En cada combinación lineal van estar incluías cada una de las variables que del modelo, entre cada Z están todas las variables originales
##+Cada variable original tiene un peso distinto
##+QUE TANTA VARIACIÓN DE Z por cada una de nuestras varaibles originales es el eigen valor
##+CADA VARIABLE ORIGINAL NO ES ORTOGONAL PERO Z SI ES ORTOGONAL

##+SI TENGO 5 VARiABLES ORIGINALES, el modelo será de 5 dimensiones, en cuanto a combinaciones lineales también habrá 5= 5Z . Para
##+hacer un análisis estadístico en solo dos dimensiones solo se necesitan 2Z, pero para conocer el eigen valor si se necesitan calcular todas
##+El eigen valor de todas las Z debe ser = 1. La idea de reducir dimensiones es manejar más fácimente el modelo y además poder interpretarlo, con dos dimensiones se puede realizar una interpretación 
##+pero con 420 dimensiones por ejemplo no se puede hacer una interpretación biológica.
##
##APRENDIZAJE: En esta clase aprendí que la correlación y la covarianza nos dicen cómo cambian juntas dos variables, la diferencia es que la correlación está estandarizada
#tiene dirección y fuerza, la covarianza no, solo delimita su dirección. También aprendí que las combinaciones lineales son todas las posibles combinaciones de todas las variables originales
# y que el punto de reducir las dimensiones es para tener un mejor control del modelo estadístico y para poder interpretarlo.

