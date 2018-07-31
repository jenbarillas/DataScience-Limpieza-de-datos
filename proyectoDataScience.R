
#-------------------------------------------------------------------------------------------
# Universidad del Valle de Guatemala
# Proyecto 1 - Limpieza de Datos
#
# Integrantes:
#
# Manuel    Valenzuela  15072
# Jennifer  Barillas    15---
# Luisa     ********    14---
#-------------------------------------------------------------------------------------------


#Establecer directorio de trabajo
workSpace <- getwd()      # <<<<<< Dejar esta linea si está puesto el workspace en la dirección
                          # del código.

#workSpace <- "direccion" # <<<<<< Descomentar y Poner aquí si se desea una dirección específica
setwd(workSpace)

# Aquí se instalan los paquetes que se utilizaran en el programa.
# Para instalarlos descomentar el código. Esto solo es necesario la primera vez 
# que se corre el código

#install.packages("dplyr") 
#install.packages("tidyr") 
#install.packages("readxl")
#install.packages("plyr")

library(dplyr)     #
library(tidyr)     # Librerias Utilizadas
library(readxl)    # Para el ordenamiento de Datos
library(plyr)      #



# Descargar los archivos a ordenar:
# Para ordenar los archivos descomentar la línea de abajo. Esto solo es necesario una vez.

#download.file( url = "https://github.com/valenzmanu/proyectoLimpieza/archive/master.zip"
#               , destfile = "datos.zip" )

#unzip( zipfile = "datos.zip" )   #Descomprimir los Archivos

workSpace <- paste(workSpace,"\\proyectoLimpieza-master",sep = "")  # Aquí vamos a la
setwd(workSpace)                                                    # dirección de los archivos

#---------------------------------------------------------------------------------------------------
#
# Aquí se manipulan los archivos descargados para el ordenamiento de los Datos
#
#---------------------------------------------------------------------------------------------------
hechos2017 <- read_xlsx(path = "HechosDeTransito2017.xlsx", range = cell_cols("A:Q"))
hechos2016 <- read_xlsx(path = "HechosDeTransito2016.xlsx", range = cell_cols("A:R"))
hechos2015 <- read_xlsx(path = "HechosDeTransito2015.xlsx", range = cell_cols("A:Y"))
hechos2014 <- read_xlsx(path = "HechosDeTransito2014.xlsx", range = cell_cols("A:U"))
hechos2013 <- read_xlsx(path = "HechosDeTransito2013.xlsx", range = cell_cols("A:T"))
hechos2012 <- read_xlsx(path = "HechosDeTransito2012.xlsx", range = cell_cols("A:Q"))
hechos2011 <- read_xlsx(path = "HechosDeTransito2011.xlsx", range = cell_cols("A:s"))
hechos2010 <- read_xlsx(path = "HechosDeTransito2010.xlsx", range = cell_cols("A:N"))
hechos2009 <- read_xlsx(path = "HechosDeTransito2009.xlsx", range = cell_cols("A:P"))


#Agregamos Campos a cada año de modo que en todos los años tengamos los mismos campos
#A los campos que no aparecen en el año los llenamos con valores NA
hechos2017[c("área_geo_ocu","causa_acc","corre_base","edad_m1","edad_quinquenales","estado_con","edad_per","g_edad","g_edad_60ymás","g_edad_80ymás","sexo_pil")] <- NA
hechos2016[c("causa_acc","corre_base","edad_m1","edad_quinquenales","estado_con","edad_per","g_edad","g_edad_60ymás","g_edad_80ymás","sexo_pil")] <- NA
hechos2015[c("causa_acc","corre_base","edad_quinquenales","g_edad","g_edad_60ymás","g_edad_80ymás")] <- NA
hechos2014["año_ocu"] <- 2014
hechos2014[c("causa_acc","corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora_5","g_modelo_veh")] <- NA
hechos2013["año_ocu"] <- 2013
hechos2013[c("corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora_5","g_modelo_veh","tipo_eve")] <- NA
hechos2012["año_ocu"] <- 2012
hechos2012[c("corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","marca_veh","modelo_veh","tipo_eve")] <- NA
hechos2011["año_ocu"] <- 2011
hechos2011[c("corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","tipo_eve")] <- NA
hechos2010["año_ocu"] <- 2010
hechos2010[c("corre_base","edad_m1","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_edad","g_hora","g_hora_5","g_modelo_veh","marca_veh","muni_ocu","num_hecho","tipo_eve")] <- NA
hechos2009[c("corre_base","edad_m1","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","marca_veh","muni_ocu","tipo_eve","zona_ocu")] <- NA


