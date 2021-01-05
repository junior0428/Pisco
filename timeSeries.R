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

colnames(data_long_tati)
CURVAN
plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")
points(x, cex = .5, col = "dark red")
plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
     main = "rpois(100, lambda = 5)")