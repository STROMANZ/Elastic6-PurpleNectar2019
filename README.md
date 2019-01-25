# Elastic6-PurpleNectar2019

## Algemeen
Deze repo bevat een installatiehandleiding voor het installeren van een elasticsearch-omgeving t.b.v. een workshop Kibana op Purple Nectar 2019. De elasticsearch-omgeving wordt gevuld met een ritinformatie van taxi's in NYC.
Er is gekozen voor taxi-ritten omdat deze informatie goed begrijpelijk is voor een ieder met een IQ boven de 85.

Het idee is om uiteindelijk de data ingeladen en wel via Kibana te ontsluiten vanuit een docker contrainer.
Bij aanvang van de workshop kunnen de containers gestart worden zodat de uitgangspositie altijd gelijk is.

De oorspronkelijke dataset komt uit April 2015.
Er is gekozen voor deze dataset omdat in 2015 de New York Open Data voor Taxi's nog geo-locaties bevatten.
http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml

Op basis van een eenvoudige search and replace is het jaar 2015 vervangen door 2019.
Deze dataset bevat dus tijdens PN2019 data voor de gehele maand, inclusief de "last 15 minutes" (en de toekomst).
De aangepaste dataset is te vinden op:
https://www.dropbox.com/s/io0llunlr03qhze/green_tripdata_2019-04.csv?dl=0

De dataset bevat informatie van zogenaamde green taxi's/cabs.
Er is gekozen voor deze dataset omdat een volledige maand slecht 256MB groot is.
Dit komt omdat er aanzienlijk minder green cabs zijn t.o.v. yellow cabs.

bron: https://en.wikipedia.org/wiki/Boro_taxi -->
"Boro taxis (or boro cab) are taxicabs in New York City that are allowed to pick up passengers (street hails or calls) in outer boroughs (excluding John F. Kennedy International Airport and LaGuardia Airport unless arranged in advance) and in Manhattan above East 96th and West 110th Streets. **The color of boro taxis is apple green (bright green)** in contrast to the traditional yellow taxis in New York City." 

Bij het plotten van de pickup(geoip) in Kibana is duidelijk terug te zien dat er op Manhattan zeer weinig pickups zijn onder de bovengenoemde straten. Aan de deelnemers van de workshop kan dan ook gevraagd worden wat ze opvalt aan de visualisatie op de kaart. Tips boven de $100, levert ook leuke resultaten op.

## Elastic.co
De installatie van de componenten elasticsearch, logstash, zijn getest op een Ubuntu 16.04 systeem waar Java al aanwezig was.
De verwachting is dat het ook werkt op de 18.04 systeem.

### Install pre-requirements
```
sudo apt install openjdk-8-jre-headless
sudo apt install haveged
sudo apt install curl
```

### Prepare the elastic.co repository
```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt update
```

### Install, enable and start elasticsearch
```
sudo apt install elasticsearch
sudo systemctl enable elasticsearch.service
systemctl start elasticsearch.service
```
Verify: curl -XGET localhost:9200


### Install, enable and start kibana
```
sudo aptitude install kibana
sudo systemctl enable kibana
sudo systemctl start kibana
```
Verify: port http://localhost:5601 is available and shows the Kibana UI


### Install logstash, place configuration and fill elasticsearch
```
sudo aptitude install logstash
cp 01-taxi.conf /etc/logstash/conf.d/
cp taxi-template.json /etc/logstash/conf.d/
cp green_tripdata_2019-04.csv /tmp
/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/01-taxi.conf
```

### Apache/Nginx Proxy met basis auth
Bestaande proxy gebruiken (?)
htpasswd

## Docker
TODO:
Doe bovenstaande na en verwijder logstash, is na het inlezen niet meer noodzakelijk.
De dataset uit tmp mag/is weg.

De dataset is vrij fors voor een docker image:
```
du -sh /var/lib/elasticsearch
1.1G	/var/lib/elasticsearch
```
Een mogelijk oplossing hiervoor:
https://www.elastic.co/blog/data-rollups-in-elasticsearch-you-know-for-saving-space

Dockerfile plaatsen in deze repo.