#Juntamos todos los años en una única base de datos
#hechosUnidos<-full_join(hechos2009, hechos2010, by=c("num_hecho","año_ocu","areag_ocu","causa_acc"="causa_ac","color_vehi" = "color_v","corre_base","depto_ocu","dia_ocu","dia_sem_ocu","edad_m1","edad_quinquenales","estado_pil","edad_pil","g_edad_pil"="g_edad","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mes_ocu","modelo_vehi"="modelo_v","muni_ocu","sexo_pil","tipo_eve","tipo_vehi"="tipo_v","zona_ocu"))


#Cambiamos los nombres de las variables para que coincidan en todos los años
#colnames(hechos2009) <- c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28")
colnames(hechos2009) <- c("num_hecho","dia_ocu","mes_ocu","año_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","sexo_pil","edad_pil","g_edad","estado_pil","tipo_veh","color_veh","modelo_veh","causa_acc","corre_base","edad_m1","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","marca_veh","muni_ocu","tipo_eve","zona_ocu")
colnames(hechos2010) <- c("dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","estado_pil","tipo_veh","color_veh","modelo_veh","causa_acc","año_ocu","corre_base","edad_m1","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_edad","g_hora","g_hora_5","g_modelo_veh","marca_veh","muni_ocu","num_hecho","tipo_eve")
colnames(hechos2011) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","g_edad","edad_m1","estado_pil","tipo_veh","marca_veh","color_veh","modelo_veh","causa_acc","año_ocu","corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","tipo_eve")
colnames(hechos2012) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","g_edad","edad_m1","estado_pil","tipo_veh","color_veh","causa_acc","año_ocu","corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","marca_veh","modelo_veh","tipo_eve")
colnames(hechos2013) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","g_hora","depto_ocu","muni_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","g_edad","edad_m1","tipo_veh","color_veh","modelo_veh","causa_acc","marca_veh","estado_pil","año_ocu","corre_base","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora_5","g_modelo_veh","tipo_eve")
colnames(hechos2014) <- c("num_hecho","corre_base","dia_ocu","dia_sem_ocu","hora_ocu","g_hora","mes_ocu","depto_ocu","muni_ocu","zona_ocu","areag_ocu","sexo_pil","edad_pil","g_edad","edad_m1","estado_pil","tipo_veh","modelo_veh","color_veh","marca_veh","tipo_eve","año_ocu","causa_acc","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","g_hora_5","g_modelo_veh")
colnames(hechos2015) <- c("num_hecho","año_ocu","mes_ocu","dia_ocu","dia_sem_ocu","hora_ocu","g_hora","g_hora_5","depto_ocu","muni_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","edad_m1","g_edad_80ymás","g_edad_60ymás","edad_quinquenales","estado_pil","tipo_veh","marca_veh","color_veh","modelo_veh","g_modelo_veh","tipo_eve","causa_acc","corre_base","g_edad")
colnames(hechos2016) <- c("num_hecho","dia_ocu","año_ocu","hora_ocu","mes_ocu","dia_sem_ocu","muni_ocu","depto_ocu","areag_ocu","zona_ocu","tipo_veh","marca_veh","color_veh","modelo_veh","tipo_eve","g_hora","g_hora_5","g_modelo_veh","causa_acc","corre_base","edad_m1","edad_quinquenales","estado_pil","edad_pil","g_edad","g_edad_60ymás","g_edad_80ymás","sexo_pil")
colnames(hechos2017) <- c("num_hecho","año_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu","dia_sem_ocu","muni_ocu","depto_ocu","zona_ocu","tipo_veh","marca_veh","color_veh","modelo_veh","g_modelo_veh","tipo_eve","areag_ocu","causa_acc","corre_base","edad_m1","edad_quinquenales","estado_pil","edad_pil","g_edad","g_edad_60ymás","g_edad_80ymás","sexo_pil")

