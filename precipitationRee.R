install.packages("dplyr")
install.packages("sp")
#.......Cargar la carpeta donde se encuentra.....
setwd("D:/HP I5 DORADA/DISCO C/UNIVERSIDAD/DECIMO CICLO/SIG APLICADO/DATOS PISCO-R")

library(sp)
library(ncdf4)
library(readxl)
library(raster)
#......Cargar el excel ............
long_lati<-read_excel("ENTRADA/Longitud_Latitud/Longitud_Latitud.xlsx")
View(long_lati)
#......Cargamos los datos .nc.......
raster_pp<-raster::brick("ENTRADA/Precipitacion/PrecipMonthly.nc")
View(raster_pp)
#.......Asignamos las coordenadas
sp::coordinates(long_lati)<- ~XX+YY

#....igualamos las proyecciones del raster y los puntos a extraer
raster::projection(long_lati)<- raster::projection(raster_pp)

#.....Extraemos los valores
points_long_lati<- raster::extract(raster_pp[[1]], long_lati, cellnumbers= T)[,1]
data_long_tati<- t(raster_pp[points_long_lati])
colnames(data_long_tati)<-as.character(long_lati$NN)
