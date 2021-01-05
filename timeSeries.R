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
#Chulucanas=11,HaciendaYapatera=12,
Huapalas<-data_long_tati[,13]
Huapalas.ts<-ts(Huapalas, start = 1981, frequency = 12)
#view(SanIsidro.ts)
grafHuapalas<-plot(Huapalas.ts,
                  xlab="Año (1981 al 2016)",
                  ylab="Precipitaciones mensuales",
                  type="S", 
                  col="blue",
                  lwd="2.5",
                  main = "Estación Meteorológica de Huapalas",
                  sub="Fuente: Datos PISCO SENAMHI")
 
    
#   "SAN PEDRO"         "SANTO DOMINGO"    
#[16] "SANTO DOMINGO"     "MIRAFLORES"        "PIURA"            
#[19] "ALTAMIZA"          "CHALACO"           "PALO BLANCO"      
#[22] "PASAPAMPA"         "MORROPON"          "CORRAL DEL MEDIO" 
#[25] "PALTASHACO"        "SAN MIGUEL"        "VIRREY"           
#[28] "HACIENDA PABUR"    "CANCHAQUE"         "HUANCABAMBA"      
#[31] "HACIENDA BIGOTE"   "BARRIOS"           "MONTEGRANDE"      
#[34] "MALACASI"          "MALACASI"          "CHIGNIA"          
#[37] "PIRGAS"            "BERNAL"            "CHUSIS"           
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