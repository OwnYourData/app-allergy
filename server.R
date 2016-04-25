# Manifest for allergy app ================================
'
encode with https://www.base64encode.org/
{
        "name":"Allergy App",
        "identifier":"eu.ownyourdata.allergy",
        "type":"external",
        "description":"track your allergy (pollination, mood, medicine intake)",
        "permissions":["eu.ownyourdata.allergy.pollination:read",
                       "eu.ownyourdata.allergy.pollination:write",
                       "eu.ownyourdata.allergy.pollination:update",
                       "eu.ownyourdata.allergy.pollination:delete",
                       "eu.ownyourdata.allergy.condition:read",
                       "eu.ownyourdata.allergy.condition:write",
                       "eu.ownyourdata.allergy.condition:update",
                       "eu.ownyourdata.allergy.condition:delete",
                       "eu.ownyourdata.allergy.medintake:read",
                       "eu.ownyourdata.allergy.medintake:write",
                       "eu.ownyourdata.allergy.medintake:update",
                       "eu.ownyourdata.allergy.medintake:delete",
                       "eu.ownyourdata.scheduler:read",
                       "eu.ownyourdata.scheduler:write",
                       "eu.ownyourdata.scheduler:update",
                       "eu.ownyourdata.scheduler:delete",
                       "eu.ownyourdata.scheduler.email_config:read",
                       "eu.ownyourdata.scheduler.email_config:write",
                       "eu.ownyourdata.scheduler.email_config:update",
                       "eu.ownyourdata.scheduler.email_config:delete"]
}
'

# Setup and config ========================================
# install.packages(c('shiny', 'shinyBS', 'RCurl', 'jsonlite', 'dplyr'), repos='https://cran.rstudio.com/')
library(shiny)
library(RCurl)
library(jsonlite)
library(dplyr)

source("oyd_helpers.R")

first <- TRUE
script_pollenwarndienst <- "library(XML); suppressPackageStartupMessages(library(RCurl)); url<-'https://www.pollenwarndienst.at/de/aktuelle-werte.html?zip=[PLZ]&maincity=10&tabber=2'; data<-getURL(url,ssl.verifypeer=0L, followlocation=1L); page<-htmlTreeParse(data, useInternal=TRUE); value<-xpathSApply(page,\"/html/body/div[@id='wrapper']/div[@id='content']/div[@id='content_left']/div[@id='c3']/div[@id='charts_container']/div[@id='tabber_contamination']/div[@class='chart_content contamination ']/div[@class='contamination_row']/div[contains(text(), '[allergy]')]/following::div[1]\", xmlValue)[1]; if (is.null(value) | value=='') value <- '0'; result <- utf8ToInt(value);"