#Unimos en una sola tabla
hechosUnidos <- rbind(hechos2009,hechos2010,hechos2011,hechos2012,hechos2013,hechos2014,hechos2015,hechos2016,hechos2017)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

lesionados2009 <- read_xlsx(path = "Lesionados2009.xlsx", range = cell_cols("A:P"))
fallecidos2009 <- read_xlsx(path = "fallecidos.xlsx", range = cell_cols("A:O"))
fyl2010 <- read_xlsx(path = "FallecidosyLesionados2010.xlsx", range = cell_cols("A:M"))
fyl2011 <- read_xlsx(path = "Fallecidosylesionados2011.xlsx", range = cell_cols("A:S"))
fyl2012 <- read_xlsx(path = "FallecidosyLesionados2012.xlsx", range = cell_cols("A:Q"))
fyl2013 <- read_xlsx(path = "FallecidosyLesionados2013.xlsx", range = cell_cols("A:V"))
fyl2014 <- read_xlsx(path = "FallecidosyLesionados2014.xlsx", range = cell_cols("A:W"))
fyl2015 <- read_xlsx(path = "fallecidos_y_lecionados_2015.xlsx", range = cell_cols("A:Z"))
fyl2016 <- read_xlsx(path = "fallecidos_y_lecionados_2016.xlsx", range = cell_cols("A:Y"))
fyl2017 <- read_xlsx(path = "fallecidos_lesionados_2017.xlsx", range = cell_cols("A:Y"))

lesionados2009[c("g_hora","g_hora_5","zona_ocu","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint","mupio_ocu")]<- NA
lesionados2009[c("g_edad_m1")]<-NA
fallecidos2009[c("estado_pil")]<-NA
fallecidos2009[c("año_ocu")]<- 9
fallecidos2009[c("g_hora","g_hora_5","zona_ocu","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint","mupio_ocu")]<- NA
colnames(fallecidos2009) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","sexo_pil","edad_pil","g_edad_pil","g_edad_m1","tipo_vehi","color_vehi","modelo_vehi","causa_acc","aÃ±o_ocu","g_hora","g_hora_5","zona_ocu","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint","mupio_ocu","estado_pil")

lesionados2009 <-lesionados2009[,order(colnames(lesionados2009))]
fallecidos2009 <-fallecidos2009[,order(colnames(fallecidos2009))]
fyl2010 <-fyl2010[,order(colnames(fyl2010))]
fyl2011 <-fyl2011[,order(colnames(fyl2011))]
fyl2012 <-fyl2012[,order(colnames(fyl2012))]
fyl2013 <-fyl2013[,order(colnames(fyl2013))]
fyl2014 <-fyl2014[,order(colnames(fyl2014))]
fyl2015 <-fyl2015[,order(colnames(fyl2015))]
fyl2016 <-fyl2016[,order(colnames(fyl2016))]
fyl2017 <-fyl2017[,order(colnames(fyl2017))]

colnames(fallecidos2009)[1]<-"año_ocu"
fyl2009 <- rbind(lesionados2009,fallecidos2009)
#colnames(fyl2009)


fyl2010[c("año_ocu")] <- 10
fyl2010[c("num_hecho","estado_pil","color_vehi","modelo_vehi","g_hora","g_hora_5","mayor_menor","g_edad80","g_edad60","edad_quinquenales","int_o_niont","mupio_ocu","g_edad_m1")] <- NA
colnames(fyl2010) <- c("dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","g_edad_pil","fall_les","tipo_vehi","causa_acc","aÃ±o_ocu","num_hecho","estado_pil","color_vehi","modelo_vehi","g_hora","g_hora_5","mayor_menor","g_edad80","g_edad60","edad_quinquenales","int_o_noint","mupio_ocu","g_edad_m1")
fyl2010 <-fyl2010[,order(colnames(fyl2010))]
colnames(fyl2010)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fyl2009,fyl2010)
#colnames(fallecidos_lesionados)

