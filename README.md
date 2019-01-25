# Elastic6-PurpleNectar2019

* Algemeen
Deze repo bevat een installatiehandleiding voor het installeren van een elasticsearch-omgeving t.b.v. een workshop Kibana op Purple Nectar 2019. De elasticsearch-omgeving wordt gevuld met een ritinformatie van taxi's in NYC.
Er is gekozen voor taxi-ritten omdat deze informatie goed begrijpelijk is voor een ieder met een IQ boven de 85.

De oorspronkelijke dataset komt uit April 2015.
Er is gekozen voor deze dataset omdat in 2015 de New York Open Data voor Taxi's nog geo-locaties bevatten.
http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml

Op basis van een eenvoudige search and replace is het jaar 2015 vervangen door 2019.
De aangepaste dataset is te vinden op:
https://www.dropbox.com/s/io0llunlr03qhze/green_tripdata_2019-04.csv?dl=0

De dataset bevat informatie van zogenaamde green taxi's/cabs.
Er is gekozen voor deze dataset omdat een volledige maand slecht 256MB groot is.
Dit omdat er aanzienlijk minder green cabs zijn t.o.v. yellow cabs.

"Boro taxis (or boro cab) are taxicabs in New York City that are allowed to pick up passengers (street hails or calls) in outer boroughs (excluding John F. Kennedy International Airport and LaGuardia Airport unless arranged in advance) and in Manhattan above East 96th and West 110th Streets. The color of boro taxis is apple green (bright green) in contrast to the traditional yellow taxis in New York City." 
bron: https://en.wikipedia.org/wiki/Boro_taxi

Bij het plotten van de pickup(geoip) in Kibana is duidelijk terug te zien dat er op Manhattan geen dispatched pickups zijn onder bovengenoemde straten.