# Shiny Server ============================================
shinyServer(function(input, output, session) {

# Allergy specific functions ==============================
        allergyRepo <- reactive({
                url <- input$allergy_url
                app_key <- input$allergy_app_key
                app_secret <- input$allergy_app_secret
                if(is.null(url) |
                   is.null(app_key) | 
                   is.null(app_secret)) {
                        vector()
                } else {
                        if((nchar(url) > 0) & 
                           (nchar(app_key) > 0) & 
                           (nchar(app_secret) > 0)) {
                                if(input$localAllergySave) {
                                        save(url, 
                                             app_key, 
                                             app_secret, 
                                             file='~/allergyCredentials.RData')
                                } else {
                                        # if (file.exists('~/allergyCredentials.RData'))
                                        #         file.remove('~/allergyCredentials.RData')
                                }
                                getRepo(url, app_key, app_secret)
                        } else {
                                vector()
                        }
                }
        })

        allergyData <- function(category){
                repo <- allergyRepo()
                if(length(repo) > 0) {
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], 
                                               '.',category))
                        piaData <- readItems(repo, url)
                } else {
                        piaData <- data.frame()
                }
                piaData
        }

        allAllergyData <- function(){
                p_data <- data.frame()
                m_data <- data.frame()
                c_data <- data.frame()
                data <- allergyData('pollination')
                p_data <- data
                if(nrow(data) > 0) {
                        dataCondition <- allergyData('condition')
                        c_data <- dataCondition
                        if(nrow(dataCondition) > 0) {
                                data <- merge(data[, !names(data) %in% c('id')], 
                                              dataCondition[, !names(dataCondition) %in% c('id')],
                                              by='date', all=TRUE)
                        }
                } else {
                        data <- allergyData('condition')
                        c_data <- data
                }
                if(nrow(data) > 0) {
                        dataMedintake <- allergyData('medintake')
                        m_data <- dataMedintake
                        if(nrow(dataMedintake) > 0) {
                                data <- merge(data[, !names(data) %in% c('id')], 
                                              dataMedintake[, !names(dataMedintake) %in% c('id')],
                                              by='date', all=TRUE)
                        }
                } else {
                        data <- allergyData('medintake')
                        data <- data[, !names(data) %in% c('id')]
                        m_data <- data
                }
                data
        }
        
        plotData <- function(data){
                data$date <- as.Date(data$date)
                allergyMin <- min(data$date)
                allergyMax <- max(data$date)
                mymin <- as.Date(input$dateRange[1], "%Y-%m-%d")
                mymax <- as.Date(input$dateRange[2], "%Y-%m-%d")
                daterange <- seq(mymin, mymax, "days")
                data <- data[data$date %in% daterange, ]
                if(nrow(data) > 0) {
                        closeAlert(session, 'noDataAlert')
                        data <- data[with(data, order(date)),]
                        
                        # draw graphic
                        par(mar=c(5, 4, 4, 6) + 0.1)
                        plot(x=data$date, y=data$medintake,
                             type='h', col='red', lwd=10, 
                             ylim=c(0,1), xlim=c(mymin, mymax),
                             axes=FALSE, xlab='', ylab='')
                        
                        par(new=TRUE)
                        polDat <- data$pollination
                        plot(x=data$date[!is.na(polDat)], 
                             y=data$pollination[!is.na(polDat)],
                             type='b', pch=15, col='green', 
                             ylim=c(0,4), xlim=c(mymin, mymax),
                             axes=FALSE, xlab='', ylab='')
                        
                        mtext('Werte vom Pollenwarndienst', 
                              side=4, col='green', line=2.5)
                        axis(1, at=daterange, labels=daterange)
                        axis(4, ylim=c(0,4), las=1, 
                             col='green', col.axis='green')
                        
                        par(new=TRUE, xpd=TRUE)
                        conDat <- data$condition
                        plot(x=data$date[!is.na(conDat)], 
                             y=data$condition[!is.na(conDat)],
                             type='b', pch=16, axes=FALSE,
                             ylim=c(1,10), xlim=c(mymin, mymax),
                             main='eigene & gemessene Pollenbelastung',
                             xlab='', ylab='eigene Pollenbelastung')
                        
                        axis(2, col='black',col.axis='black',las=1)
                        legend("bottom", inset=c(0,-0.4), -1, "Tage mit Antiallergika Einnahme",
                               lwd = 10, col="red",ncol=1,bty ="n")
                } else {
                        createAlert(session, "noData", "noDataAlert", style="warning", title="Keine Daten im ausgewählten Zeitfenster",
                                    content=paste0("Passen sie links die Zeitauswahl an - es stehen Daten zwischen ", 
                                                   format(as.POSIXct(allergyMin, "%Y-%m-%d"), "%d.%m.%Y"), 
                                                   " und ", 
                                                   format(as.POSIXct(allergyMax, "%Y-%m-%d"), "%d.%m.%Y"), 
                                                   " zur Verfügung."))
                }
        }

        savedPia <- eventReactive(input$exportButton, {
                repo <- allergyRepo()
                date <- input$manDate
                
                # Pollination
                if(input$usePollination) {
                        pollination <- input$manPollination
                        pollType <- input$manAllergy
                        piaData <- allergyData('pollination')
                        existData <- piaData[piaData$date == date &
                                             piaData$pollType == pollType, ]
                        data <- list(date=date, 
                                     pollination=pollination, 
                                     pollType=pollType)
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], ".pollination"))
                        if (nrow(existData) > 0) {
                                updateRecord(repo, url, data, existData$id)
                        } else {
                                writeRecord(repo, url, data)
                        }
                }
                
                # Condition
                if(input$useCondition) {
                        condition   <- input$manCondition
                        piaData <- allergyData('condition')
                        existData <- piaData[piaData$date == date, ]
                        data <- list(date=date, condition=condition)
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], ".condition"))
                        if (nrow(existData) > 0) {
                                updateRecord(repo, url, data, existData$id)
                        } else {
                                writeRecord(repo, url, data)
                        }
                }
                
                # Medicine intake
                if(input$useMedintake) {
                        medintake <- as.numeric(input$manMedintake)
                        piaData <- allergyData('medintake')
                        existData <- piaData[piaData$date == date, ]
                        if(medintake == 1) {
                                data <- list(date=date, medintake=1)
                        } else {
                                data <- list(date=date, medintake=NA)
                        }
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], ".medintake"))
                        if (nrow(existData) > 0) {
                                updateRecord(repo, url, data, existData$id)
                        } else {
                                writeRecord(repo, url, data)
                        }
                }
                output$plot <- renderPlot(plotData(allAllergyData()))
                paste('<strong>zuletzt aktualisiert:</strong>',
                      format(Sys.time(), '%H:%M:%S'))
        })

        setPollConfig <- function(allergy, plz){
                updateSelectInput(session, 'allergy',
                                  selected=allergy)
                updateTextInput(session, 'plz',
                                value=plz)
                
        }       
        
        getPiaPollConfig <- function(repo){
                url <- itemsUrl(repo[['url']], 
                                schedulerKey())
                retVal <- readItems(repo, url)
                retVal <- retVal[retVal$repo == repo[['app_key']], ]
                if(length(retVal) == 0 | 
                   nrow(retVal) == 0) {
                        vector()
                } else {
                        list(id=retVal$id,
                             allergy=retVal$parameters$replace$allergy,
                             plz=retVal$parameters$replace$PLZ)
                }
        }

        writePollConfig <- function(repo, pollConfig){
                replace = list(PLZ=pollConfig[['plz']], 
                               allergy=pollConfig[['allergy']])
                r_script <- toString(base64Encode(script_pollenwarndienst))
                parameters <- list(
                        Rscript_base64=r_script,
                        replace=replace,
                        repo_url = repo[['url']],
                        repo_key = repo[['app_key']],
                        repo_secret = repo[['app_secret']])
                config <- list(repo=repo[['app_key']],
                               time='0 18 * * *',
                               task='Rscript',
                               parameters=parameters)
                if(is.null(pollConfig[['id']])) {
                        writeRecord(repo,
                                    itemsUrl(repo[['url']], schedulerKey()), 
                                    config)
                } else {
                        updateRecord(repo,
                                     itemsUrl(repo[['url']], schedulerKey()),
                                     config,
                                     pollConfig[['id']])
                }
        }
        
        pollinationStatus <- reactive({
                repo <- allergyRepo()
                pollConfig <- getPiaPollConfig(repo)
                localAllergy <- input$allergy
                localPlz <- input$plz
                if (length(pollConfig) > 0) {
                        piaAllergy <- pollConfig[['allergy']]
                        piaPlz <-  pollConfig[['plz']]
                        if((piaAllergy == localAllergy) &
                           (piaPlz == localPlz)) {
                                'config in sync'
                        } else {
                                if (((nchar(localAllergy) == 0) | (localAllergy == 'auswählen...')) &
                                    ((nchar(localPlz) == 0) | (localPlz == ''))) {
                                        setPollConfig(piaAllergy, piaPlz)
                                        'config read'
                                } else {
                                        pollConfig <- list(allergy=localAllergy,
                                                           plz=localPlz,
                                                           id=pollConfig[['id']])
                                        writePollConfig(repo, pollConfig)
                                        'config updated'
                                }
                        }
                } else {
                        if (((nchar(localAllergy) > 0) | (localAllergy == 'auswählen...')) &
                            ((nchar(localPlz) > 0) | (localPlz == ''))) {
                                pollConfig <- list(allergy=localAllergy,
                                                   plz=localPlz)
                                writePollConfig(repo, pollConfig)
                                'config created'
                        } else {
                                'no config'       
                        }
                }
        })