fyl2011[c("aÃ±o_ocu")] <- 11
fyl2011[c("g_hora","g_hora_5","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint","g_edad_m1")] <- NA
#colnames(fyl2011)
fyl2011$edad_m1 <- NULL
fallecidos_lesionados[c("marca_vehi")] <- NA
colnames(fyl2011) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","mupio_ocu","areag_ocu","zona_ocu", "sexo_pil","edad_pil","g_edad_pil","estado_pil","tipo_vehi","marca_vehi","color_vehi","modelo_vehi","causa_acc","aÃ±o_ocu","g_hora","g_hora_5","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint","g_edad_m1")
fyl2011 <-fyl2011[,order(colnames(fyl2011))]
colnames(fyl2011)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2011)

fyl2012[c("aÃ±o_ocu")] <- 12
fyl2012[c("marca_vehi","modelo_vehi","g_hora","g_hora_5","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint")] <- NA
colnames(fyl2012) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","mupio_ocu","areag_ocu","zona_ocu", "sexo_pil","edad_pil","g_edad_m1","g_edad_pil","estado_pil","tipo_vehi","color_vehi","causa_acc","aÃ±o_ocu","marca_vehi","modelo_vehi","g_hora","g_hora_5","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint")
fyl2012 <-fyl2012[,order(colnames(fyl2012))]
colnames(fyl2012)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2012)

fyl2013[c("aÃ±o_ocu")] <- 13
fyl2013[c("g_edad_m1","estado_pil","g_hora_5","g_edad80","g_edad60","edad_quinquenales","int_o_noint")] <- NA
fallecidos_lesionados[c("g_edad_2","otro_g_edad")] <- NA
colnames(fyl2013) <- c("num_hecho","dia_ocu","mes_ocu","dia_sem_ocu","hora_ocu","g_hora","depto_ocu","mupio_ocu","areag_ocu","zona_ocu", "sexo_pil","edad_pil","g_edad_2","mayor_menor","tipo_vehi","color_vehi","modelo_vehi","causa_acc","marca_vehi","g_edad_pil","fall_les","otro_g_edad","aÃ±o_ocu","g_edad_m1","estado_pil","g_hora_5","g_edad80","g_edad60","edad_quinquenales","int_o_noint")
fyl2013 <-fyl2013[,order(colnames(fyl2013))]
colnames(fyl2013)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2013)

fyl2014[c("aÃ±o_ocu")] <- 14
fyl2014[c("num_hecho","g_edad_2","otro_g_edad","g_edad_m1","estado_pil","g_hora_5","g_edad80","g_edad60","int_o_noint")] <- NA
fallecidos_lesionados[c("num_correlativo","num_corre","corre_base")] <- NA
colnames(fyl2014) <- c("num_correlativo","num_corre","corre_base","dia_ocu","dia_sem_ocu","hora_ocu","g_hora","mes_ocu","depto_ocu","mupio_ocu","zona_ocu","areag_ocu","sexo_pil", "edad_pil","g_edad_pil","mayor_menor","fall_les","tipo_vehi","modelo_vehi","color_vehi","marca_vehi","causa_acc","edad_quinquenales","aÃ±o_ocu","num_hecho","g_edad_2","otro_g_edad","g_edad_m1","estado_pil","g_hora_5","g_edad80","g_edad60","int_o_noint")
fyl2014 <-fyl2014[,order(colnames(fyl2014))]
colnames(fyl2014)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2014)

fyl2015[c("num_correlativo","corre_base","g_edad_pil","num_hecho","g_edad_2","otro_g_edad","g_edad_m1","estado_pil")] <- NA
fallecidos_lesionados[c("g_modelo_vehi")] <- NA
colnames(fyl2015) <- c("num_corre","aÃ±o_ocu","mes_ocu","dia_ocu","dia_sem_ocu","hora_ocu","g_hora","g_hora_5","depto_ocu","mupio_ocu","areag_ocu","zona_ocu","sexo_pil","edad_pil","mayor_menor","g_edad80","g_edad60","edad_quinquenales","fall_les","int_o_noint","tipo_vehi","marca_vehi","color_vehi","modelo_vehi","g_modelo_vehi","causa_acc","num_correlativo","corre_base","g_edad_pil","num_hecho","g_edad_2","otro_g_edad","g_edad_m1","estado_pil")
fyl2015 <-fyl2015[,order(colnames(fyl2015))]
colnames(fyl2015)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2015)

