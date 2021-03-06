ls() #Para saber cuantos caracteres hay en el enviroment

#Cargar el excel de caudales
library(readxl)
Caudal <- read_excel("D:/HP I5 DORADA/DISCO C/UNIVERSIDAD/DECIMO CICLO/SIG APLICADO/DATOS PISCO-R/CAUDALES MAXIMOS/Caudal.xlsx")
View(Caudal)
attach(Caudal)
colnames(Caudal) #Ver las columnas del dataframe
rownames(Caudal) #Ver las filas del dataframe

#..Practicando estadistica 
nOrden<-c(1:36)
mean(nOrden, na.rm=T,) #media de los datos
median(nOrden, na.rm = TRUE)# mediana

x<-c(sample(1.8:6.5,20, replace = T))
mean(x)
median(x)
sd(x) #desviacion estandar
var(x) #Varianza 
range(nOrden) #para ver el rango de los datos 

#....Valores de Yn y Sn para 36 datos de la distribucion gunbel, VALORES UNICOS 
Yn<-0.5410
Sn<-1.1313
datos<-t(Caudal[,2:41])#Transpuesta de los valores 
View(datos)
#Desviacion estandar de la muestra
sd(t(Caudal[,3]))

i<-NULL; Des<-NULL; DesEstan<-NULL
for (i in 2:41) {
  Des<-sd(t(Caudal[,i])); DesEstan<-c(DesEstan,Des)
  
}
#calculando el alpha (α)=Desviacion estandar/Sn
j<-NULL; asf<-NULL; alpha<-NULL
for (j in 1:40) {
  asf<-DesEstan[j]/Sn; alpha<-c(alpha, asf)
}
#Calculamos la media de los datos de cada estacion
k<-NULL; medd<-NULL; Med<-NULL
for (k in 2:41) {
  medd<-mean(t(Caudal[,k])); Med<-c(Med,medd)
}
#otra forma de calcular las medias de los datos
apply(Caudal, 2, mean)# promedio de todas las columnas 1=filas, 2=columnas

#calculando la U 
un<-NULL; v<-NULL; U<-NULL
for (v in 1:40) {
  un<-Med[v]-(Yn*alpha[v]); U<-c(U,un)
}

Estaciones<-c(colnames(Caudal[2:41]))

# poniendo la transversa de los datos de f(x) de 36 datos 
fdeX<-t(Caudal[,44])
View(fdeX)

#calculando gumbel 
Gumbel<-data.frame() #generando datos con cero filas y columnas
for (q in 1:40) {
  Gumbel_tem<-NULL
  for (w in 1:36) {
    gum<- -log(-log(fdeX[w]))*alpha[q]+U[q] 
    Gumbel_tem<-c(Gumbel_tem, gum)
  }
  Gumbel[1:36, q]<-Gumbel_tem
}

View(Gumbel)
# graficas para gumbel 
install.packages("dgumbel")
plot(Gumbel[,1])
library(dgumbel)
ind<-c(min(Gumbel):max(Gumbel))
plot(Gumbel[,1], type="o", col="red", 
     xlab="Datos de 36 años de la Estaciones Meteorológicas",
     ylab="Distribución de Gumbel de precipitaciones maximas (mm)")
lines(Gumbel[,40], col="blue", type="o")

lines(Gumbel[,1], col="red", type="o")
for (mm in 2:39) {
  lines(Gumbel[,mm], type="o", col= 1:38)
  
}
plot(dgumbel(Caudal[,2]), type="o")
#Grafica de gumbel y pp mayor des
ej<-c(1:10)
ejj<-data.frame(order(-ej))

#Calcular los tiempos de retorno para TR=10, TR=30, TR=50, TR=100
pmayorx<-t(Caudal[,43])

#TR para todas las estaciones 
trs<-c(10, 30, 50, 100)
tiemReto<-data.frame()
for (jj in 1:4) {
  fx<-(1-(1/trs[jj]))
  tr_tem<-NULL
  for (ii in 1:40) {
    tr<- -log(-log(fx))*alpha[ii]+U[ii] 
    tr_tem<-c(tr_tem, tr)
  }
  tiemReto[1:40, jj]<-tr_tem
}

names(tiemReto)<-c("TR=10","TR=30","TR=50","TR=100")
View(tiemReto)
tiemReto
plot_colors<-c("green","#FFCC00", "red","blue")
max_y<-max(tiemReto)
plot(tiemReto$`TR=10`,type = "o",  ylim=c(100,max_y), axes=FALSE, ann=FALSE, col=plot_colors[1])
lines(tiemReto$`TR=30`, type = "o", col=plot_colors[2])
lines(tiemReto$`TR=50`, type = "o", col=plot_colors[3])
lines(tiemReto$`TR=100`, type = "o", col=plot_colors[4])
axis(1, at=1:40, lab=Estaciones)
axis(2, las=1, at=4*0:max_y)

# Create a title with a red, bold/italic font
title(main="Tiempo de Retorno de las estaciones meteorologicas de Piura", font.main=4)

# Label the x and y axes with dark green text
title(xlab= "Estaciones Meteorologicas")
title(ylab= "Precipitaciones Maximas (mm)")

#Leyenda
legend("topright", max_y, names(tiemReto), cex=0.6, col=plot_colors,
       pch=21:23, lty=1:3)

?legend

#graficas de los TR
install.packages("latticeExtra")
install.packages("lattice")
library(latticeExtra)


set.seed(1)
x <- 1:40
var1 <- tiemReto[,1]
var2 <- tiemReto[,2]
data <- data.frame(x,var1,var2)


# --> construct separate plots for each series
obj1 <- xyplot(var1 ~ x, data, type = "l" , lwd=2, col="steelblue")
obj2 <- xyplot(var2 ~ x, data, type = "l", lwd=2, col="#69b3a2")

# --> Make the plot with second y axis:
doubleYScale(obj1,obj2, add.ylab2 = TRUE, use.style=FALSE )


#ln(x) (natural logarithm) is not a base R function. Use log(x) for this

#If you want the common logarithm, use log10(x) or log(x,10)









