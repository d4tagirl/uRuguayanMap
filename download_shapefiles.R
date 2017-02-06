# Uruguay
dir.create('shapefileUruguay')
download.file('https://www.ideasoft.biz/wiki/download/attachments/49939319/uruguay.zip?version=1&modificationDate=1287690328914&api=v2', destfile = 'shapefileUruguay/uruguay.zip')
unzip(zipfile = 'shapefileUruguay/uruguay.zip',
      exdir = 'shapefileUruguay')

# Paraguay
dir.create('shapefileParaguay')
download.file('https://github.com/josego85/ProyectosBeta/raw/master/GIS/SHP/Departamentos%20de%20Paraguay.zip', destfile = 'shapefileParaguay/paraguay.zip', method = "libcurl")
unzip(zipfile = 'shapefileParaguay/paraguay.zip',
      exdir = 'shapefileParaguay')