# Elastic6-PurpleNectar2019

## Algemeen
Deze repo bevat een installatiehandleiding voor het installeren van een elasticsearch-omgeving t.b.v. een workshop Kibana op Purple Nectar 2019. De elasticsearch-omgeving wordt gevuld met een ritinformatie van taxi's in NYC.
Er is gekozen voor taxi-ritten omdat deze informatie goed begrijpelijk is voor een ieder met een IQ boven de 85.

Het idee is om uiteindelijk de data ingeladen en wel via Kibana te ontsluiten vanuit een docker contrainer.
Bij aanvang van de les kunnen de containers gestart worden zodat de uitgangspositie altijd gelijk is.

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

## Elastic.co
De installatie van de componenten elasticsearch, logstash, zijn getest op een Ubuntu 16.04 systeem waar Java al aanwezig was.
De verwachting is dat het ook werkt op de 18.04 systeem.

### Install pre requirements
```
sudo apt install openjdk-8-jre-headless

sudo apt install haveged
```

### Add and prepare the elastic.co repository

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

sudo apt update

sudo apt install elasticsearch

sudo systemctl enable elasticsearch.service

systemctl start elasticsearch.service

sudo aptitude install kibana

sudo systemctl enable kibana

sudo systemctl start kibana

sudo aptitude install logstash


/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/01-taxi.conf



## Docker



