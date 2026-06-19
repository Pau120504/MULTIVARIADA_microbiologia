#MATRICES EN R
#Formas de crear una matriz
#Objetivo: Aprender a crear una matriz en R de diferentes maneras.

## a) dividiendo un vector
paulina <- c(1:25) #primero creamos un vector, en este caso quise hacerlo en forma de intervalo del 1 al 25
print(paulina)# lo imprimes para corroborar que está bien
#para dividir el vector, usamos la función "matrix"

#PARA HACER UNA MATRIZ INDICANDO LA DIVISIÓN DE RENGLONES
m1 <- matrix (paulina, nrow = 5) #nrow= número deseado de renglones que quieres que sea tu matriz
m1
#PARA HACER UNA MATRIZ INDICANDO LA DIVISIÓN DE COLUMNAS
m2 <- matrix (paulina, ncol = 5, byrow = T) #ncow= número deseado de columnas que quieres que sea tu matriz
m2    #byrow=T es para indicar que quieres que los numeros de tu vector se acomoden por renglones

#EJEMPLO COMPLETO
p1 <- c(1:20)
mx <- matrix(p1, nrow=4, ncol = 5, byrow = TRUE)#se usa la función matrix patra armar la matriz: función (objeto con la base para formar la matriz, nrow= indicar el número de renglones
mx                                              #que queremos que conformen nuestra matriz, ncol= número de columnas que queremos en la matriz, byrow= TRUE si queremos que los datos se acomoden por renglones)

#RESULTADOS
#En la primera matriz nos corre una matriz cuadrada de 5x5, en la segunda nos da igual una matriz cuadrada de 5x5 pero con los datos acomodados por renglones
#y en la tercera nos da una matriz de 4x5 con los datos acomodados por renglones


## b) Combinando vectores
#para ello se deben tener al menos dos vectores para poder combinarlos y deben de tenr la misma longitud (mismo número de elemntos), y deben de ser de la misma clase
#si son numéricos todos deben de ser numéricos
#FUNCIÓN : rbind para combinarlos por renglones
p <- c(15, 12, 7, 6, 2)
c <- c(1,2,3,4,5)           #Creamos los vectores que queremos que conformen los renglones de la matriz
z <- c(2, 13, 25, 21, 63)
m3 <- rbind (p,c,z)   #Función rbind es para acomodar los vectores por renglones 
m3
#Resultado: nos da una matriz de 3x5, en donde se acomodaron los vectores por renglones
#FUNCIÓN : cbind para combinarlos por columnas
m4 <- cbind(p,c,z)  #lo mismo pero ahora con cbind que acomoda los vectores por columnas
m4
#Resultado: No da una matriz de 5x3 porque ahora los vectores se acomodaron verticalmente por columnas

#PARA NOMBRAR O CAMBIAR EL NOMBRE A LOS RENGLONES O COLUMNAS
rownames(m4) <- c("uno", "dos", "tres", "cuatro", "cinco") #Función: rowname para cambiar el nombre de los renglones de la matriz
m4     #usamos la matriz formada antes y asignamos qué nombre queremos para la columna
#Función: colname para cambiar el nombre de las columnas de la matriz creada
colnames(m3) <- c("uno", "dos", "tres", "cuatro", "cinco") #Función: rowname para cambiar el nombre de los renglones de la matriz
m3
#Resultados: La primera matriz que nos salen es de 5x3 y cada renglón tiene los nombres asignados
#La segunda matriz que nos salen es de 3x5 y cada columna tiene los nombres asignados

#PARA IDENTIFICAR ALGÚN ELEMENTO DE LA MATRIZ
m2 [1,4] #se pone la matriz de la cual se busca el elemento y entre corchetes la coordenada del elemento que queremos
#[x,y] renglón, columna
m2 [,5]  #en este caso queremos que nos de todos los elementos de la columna 5 de la matriz m2

#HACER LOS EJERCICIOS DE CLASE
vector1 <- c(3,7,1,2,5,0,4,0,8) #PARA CREAR UNA MATRIZ CUADRADA DE 3X3
A <- matrix(vector1, nrow = 3, byrow = T)
A
#RESULTADO: SE MUESTRA UNA MATRIZ DE 3X3, SE COMODARON LOS ELEMENTOS DEL VECTOR POR RENGLONES
#3    7    1
#2    5    0
#4    0    8

vector2 <- c(6,2,3,1,8,4,0,7,5)
B <- matrix(vector2, nrow = 3)
B
#RESULTADO: SE MUESTRA UNA MATRIZ DE 3X3, SE COMODARON LOS ELEMENTOS DEL VECTOR POR COLUMNAS
#6    1    0
#2    8    7
#3    4    5