# Allergy specific output fields ==========================
        output$plot <- renderPlot({
                input$exportButton
                if(first) {
                        createAlert(session, 'topAlert', style='danger', title='Sie befinden sich auf einer unsicheren Webseite!',
                                    content="Die auf dieser Webseite eingegebenen und hochgeladenden Daten können möglicherweise durch Unberechtigte mitgelesen werden - <a href='https://www.ownyourdata.eu/laendervergleich-datenschutz/'>weitere Infos</a>.<br><strong>Lösung:</strong> <a href='https://www.ownyourdata.eu/apps/kontodaten-visualisierung-app/'>Installieren</a> sie die <em>Kontoauszüge App</em> an einem sicheren Ort ihrer Wahl!", append=FALSE)
                        createAlert(session, 'noPIA', 'noPIAAlert', style='warning', title='Keine Verbindung zu einer PIA',
                                    content="Die eingegebenen Daten werden nicht gespeichert und es kann später nicht mehr darauf zugegriffen werden. Geben sie links unter 'PIA' die Zugriffsdaten ein.", append=FALSE)
                        first <<- FALSE                  
                }
                repo <- allergyRepo()
                if (length(repo)>0) {
                        if (!is.na(repo[['token']])) {
                                closeAlert(session, 'noPIAAlert')
                                data <- allAllergyData()
                                if (nrow(data) > 0) {
                                        plotData(data)
                                }
                        }
                }
        })
        
        output$last_saved <- renderText({
                savedPia()
        })
        
        output$allergy_token <- renderText({
                repo <- allergyRepo()
                if (length(repo) == 0) {
                        '<strong>Token:</strong> nicht verfügbar'
                } else {
                        paste0('<strong>Token:</strong><br><small>', 
                               repo[['token']], '</small>')
                }
        })
        
        output$allergy_records <- renderText({
                data <- allAllergyData()
                paste('<strong>Datensätze:</strong>',
                      nrow(data))
        })
        
        output$pollination_status <- renderText({
                retVal <- pollinationStatus()
                paste('<strong>Status:</strong>',
                      switch(retVal,
                             'no config'      = 'automatische Datensammlung noch nicht konfiguriert',
                             'config read'    = 'automatische Datensammlung aus PIA gelesen',
                             'config created' = 'automatische Datensammlung erfolgreich konfiguriert',
                             'config updated' = 'Konfiguration der Datensammlung aktualisiert',
                             'config in sync' = 'automatische Datensammlung wird durchgeführt'))
        })

