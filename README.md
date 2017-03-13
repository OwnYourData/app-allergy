# <img src="https://github.com/OwnYourData/app-allergy/raw/master/www/app_logo.png" width="92"> Allergie-Tagebuch

Viele Menschen leiden unter Allergien ohne dass sie genau wissen, auf welche Allergene ihr Körper überreagiert. Mit dem Allergie-Tagebuch kannst du dein subjektives Befinden mit der tatsächlichen Belastung in deiner Umgebung vergleichen und gleichzeitig überprüfen, ob eventuell eingenommene Medikamente die erwartete Wirkung zeigen.

Mehr Infos, Screenshots und Demo: https://www.ownyourdata.eu/apps/allergy

### Dein Datentresor
Das Allergie-Tagebuch wird in einem sicheren Datentresor installiert. Üblicherweise musst Du Deine Daten an die Betreiber von Webservices und Apps weitergeben, um diese nutzen zu können. OwnYourData dreht den Spieß jedoch um: Du behältst all Deine Daten und Du verwahrst sie in Deinem eigenen Datentresor. Apps (Datensammlung, Algorithmen und Visualisierung) holst Du zu Dir, in den Datentresor hinein.

Mehr Infos und Demo: https://www.ownyourdata.eu  
Hintergrund-Infos für Entwickler: https://www.ownyourdata.eu/developer/

## Installation

Du kannst entscheiden wo Du Deinen Datentresor einrichten und Deine Apps installieren möchtest: auf Deinem persönlichen OwnYourData-Server, auf einem anderen Cloud-Dienst Deiner Wahl, auf Deinem eigenen Computer oder auf einem Raspberry Pi bei Dir daheim.

### Installation am OwnYourData-Server

Diese Installation ist am einfachsten: Öffne deinen Datentresor und klicke im *OwnYourData App Store* beim Allergie-Tagebuch auf "Install".

### Installation bei Cloud Diensten

Verschiedene Cloud Dienste bieten das Hosting von [Docker](https://www.docker.com) Containern an, z.B. https://sloppy.io oder https://elastx.se. Das Allergie-Tagebuch steht als Docker-Image unter dem Namen `oydeu/app-allergy` auf Dockerhub hier zur Verfügung: https://hub.docker.com/r/oydeu/app-allergy/. (Da das Allergie-Tagebuch auch in einer Variante für Smartphones zur Verfügung steht, soll auch das Image `oydeu/app-allergy_mobile` verwendet werden.)  
Starte den Container und verbinde Dich im Konfigurations-Dialog mit Deinem Datentresor.

### Installation am eigenen Computer/Laptop

Um das Allergie-Tagebuch am eigenen Computer auszuführen, musst du zuerst [eine aktuelle Version von Docker installieren](https://www.docker.com/community-edition#/download). Starte dann das Allergie-Tagebuch mit folgendem Befehl:  
`docker run -p 3838:3838 oydeu/app-allergy`  
Du kannst dann auf das Allergie-Tagebuch mit Deinem Browser unter folgender Adresse zugreifen:  
`http://192.168.99.100:3838`  
  
*Anmerkungen:*  
* wenn du mehrere Apps verwendest, musst Du unterschiedliche Ports verwenden  
  `docker run -p 1234:3838 oydeu/app-allergy` und `http://192.168.99.100:1234`
* Docker vergibt die IP-Adresse auf Deinem Computer unter der Du auf die Container zugreifen kannst. Verwende folgenden Befehl, um die tatsächliche IP-Adresse festzustellen: `docker-machine ip`  
* in diesem Blog-Artikel wird ausführlich die Installation einer App am eigenen PC beschrieben: [Ein Container voller Daten](https://www.ownyourdata.eu/2016/09/26/ein-container-voller-daten/)

### Installation am Raspberry Pi

Das Allergie-Tagebuch steht auch für die Architektur armhf zur Verfügung. Die Installation erfolgt dann wie am Computer/Laptop jedoch unter Verwendung des Docker Image `oydeu/app-allergy_armhf`.  
  
*Anmerkungen:*  
* Allergie-Tagebuch am Dockerhub: https://hub.docker.com/r/oydeu/app-allergy_armhf/  
* zur einfachen Installation von Docker am Raspberry empfehlen wir die SD-Card Images von Hypriot: http://blog.hypriot.com/downloads/
* Befehl zum Start des Containers am Raspberry: `docker run -p 3838:3838 oydeu/app-allergy_armhf`


## Verbessere die Kontoentwicklungs-App

Bitte melde Fehler oder Vorschläge für neue Features / UX-Verbesserungen im [GitHub Issue-Tracker](https://github.com/OwnYourData/app-allergy/issues) und halte dich dabei an die [Contributor Guidelines](https://github.com/twbs/ratchet/blob/master/CONTRIBUTING.md).

Wenn Du selbst an der App mitentwickeln möchtest, folge diesen Schritten:

1. Fork it!
2. erstelle einen Feature Branch: `git checkout -b my-new-feature`
3. Commit deine Änderungen: `git commit -am 'Add some feature'`
4. Push in den Branch: `git push origin my-new-feature`
5. Sende einen Pull Request

## Lizenz

[MIT Lizenz 2017 - OwnYourData.eu](https://raw.githubusercontent.com/OwnYourData/app-allergy/master/LICENSE)
