#CLASE GLMs (Generalized linear models)

#OBJETIVO: Aprender a modelar datos donde la variable respuesta no siempre tiene una distribución continua ni normal, 
#y poder interpretar la relación entre variables las variables de respuesta y las independientes.

# GLMs (Generalized linear models)
# Son básicamente regresiones lineales que nos permiten asumir una distribución de errores diferente a una normal.
# Igual que las LM, nos permite ver la relación entre nuestras variables de respuesta y las variables independientes.
# La fórmula matemática es diferente a las LM.
# El parámetro que nos interesa más es la familia de distribuciones de los errores que puede manejar la función "glm". 
# En este caso podemos usar la familia gaussiana, binomial, poisson,
# gamma, entre otras. Lo importante es entender qué espero entender de mis datos y cuál es mi variable de respuesta.
# Por ejemplo, si tenemos una respuesta binaria (o sea categórica), se asumiríamos una respuesta binomial; todo depende de la naturaleza de nuestros datos, en caso de 
# duda, es mejor buscar qué tipo de datos tenemos y hacer las pruebas para intentar entender las posibles distribuciones.

#PARA ESTA CLASE UTILIZAMOS LA BASE DE DATOS: CELLS
cells # cargamos nuestra base de datos

str(cells) #sacamos la estructura de la base, con la función str, la cual nos da qué tipo de objeto es, qué variables tiene, qué tipo de datos hay en cada variable
View(cells) #Funcción: view es para ver la base de datos, tal cual la tabla de los datos
names(cells) #función: name, da los nombres de la columnas dentro de la base de datos
#La categorías de la base de datos son varibles independientes: sex, weight, age, smoker
#Mi variable de respuesta es cells
#PARA SACAR GRÁFICOS DE FORMA RÁPIDA Y FÁCIL
#PARA SACAR HISTOGRAMA DE LAS CÉLULAS
hist(cells$cells)   #PARA SACAR EL HISTOGRAMA DE LA COLUMNA CELLS DE LA BASE DE DATOS CELLS
hist(cells$cells)
#RESULTADO: se imprime el histograma en donde en el eje "x" sale el número de células cancerosas y en el eje "y" la frecuencia
#en este caso el número de células con mayor frecuencia es de una, con una frecuencia de cerca del 70%
#LO que se observa es que los datos no llevan una distribución normal

#PARA SACAR ANOVA DE INTERACCIÓN CON 4 FACTORES
fit1 <- aov (cells ~ smoker*age*sex*weight, cells)   #objeto <- aov (variable de respuesta ~ variables involucradas en la interacción, data)
fit1 #PARA IMPRIMIR EL OBJETO Y ASEGURARNOS DE QUE CORRE
plot(fit1) #PARA VER LAS GRAFICAS Y OBSERVAR SI SE CUMPLEN LOS SUPUESTOS, EN ESTE CASO no se cumplen los supuestos
fit2 <- glm(cells ~ smoker*age*sex*weight, family = poisson (link = "log"), cells) #CÓDIGO PARA un glm, primero creo un objeto, usamos la función glm
#nuestra variable de respuesta son las células y hacer un modelo de interacción, la función "link" conecta la media de la variable respuesta con el predictor linea
# la  parte de "Family" de la fórmula de glm las más aceptadas son distribución: binomial o poisson
#LOS GLMs SOLO TIENEN SENTIDO CUANDO LA VARIABLE TIENE ESAS DOS 

#RESULTADOS
summary(fit2)

#AL CORRER EL VALOR DEL ESTIMADO DE CADA COMBINACIÓN ES COMPARADA CON EL INTERCEPTO, EL CUAL ES EL VALOR PROMEDIO DE TODO
#LA COMBINACIÓN QUE SALE SIGNIFICATIVA POR EJEMPLO SMOKERTRUE:WEIGHTOBESE, TIENE 3.56 MÁS CELULAS CANCERÍGENAS POR LA OBESIDAD
#LAS NAs SIGNIFICA QUE NO EXISTEN LAS REPLICAS SUFICIENTES POR LO TANTO NO SE PUEDE COMPARAR CON EL INTERCEPTO

#INTERCEPTO: El intercepto representa el valor esperado de la variable respuesta cuando todas las variables independientes están en su nivel de referencia.

# En este caso, la interpretación de los coeficientes dependerá de la familia de distribuciones elegida, pero se puede
# tomar de manera similar que las LM debido que igualmente nos importan los interceptos y los valores de nuestras variables
# independientes.
# La desviación nula y la desviación residual. En la desviación nula, nos dice qué tan bien puede ser predecida nuestra
# variable de respuesta si solo se considera el intercepto. La desviación residual se refiere a qué tan bien podemos
# predecir nuestra variable de respuesta considerando a nuestras variables independientes; entre más bajo el valor, es mejor.

#La deviance mide qué tan bien se ajusta el modelo.
#Null deviance: modelo sin variables (solo intercepto)
#Residual deviance: modelo con variables
#Si el residual deviance es mucho menor que la null deviance, el modelo explica mejor los datos.

summary.aov(fit2)#NO CORRE PORQUE HAY NAs
#sE DEBEN REPORTAR LOS VALORES DE Null deviance
#SE REPORTA VALOR DE Z, VALOR DE P Y VALORES DE NULL DEVIANCE

#DIFERENCIA CON REGRESIONES LINEALES
# Las regresiones lineares son la base del estudio estadísitco. A diferencia de las correlaciones, las regresiones
# tienen la capacidad de poder predecir valores de nuestra variable dependiente. Se asume que la relación entre
# nuestra variable dependiente y la independiente es lineal. Dicho de otra manera, podemos tener relaciones positivas,
# las cuales se refieren a un incremento en la variable de respuesta respecto a la variable independiente, o bien,
# negativas, lo cual sería el caso inverso. 

# El ejemplo más sencillo de una regresión lineal es:
# y = B0 + B1*X + E
# Y es nuestra variable de respuesta
# B0 sería el intercepto
# B1 la inclinación 
# X nuestra variable independiente
# E es el error irreducible

#Problemas encontrados
#El principal problema al que me enfrenté es que debido a que los modelos son complejos porque implican interacciones pues el sistema se satura, lo cual provocó que 
#múltiples ocasiones tuviera que reinciar la sesión o cerrarla, lo cual no me permitió trabajar bien, ver los resultados o continuar con el modelo.
#Otro problema al que me enfrenté es que al sacar el summaty aov no me corrió, esto debido a que la base de datos contiene NAs, y si se eliminan esas filas se estaría perdiendo infromación relevante para la interacción

#APRENDIZAJES
#Aprendí que los GLMs básicamente son una extensión de las regresiones en univariada pero lo que nos permite es que podemos utilizar datos que no llevan una distribución normal
#Los problemas que tuve fueron debido a que la base de datos es pesada y el modelo de interacción lo hace aún más, por lo cual se satura el sistema


