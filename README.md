# Allergie-Tagebuch

![App Logo](https://github.com/OwnYourData/app-allergy/blob/master/www/app_logo.png =128x128)

Das [OwnYourData](https://www.ownyourdata.eu) Allergie-Tagebuch erlaubt den Vergleich zwischen gemessener Pollenbelastung und subjektiven Befinden.


## Installation

Die App kann gratis über den offiziellen [OwnYourData SAM](http://oyd-sam.herokuapp.com) (Store for Algorithms) installiert werden. Klicke dazu in der PIA App-Liste "Plugin installieren" und wähle "Allergie-Tagebuch" (ID: eu.ownyourdata.allergy) aus.

Die Kontoentwicklungs-App benötigt das Shiny-Host-Service (ebenfalls verfügbar am OwnYourData SAM, ID: eu.ownyourdata.shinyhost) und [Docker](https://www.docker.com/) installiert.


## Verwendung

In Österreich haben ca. 30% der Bevölkerung ein oder mehrere Allergien. Mit dem Allergie-Tagebuch kann das eigene Befinden, sowie eventuelle Medikamenten-Einnahme aufgezeichnet werden, und dann mit der gemessenen Pollenbelastung verglichen werden. Sieht man einen Zusammenhang, so ist das ein starkes Indiz für eine Allergie in diesem Bereich und man sollte weitere Schritte unternehmen.  
Die App umfasst folgende Funktionen:

* tägliche Datenerfassung zu Pollenbelastung, persönlichem Befinden und Medikamenten-Einnahme
* Visualisierung der vorhandenen Daten zur Identifikation von Zusammenhängen
* Einschränkung der Darstellung auf ein bestimmtes Zeitfenster
* optional: automatisierte Datensammlung der gemessenen Pollenbelastung an einem Ort 
  (die Daten stammen dabei von [www.pollenwarndienst.at](http://www.pollenwarndienst.at))
* optional: tägliche Emails die eigenes Befinden und Medikamenteneinnahme abfragen


## Für Entwickler  

Diese App wurde in [R](https://cran.r-project.org/) entwickelt und verwendet [Shiny](http://shiny.rstudio.com/). Zur Ausführung wird entweder das OwnYourData Shiny Service benötigt (siehe oben: Installation) oder es existiert ein bereits [installierter Shiny Server](https://github.com/rstudio/shiny-server/wiki/Building-Shiny-Server-from-Source). Wird ein eigener Shiny Server betrieben, kann in der PIA App-Liste mit "Register a new Plugin" das Manifest base64-encodiert hinzugefügt werden (angegeben am Beginn der Datei `server.R`) und in der App unter Konfiguration müssen die Parameter URL, App-Key und App-Secret selbst gesetzt werden.  
Zum Ausprobieren kann die App auf [Heroku](https://www.heroku.com/) deployed werden:  
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


## Verbessere die Kontoentwicklungs-App

1. Fork it!
2. erstelle einen Feature Branch: `git checkout -b my-new-feature`
3. Commit deine Änderungen: `git commit -am 'Add some feature'`
4. Push in den Branch: `git push origin my-new-feature`
5. Sende einen Pull Request

## Lizenz

MIT Lizenz 2016 - Own Your Data
