install.packages("tidyverse") #para las fechas 
install.packages("lubridate")
library(tidyverse)
library(lubridate)
colnames(data_long_tati) #para saber el nombre de las columnas 
SanIsidro<-data_long_tati[,1]
SanIsidro.ts<-ts(SanIsidro, start = 1981, frequency = 12)
#view(SanIsidro.ts)
grafSanIsidro<-plot(SanIsidro.ts,
                    xlab="Año (1981 al 2016)",
                    ylab="Precipitaciones mensuales",
                    type="S", 
                    col="blue",
                    lwd="2.5",
                    main = "Estación Meteorológica de San Isidro",
                    sub="Fuente: Datos PISCO SENAMHI")


Cruceta<-data_long_tati[,2]
Cruceta.ts<-ts(Cruceta, start = 1981, frequency = 12)
#view(SanIsidro.ts)
grafCruceta<-plot(Cruceta.ts,
                    xlab="Año (1981 al 2016)",
                    ylab="Precipitaciones mensuales",
                    type="S", 
                    col="blue",
                    lwd="2.5",
                    main = "Estación Meteorológica de Cruceta",
                    sub="Fuente: Datos PISCO SENAMHI")

#Curvan=3,ElTablazo=4, Hualtaco=5,Malingas=6 y 7, TamboGrande=8,SanJoaquin=9,Tejedores=10
#Chulucanas=11,HaciendaYapatera=12,huapalas=13,SanPedro=14,SantoDomingo=15 y 16,Miraflores=17
#Piura=18,Altamiza=19,Chalaco=20,PaloBlanco=21,Pasapampa=22,Morropon=23,CorralDelMedio=24
#Paltashaco=25,SanMiguel=26, Virrey=27,HaciendaPabur=28, Canchaque=29, Huancabamba=30,
#HaciendaBigote=31,Barrios=32,Montegrande=33,Malacasi=34 y 35,Chignia=36, Pirgas=37,Bernal=38
#Chusis=39, LagunaRamon=40
LagunaRamon<-data_long_tati[,40]
LagunaRamon.ts<-ts(LagunaRamon, start = 1981, frequency = 12)
#view(SanIsidro.ts)
grafLagunaRamon<-plot(LagunaRamon.ts,
                  xlab="Año (1981 al 2016)",
                  ylab="Precipitaciones mensuales",
                  type="S", 
                  col="blue",
                  lwd="2.5",
                  main = "Estación Meteorológica de Laguna Ramon",
                  sub="Fuente: Datos PISCO SENAMHI")
         
#[40] "LAGUNA RAMON"#
#[40] "LAGUNA RAMON"#
Estaciones<-data_long_tati[,1:40]
funcion<-funcion(Estaciones){
            Estaciones[i].ts<-ts(Huapalas, start = 1981, frequency = 12)
            #view(SanIsidro.ts)
            grafHuapalas<-plot(Huapalas.ts,
                               xlab="Año (1981 al 2016)",
                               ylab="Precipitaciones mensuales",
                               type="S", 
                               col="blue",
                               lwd="2.5",
                               main = "Estación Meteorológica de Huapalas",
                               sub="Fuente: Datos PISCO SENAMHI")
}  




plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")
points(x, cex = .5, col = "dark red")
plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
     main = "rpois(100, lambda = 5)")