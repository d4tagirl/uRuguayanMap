# Uruguay

dir.create('uruguay')
download.file('https://www.ideasoft.biz/wiki/download/attachments/49939319/uruguay.zip?version=1&modificationDate=1287690328914&api=v2', destfile = 'uruguay/uruguay.zip')
unzip(zipfile = 'uruguay/uruguay.zip',
      exdir = 'uruguay')


dir.create('paraguay')
download.file('https://github.com/josego85/ProyectosBeta/raw/master/GIS/SHP/Departamentos%20de%20Paraguay.zip', destfile = 'paraguay/paraguay.zip', method = "libcurl")
unzip(zipfile = 'paraguay/paraguay.zip',
      exdir = 'paraguay')