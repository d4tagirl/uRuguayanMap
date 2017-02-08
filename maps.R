library(maptools)
shapefile_uru <- readShapeSpatial('shapefileUruguay/uruguay.shp',
                                  proj4string = CRS("+proj=longlat +datum=WGS84"))

## unify polygons
install.packages("gpclib")
gpclibPermit()
shapefile_uru_union <- unionSpatialPolygons(shapefile_uru, 
                                            IDs = rep(1, length(shapefile_uru)))

library(ggplot2)
data_uru <- fortify(shapefile_uru_union)

# only Uruguay 
map_uru <- ggplot(aes(x = long, y = lat, group = group, fill = id), 
                  data = data_uru) + 
  geom_polygon(alpha = .6) + 
  geom_path(aes(x = long, y = lat, group = group), 
            data = data_uru, 
            colour = "purple") +
  scale_fill_manual(values = c("purple"), 
                    guide = FALSE) +
  coord_equal() 

# continent

library(ggmap)
continent <- qmap('uruguay', zoom = 3, maptype = 'watercolor')

# Uruguay in the continent

map_continent_uru <- continent +
  geom_polygon(aes(x = long, y = lat, group = group, fill = id), 
               data = data_uru,
               colour = 'purple', 
               alpha = .6) +
  geom_path(aes(x = long, y = lat, group = group), 
            data = data_uru, 
            colour = "purple") +
  scale_fill_manual(values = c("purple"), 
                    guide = FALSE) 


######## PARAGUAY

shapefile_par <- readShapeSpatial('shapefileParaguay/Departamentos de Paraguay/TodosDepartamentos.shp', 
                                  proj4string = CRS("+proj=longlat +datum=WGS84"))

## unify polygons
shapefile_par_union <- unionSpatialPolygons(shapefile_par, IDs = rep(2, length(shapefile_par)))

data_par <- fortify(shapefile_par_union)

# only Paraguay 
map_par <- ggplot(aes(x = long, y = lat, group = group, fill = id),
                  data = data_par) + 
  geom_polygon(alpha = .6) + 
  geom_path(aes(x = long, y = lat, group = group), data = data_par, 
            colour = "purple") +
  scale_fill_manual(values = c("purple"), guide = FALSE) +
  coord_equal() 


# Uruguay y Paraguay in the continent

map_continent_uru_par <- continent +
  # Paraguay
  geom_polygon(aes(x = long, y = lat, group = group, fill = id), data = data_par, 
               colour = 'blue', alpha = .4) +
  geom_path(aes(x = long, y = lat, group = group), data = data_par, 
            colour = "blue") +
  # Uruguay
  geom_polygon(aes(x = long, y = lat, group = group, fill = id), data = data_uru,
               colour = 'purple', alpha = .6) +
  geom_path(aes(x = long, y = lat, group = group), data = data_uru, 
            colour = "purple") +
  # Filling colors
  scale_fill_manual(values = c("purple", "blue"), guide = FALSE) 

save.image("uRuguayMap.Rdata")