fyl2016[c("fall_les","int_o_noint","num_correlativo","corre_base","g_edad_pil","num_hecho","g_edad_2","otro_g_edad","g_edad_m1")] <- NA
colnames(fyl2016)<-c("num_corre","dia_ocu","aÃ±o_ocu","hora_ocu","mes_ocu","dia_sem_ocu","mupio_ocu","depto_ocu","areag_ocu","sexo_pil","zona_ocu","edad_pil","estado_pil","mayor_menor","tipo_vehi","marca_vehi","color_vehi","modelo_vehi","causa_acc","g_edad80","g_edad60","edad_quinquenales","g_hora","g_hora_5","g_modelo_vehi","fall_les","int_o_noint","num_correlativo","corre_base","g_edad_pil","num_hecho","g_edad_2","otro_g_edad","g_edad_m1")
fyl2016 <-fyl2016[,order(colnames(fyl2016))]
colnames(fyl2016)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2016)

fyl2017[c("areag_ocu","estado_pil","num_correlativo","corre_base","g_edad_pil","num_hecho","g_edad_2","otro_g_edad","g_edad_m1")] <- NA
colnames(fyl2017) <- c("num_corre","aÃ±o_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu","dia_sem_ocu","mupio_ocu","depto_ocu","zona_ocu","sexo_pil","edad_pil","g_edad80","g_edad60","edad_quinquenales","mayor_menor","tipo_vehi","marca_vehi","color_vehi","modelo_vehi","g_modelo_vehi","causa_acc","fall_les","int_o_noint","areag_ocu","estado_pil","num_correlativo","corre_base","g_edad_pil","num_hecho","g_edad_2","otro_g_edad","g_edad_m1")
fyl2017 <-fyl2017[,order(colnames(fyl2017))]
colnames(fyl2017)[1]<-"año_ocu"
fallecidos_lesionados <- rbind(fallecidos_lesionados,fyl2017)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Cargamos los xlsx en variables
v2010 <- read_excel("Vehiculos2010.xlsx")
v2012 <- read_excel("Vehiculos2012.xlsx")
v2013 <- read_excel("Vehiculos2013.xlsx")
v2014 <- read_excel("Vehiculos2014.xlsx")
v2015 <- read_excel("vehiculos2015.xlsx")
v2016 <- read_excel("vehiculos2016.xlsx")
v2017 <- read_excel("vehiculos2017.xlsx")

#Agregamos las columnas faltantes

v2010[c("num_hecho","corre_base","g_hora","g_hora_5","mun_ocu","edad_80","edad_60","edad_15", "mayor","g_edad","edad_m1","marca_veh","g_modelo_veh","tipo_eve")]<-NA
#ponemos un aÃ±o fijo para las que no lo tienen
v2010["aÃ±o_ocu"] <- 2010

v2012[c("corre_base","g_hora","g_hora_5","edad_80","edad_60","edad_15","mayor","marca_veh","g_modelo_veh","tipo_eve")] <- NA
v2012["aÃ±o_ocu"] <- 2012

v2013[c("corre_base","dia_sem_ocu","mes_ocu","g_hora","g_hora_5","edad_80","edad_60","edad_15","g_edad","edad_m1","tipo_eve")] <- NA
v2013["aÃ±o_ocu"] <- 2013

v2014[c("g_hora","g_hora_5","edad_80","edad_60","edad_15","mayor","edad_m1","causa_acc")] <- NA
v2014["aÃ±o_ocu"] <- 2014

v2015[c("corre_base","dia_sem_ocu","mes_ocu","g_edad","edad_m1","causa_acc")] <- NA

v2016[c("corre_base","g_hora","g_hora_5","sexo_pil","edad_pil","edad_80","edad_60","edad_15","mayor","g_edad","edad_m1","estado_pil","g_modelo_veh","causa_acc","tipo_eve")] <- NA

v2017[c("corre_base","area_geo","g_edad","edad_m1","causa_acc")] <- NA

#guardamos las tablas en orden alfabetico
v2010 <-v2010[,order(colnames(v2010))]
v2012 <-v2012[,order(colnames(v2012))]
v2013 <-v2013[,order(colnames(v2013))]
v2014 <-v2014[,order(colnames(v2014))]
v2015 <-v2015[,order(colnames(v2015))]
v2016 <-v2016[,order(colnames(v2016))]
v2017 <-v2017[,order(colnames(v2017))]