#PARA SACAR LA TRANSPUESTA DE LAS MATRICES HECHAS ANTERIORMENTE 
transA <- t(A) #usamos la función t para sacar la transpuesta DE LA MATRIZ A
transA
#Resultados: Me da la transpuesta de la matriz A
#

# 3    2    4
# 7    5    0
# 1    0    8


transB <- t(B)#transpuesta de B
transB
#PARA SUMA DE MATRICES
A+B   #solamente ponemos los objetos que corresponden a la matriz + la otra matriz

#PARA RESTA DE MATRICES
A-B

#Para multiplicar un número por una matriz
2*B
#PARA MULTIPLICAR UNA MATRIZ POR OTRA MATRIZ
A %*% B
B %*% A  #PARA MULTIPLICAR MATRICES TENEMOS QUE USAR %*%

#Resultados:
#suma                  resta              multiplicación A*B    multiplicación B*A
# 9    8    1          -3   6   1         35   63   54           20   47    6
# 4   13    7           0  -3  -7         22   42   35           50   54   58
# 7    4   13           1  -4   3         48   36   40           37   41   43

#INVERSA DE UNA MATRIZ que es lo equivalente a las divisiones de las matrices
solve(A) #FUNCIÓN: solve
solve(B)
#Resultado
#matriz inversa A
# -3.333333  4.666667  0.41666667
#  1.333333 -1.666667 -0.16666667
#  1.666667 -2.333333 -0.08333333

#PARA SACAR LOS EIGENVALORES DE UNA MATRIZ
eigen(A) #Función: eigen
eigen(B)
#RESULTADOS
#eigen vectores de matriz A            eigen vectores de matriz A
# 0.3076125 -0.2592848 -0.8490032      -0.1313296 -0.800189034  0.1550026
# 0.1428109 -0.2759181  0.3273328      -0.8514247  0.599707860 -0.7337292
# 0.9407335  0.9255488  0.4147852      -0.5077681 -0.006927621  0.6615252

#TIPOS DE MATRICES QUE UTILIZAMOS PARA MULRIVARIADA
#Para quitarle la última columna no numérico de la base Iris para quedarnos con una matriz completamente numérica
iris
iris1 <- iris [,-5]
iris1

#Correlación de la matriz resultante de iris
iriscorrelacion <- cor(iris1)   #Función: cor
iriscorrelacion
#Resultados 
#Nos da la matriz de correlación, se observa valores que van de -1 a +1, en la diagonal hay valores de 1 porque un valor consigo mismo tienen una correlación absoluta

#Covarianza de la matriz
iriscov <- cov(iris1)          #Función: cov
iriscov
#Resultado: Esto nos da la matriz de covarianza, se ve claramente cómo lo valores no están estandarizados solo en (-1 a +1)

#PARA SACAR UNA MATRIZ DE DISTANCIA
irisdist <- dist(iris1)        #función: dist
irisdist
#Esto nos da la matriz de distancia, en la cual entre cada comparación de los valores están la distncia que hay entre cada uno, en la diagonal tenemos valores de 0 porque se comparan los
#los valores entre sí mismos, por lo cual la distancia es de 0

##EJERCICIO
mdis <- dist(iris1, method= "canberra")  #USAMOS LA MISMA FUNCIÓN: dist pero podemos selccionar el método por el cual queremos que se haga
mdis
#RESULTADO: nos da la matriz de ditancia, entre cada comparación de valores se indica la distancia que hay entre ambos, la diferencia es que se seleccionó el método por el cual se hará la matriz

#INSTALAR PAQUETES
install.packages("vegan")  #instalar paquete: install.packages
library(vegan) #cargar librería
#EJERCICIOS CON VARIAS METRICAS
mdis2 <- dist(iris1, method= "canberra")
mdis
#RESULTADO: Nos da una matriz distancia pero con otra métrica, o sea otra forma en la que se mide la distancia entre valores, lo cual cambia esas distancias.

#Problemas: En esta clase tuve problemas en cuanto a la formación de matrices porque con el método de división de un vector no lograba tener la matriz en el orden como quería
#es decir, ponía el vector pero la matriz no salía con los valores en la posición que quería.

#Qué aprendí? Aprendí a formar una matriz desde 0 por distintos métodos y a excluir valores de una matriz o al contrario, a seleccionar valores de mi interés
#y supe solucionar el problema entendiendo el argumento de byrow, con el cual podemos indicar si queremos que nuesros datos se organicen por renglones o columnas
#porque yo formaba el vector pero la matriz no se acomodaba como yo quería, pero entendí el uso del argumento para la matriz si estuviera con los valores en en la posición ue buscaba.
#Considero que lo más relevante que aprendí fue a hacer matrices y los argumentos para realizar diferentes operaciones, además del uso de corchetes para matrices.



