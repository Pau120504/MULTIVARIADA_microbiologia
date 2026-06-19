#CLASE 9. Hotelling Test

#Objetivo: Aprender a comparar los vectores de medias de dos grupos

#BASE: En esta clase utilizamos la base de datos container.df
container.df

#PRUEBA DE HOTELLING
#T^2
#ES una generalización de la prueba de t
#Comparara vectores de los promedios de dos grupos 
#El diseña no necesariamente está balanceado
#Hay multinormalidad (de mu )
#Hay homogeneidad de varianzas en las matrices C (matriz de varianza-covarianza)

#PASOS PARA PRUEBA DE HOTELLING, para eso se carga el paquete "Hotelling"
install.packages("Hotelling")
library(Hotelling) #Hay dos paquetes dentro de esta librería, stat y test, cargar librería
hotelling.stat()
hotelling.test()
install.packages("rstatix")
library(rstatix)
#CARGAR LA BASE DE DATOS
data("container.df")
names(container.df)

objeto1 <- (1:20)
#SUPUESTOS DE HOTELLING TEST
#Supuesto de la homogeneidad: 
#SUPUESTO DE LA MULTINORMALIDAD: mshapiro_test
#Con este supuesto de todas las pruebas de bondad de ajuste, no queremos que el valor de p no sea significativo

mshapiro_test(container.df [ , 2:10]) #al correr esto, nos da un valor de p= 0.000000982, significativo, porque EL VALOR DE P ES SIGNIFICATIVO
#NO SE CUMPLE EL SUPUESTO

#EN LA PRUEBA DE HOTELLING TENEMOS VECTORES DE MEDIAS, NO VARIABLES
#SUPUESTO DE LA HOMOGENEIDAD DE LAS MATRICES DE VARIANZA-COVARIANZA: 
box_m(container.df [, 2:10], container.df$gp)


#EJERCICIO PARA HOTELLING.TEST
fit_hotelling <- hotelling.test (.~ gp, container.df)
fit_hotelling
t.test(Ti ~ Al, container.df)
t.test(objeto1, objeto2)
names(container.df)
objeto1 <- container.df [1:10, 2]
objeto1
objeto2<- container.df [11:20, 2]
objeto2
mean(objeto1)
mean(objeto2)
t.test( ) 
t.test(Ti ~ gp, container.df)  #t.test( variable de respuesta ~ variable dependiente, DATA)
t.test(Al ~ gp, container.df)

#Problemáticas: En esta clase el problema que tuve solo fue en cuanto al manejo de la base de datos, debido al tipo
#de archvo que cargue

#¿QUÉ APRENDÍ? En esta clase aprendí la diferencia entre la t-test y la prueba de Hotelling, además
#de reafirmar el concepto de vectore de medias