#renombramos las columnas de todas las hojas
colnames(v2010) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(v2012) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(v2013) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(v2014) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(v2015) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(v2016) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(v2017) <- c("area_geo","aÃ±o_ocu","causa_acc","color_veh","corre_base","dep_ocu","dia_ocu","dia_sem_ocu","edad_15","edad_60","edad_80","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","mun_ocu","num_corre","sexo_pil","tipo_eve","tipo_veh","zona_ocu")

#juntamos los archivos en uno solo
Vehiculos_Incolucrados <- rbind(v2010,v2012,v2013,v2014,v2015,v2016,v2017)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Ordenamos alfabeticamente las 3 tablas principales
Vehiculos_Incolucrados <- Vehiculos_Incolucrados[,order(colnames(Vehiculos_Incolucrados))]
fallecidos_lesionados <- fallecidos_lesionados[,order(colnames(fallecidos_lesionados))]
hechosUnidos <- hechosUnidos[,order(colnames(hechosUnidos))]

#Renombramos variables en comun
colnames(Vehiculos_Incolucrados) <- c("año_ocu","areag_ocu","causa_acc","color_veh","corre_base","depto_ocu","dia_ocu","dia_sem_ocu","edad_quinquenales","g_edad_60ymás","g_edad_80ymás","edad_m1","edad_pil","estado_pil","g_edad","g_hora","g_hora_5","g_modelo_veh","hora_ocu","marca_veh","mayor","mes_ocu","modelo_veh","muni_ocu","num_hecho","sexo_pil","tipo_eve","tipo_veh","zona_ocu")
colnames(fallecidos_lesionados) <-  c("año_ocu","areag_ocu","causa_acc","color_veh","corre_base","depto_ocu","dia_ocu","dia_sem_ocu","edad_pil","edad_quinquenales","estado_pil","fall_les","g_edad","edad_m1","g_edad_pil","g_edad_60ymás","g_edad_80ymás","g_hora","g_hora_5","g_modelo_veh","hora_ocu","int_o_noint","marca_veh","mayor","mes_ocu","modelo_veh","muni_ocu","num_hecho","num_hecho1","num_hecho2","otro_g_edad","sexo_pil","tipo_veh","zona_ocu")

#Agregamos columna de tipo de lectura (vehiculos, hechos o fallecidos)
Vehiculos_Incolucrados[c("Tipo_Lec")] <- 1
fallecidos_lesionados[c("Tipo_Lec")] <- 2
hechosUnidos[c("Tipo_Lec")] <- 3

#Ordenamos de Nuevo
Vehiculos_Incolucrados <- Vehiculos_Incolucrados[,order(colnames(Vehiculos_Incolucrados))]
fallecidos_lesionados <- fallecidos_lesionados[,order(colnames(fallecidos_lesionados))]
hechosUnidos <- hechosUnidos[,order(colnames(hechosUnidos))]

#baseFinal  <- rbind(Vehiculos_Incolucrados,fallecidos_lesionados,hechosUnidos)
baseFinal <- merge(Vehiculos_Incolucrados, fallecidos_lesionados, all=TRUE)
baseFinal <- merge(baseFinal,hechosUnidos, all=TRUE)

#---------------------------------------------------------------------------------------------------
# Aquí se terminan de manipular los datos.
#---------------------------------------------------------------------------------------------------



#---------------------------------------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>> Exportar Archivo csv con los datos ordenados <<<<<<<<<<<<<<<<<<<<<<<<<<<
# 
# 1. Se abrira una ventana en donde dara la opción de abrir un archivo.
# 2. Seleccionar ubicación en donde se desea guardar el archivo
# 3. Seleccionar el archivo
csv en dónde se quieren exportar los datos. Si se desea
#    crear un archivo nuevo solo escribir el nombre, selecciónar abrir y luego seleccionar
#    crear archivo nuevo.
#---------------------------------------------------------------------------------------------------


#Exportamos la base de datos en un archivo csv
#write.csv(baseFinal, file = file.choose(new = FALSE))   #csv separado por ","
write.csv2(baseFinal, file = file.choose(new = FALSE))  #csv separado por ";"

