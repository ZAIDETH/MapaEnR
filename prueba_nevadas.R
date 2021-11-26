library(tidyverse)
library(sf)
library(leaflet)
library(leaflet.extras)
library(cptcity)

data <- read_csv(
  'https://raw.githubusercontent.com/ambarja/snowfalldb-peru/main/csv/snowfallDB-Peru.csv'
  ) %>% 
st_as_sf(coords = c('lon','lat'), crs=4326)

data %>% 
leaflet() %>% 
  addTiles() %>% 
  addHeatmap(radius = 7) %>% 
  addMiniMap() %>% 
  addResetMapButton()

#'Prueba Datos Abiertos Perú - https://www.datosabiertos.gob.pe/dataset/centros-de-vacunacion/resource/6a4885db-3c98-428c-abd1-811b712519e2 '

data <- read_csv(
  'https://www.datosabiertos.gob.pe/node/8298/download',
  show_col_types = FALSE #PARA MOSTRAR INFO DE LA DATA
  ) 
data_corregida <- data %>% 
  filter(((longitud <= -60 & longitud>= -90) & (latitud <=0 & latitud >=-20))) %>% 
  st_as_sf(coords = c('longitud','latitud'), crs=4326)
data_2 <- data %>% 
  filter(((longitud <= -60 & longitud>= -90) & (latitud <=0 & latitud >=-20)))

data_corregida %>% 
  leaflet() %>% 
  addTiles() %>% 
  addHeatmap(radius = 6) %>% 
  addMiniMap(height = 50, width = 50) %>% 
  addResetMapButton()


################################################################
p1 = data_corregida %>% 
  st_set_geometry(NULL) %>% 
  group_by(entidad_administra) %>% 
  summarise(conteo = count(id_eess,na.rm = T)) %>% 
  ggplot(aes(x = reorder(entidad_administra,conteo), y = conteo, fill = conteo)) +
  scale_fill_gradientn(colours = cpt(pal = "mpl_viridis"))+
  geom_bar(stat = 'identity')+
  coord_flip()+
  theme_minimal()
ggplotly(p1)


data_corregida %>% 
group_by(entidad_administra) %>% 
  summarise(n=n()).count(na.rm = T)

# prueba2 <- data_corregida %>% count(entidad_administra, sort=TRUE) %>% filter(!is.na(entidad_administra))

data_corregida %>% dplyr::count(entidad_administra)