# Email reminders =========================================        
        getLocalEmailConfig <- reactive({
                validEmailConfig <- FALSE
                server <- input$mailer_address
                port <- input$mailer_port
                user <- input$mailer_user
                pwd <- input$mailer_password
                if((nchar(server) > 0) & 
                   (nchar(port) > 0) & 
                   (nchar(user) > 0) & 
                   (nchar(pwd) > 0)) {
                        validEmailConfig <- TRUE
                }
                c('valid'=validEmailConfig,
                  'server'=server,
                  'port'=port,
                  'user'=user,
                  'pwd'=pwd)
        })
        
        emailConfigStatus <- function(repo){
                localMailConfig <- getLocalEmailConfig()
                piaMailConfig <- getPiaEmailConfig(repo)
                if (localMailConfig[['valid']]) {
                        # is there already a config in PIA?
                        if (length(piaMailConfig) > 0) {
                                # is it different?
                                if((localMailConfig[['server']] == piaMailConfig[['server']]) &
                                   (localMailConfig[['port']] == piaMailConfig[['port']]) &
                                   (localMailConfig[['user']] == piaMailConfig[['user']]) &
                                   (localMailConfig[['pwd']] == piaMailConfig[['pwd']])) {
                                        'config in sync'
                                } else {
                                        updateEmailConfig(repo, 
                                                          localMailConfig, 
                                                          piaMailConfig[['id']])
                                        'config updated'
                                }
                        } else {
                                writeEmailConfig(repo, localMailConfig)
                                'config saved'
                        }
                } else {
                        # is there already a config in PIA?
                        if (length(piaMailConfig) > 0) {
                                setEmailConfig(session, piaMailConfig)
                                'config loaded' # Mailkonfiguration von PIA gelesen
                        } else {
                                'not configured' # keine Mailkonfiguration vorhanden
                        }
                }
        }
        
        emailReminderStatus <- reactive({
                repo <- allergyRepo()
                piaMailConfig <- getPiaEmailConfig(repo)
                piaSchedulerEmail <- getPiaSchedulerEmail(repo)
                piaEmail <- ''
                piaEmailId <- NA
                if (length(piaMailConfig) == 0) {
                        'no mail config'
                } else {
                        if (length(piaSchedulerEmail) > 0) {
                                piaEmail <- piaSchedulerEmail[['email']]
                                piaEmailId <-  piaSchedulerEmail[['id']]
                        }
                        localEmail <- as.character(input$email)
                        if(validEmail(localEmail)) {
                                if (localEmail == piaEmail) {
                                        'email in sync'
                                } else {
                                        if (piaEmail == '') {
                                                writeSchedulerEmail(
                                                        repo,
                                                        localEmail,
                                                        'note data for your condition and medicine intake',
                                                        '0 18 * * *')
                                                'email saved'
                                        } else {
                                                updateSchedulerEmail(
                                                        repo,
                                                        localEmail,
                                                        'note data for your condition and medicine intake',
                                                        '0 18 * * *',
                                                        piaEmailId)
                                                'email updated'
                                        }
                                }
                        } else {
                                if (nchar(localEmail) == 0) {
                                        if (piaEmail == '') {
                                                'missing email'
                                        } else {
                                                setSchedulerEmail(session, piaEmail)
                                                'email loaded'
                                        }
                                } else {
                                        'invalid email'
                                }
                        }
                }
                
        })
        
        output$mail_config <- renderText({
                repo <- allergyRepo()
                retVal <- emailConfigStatus(repo)
                switch(retVal,
                       'config in sync' = 'Benachrichtigungen via Email sind eingerichtet',
                       'not configured' = 'Benachrichtigungen via Email sind noch nicht konfiguiert',
                       'config saved'   = 'Emailkonfiguration in PIA gespeichert',
                       'config updated' = 'Emailkonfiguration in PIA aktualisiert',
                       'config loaded'  = 'Emailkonfiguration aus PIA geladen')
        })
        
        output$email_status <- renderText({
                retVal <- emailReminderStatus()
                paste('<strong>Status:</strong>',
                      switch(retVal,
                             'no mail config' = 'Email-Konfiguration noch nicht vorhanden',
                             'missing email'  = 'fehlende Emailadresse',
                             'invalid email'  = 'ungültige Emailadresse',
                             'email loaded'   = 'Emailadresse aus PIA geladen',
                             'email in sync'  = 'periodische Email-Benachrichtigungen werden versandt',
                             'email saved'    = 'Emailadresse in PIA gespeichert',
                             'email updated'  = 'Emailadresse in PIA aktualisiert'))
        })
        
})
