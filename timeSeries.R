data <- read.csv("input/preci.csv")
data <- data[, -1] #ignoro la primera columna
View(data)

nombres <- c("SAN ISIDRO", "CRUCETA", "CURVAN", "EL TABLAZO", "HUALTACO", "MALINGAS", "MALINGAS 1", "TAMBO GRANDE", "SAN JOAQUIN", "TEJEDORES", "CHULUCANAS", "HACIENDA YAPATERA", "HUAPALAS", "SAN PEDRO", "SANTO DOMINGO", "SANTO DOMINGO 1", "MIRAFLORES", "PIURA", "ALTAMIZA", "CHALACO", "PALO BLANCO", "PASAPAMPA", "MORROPON", "CORRAL DEL MEDIO", "PALTASHACO", "SAN MIGUEL", "VIRREY", "HACIENDA PABUR", "CANCHAQUE", "HUANCABAMBA", "HACIENDA BIGOTE", "BARRIOS", "MONTEGRANDE", "MALACASI", "MALACASI 1", "CHIGNIA", "PIRGAS", "BERNAL", "CHUSIS", "LAGUNA RAMON")

colnames(data) <- nombres

for (i in 1:ncol(data)) {
  titulo <- paste("Estación Meteorológica de", nombres[i])
  save_png <- paste0("png/Estacion_", nombres[i], ".png")
  data_tmp <- ts(data[, i], start = 1981, frequency = 12)
  png(filename = save_png, width = 1200, units = "px")
  plot(data_tmp, xlab="Año (1981 al 2016)", 
       ylab="Precipitaciones mensuales", type="S", 
       col="blue", lwd="2.5", main=titulo,
       sub="Fuente: Datos PISCO SENAMHI")
  dev.off()
}
