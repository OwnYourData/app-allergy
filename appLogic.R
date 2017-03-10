# application specific logic
# last update: 2016-10-07

source('srvDateselect.R', local=TRUE)
source('srvEmail.R', local=TRUE)
source('appEmail.R', local=TRUE)
source('srvScheduler.R', local=TRUE)
source('appLogicChart.R', local=TRUE)
source('appLogicPwd.R', local=TRUE)

# any record manipulations before storing a record
appData <- function(record){
        record
}

getRepoStruct <- function(repo){
        if((repo == 'Befinden') |
           (repo == 'Medikamenteneinnahme') |
           (repo == 'Tagebuch') |
           (repo == 'Verlauf')){
                appStruct[[repo]]
        } else {
                list(
                        fields      = c('timestamp', 'pollType', 'value'),
                        fieldKey    = 'timestamp',
                        fieldTypes  = c('timestamp', 'string', 'integer'),
                        fieldInits  = c('empty', 'empty', 'zero'),
                        fieldTitles = c('Zeit', 'Typ', 'Belastung'),
                        fieldWidths = c(100, 250, 100, 100))
        }
}

repoData <- function(repo){
        data <- data.frame()
        app <- currApp()
        if(length(app) > 0){
                url <- itemsUrl(app[['url']],
                                repo)
                data <- readItems(app, url)
        }
        data
}

appStart <- function(){
        app <- currApp()
        if(length(app) > 0){
                # fill import list
                allItems <- readPlzItems()
                if(nrow(allItems) > 0){
                        updateSelectInput(session, 'plzList',
                                          choices = rownames(allItems))
                        plzList()
                        
                        # repo list in Table tab
                        plz <- allItems$plzCode
                        plzPollList <- c(apply(allItems, 1, function(x){
                                as.character(sort(mapply(
                                        paste0, 
                                        rep(paste0(switch(x['country'],
                                                          'Österreich'='A-',
                                                          'Deutschland'='D-',
                                                          'Schweiz'='CH-',
                                                          { '' } ),
                                                   x['plzCode']),
                                            switch(x['country'],
                                                   'Österreich'={ length(pollenListAT) },
                                                   'Deutschland'={ length(pollenListDE) },
                                                   'Schweiz'={ length(pollenListCH) },
                                                   { 0 } )), 
                                        ': ',
                                        rep(switch(x['country'],
                                                   'Österreich'={ pollenListAT },
                                                   'Deutschland'={ pollenListDE },
                                                   'Schweiz'={ pollenListCH },
                                                   { data.frame() } ), 
                                            length(x['plzCode'])))))
                        }))
                        complete <- c('persönliche Aufzeichnungen', plzPollList)
                        updateSelectInput(session, 'tableSelect',
                                          choices = complete)
                
                        # Pollination selection in chart
                        url <- itemsUrl(app[['url']],
                                        paste0(appKey, '.chart_config'))
                        cfg <- readItems(app, url)
                        if(nrow(cfg) == 1){
                                updateSelectInput(session, 'poll1Select',
                                                  selected = cfg$poll1Select)
                                updateSelectInput(session, 'poll2Select',
                                                  selected = cfg$poll2Select)
                                updateSelectInput(session, 'poll3Select',
                                                  selected = cfg$poll3Select)
                        }
                }
                
                # write script to collect Pollenwarndienst-Data used by scheduler ------
                scriptRepoUrl <- itemsUrl(app[['url']], scriptRepo)
                scriptItems <- readItems(app, scriptRepoUrl)
                schedulerPwdScript <- scriptItems[
                        scriptItems$name == 'Pollenwarndienst', ]
                if(nrow(schedulerPwdScript) > 1){
                        lapply(schedulerPwdScript$id,
                               function(x) deleteItem(app, 
                                                      scriptRepoUrl,
                                                      as.character(x)))
                        schedulerPwdScript <- data.frame()
                }
                scriptData <- list(name           = 'Pollenwarndienst',
                                   script         = pwdScript,
                                   '_oydRepoName' = 'Allergie-Skript')
                if(nrow(schedulerPwdScript) == 0){
                        writeItem(app, scriptRepoUrl, scriptData)
                } else {
                        updateItem(app, scriptRepoUrl, scriptData,
                                   schedulerPwdScript$id)
                }
        }
}

output$trendChart <- renderPlotly({
        trendPlotly()
})

observeEvent(input$saveAllergyInput, {
        app <- currApp()
        if(length(app) > 0){
                myDate <- as.character(input$dateInput)
                
                # Befinden
                url <- itemsUrl(app[['url']],
                                paste0(app[['app_key']], '.condition'))
                data <- list(
                        date = myDate,
                        value = input$conditionInput,
                        '_oydRepoName' = 'Befinden')
                writeItem(app, url, data)
                
                # Medikamenteneinnahme
                url <- itemsUrl(app[['url']],
                                paste0(app[['app_key']], '.medintake'))
                data <- list(
                        date = myDate,
                        value = input$medInput,
                        '_oydRepoName' = 'Medikamenteneinnahme')
                writeItem(app, url, data)
                
                # Notiz
                if(!is.na(input$diaryInput) &
                   (nchar(as.character(input$diaryInput)) > 0))
                {
                        url <- itemsUrl(app[['url']],
                                        paste0(app[['app_key']], '.diary'))
                        data <- list(
                                date = myDate,
                                value = input$diaryInput,
                                '_oydRepoName' = 'Tagebuch')
                        writeItem(app, url, data)
                }
                
                output$allergyInputStatus <- renderUI('Daten wurden erfolgreich gespeichert')
        }
})

output$tableList <- DT::renderDataTable(datatable({
        switch(as.character(input$tableSelect),
               'persönliche Aufzeichnungen'={
                       condData <- dateRangeSelect(
                               repoData('eu.ownyourdata.allergy.condition'), FALSE)
                       diaryData <- dateRangeSelect(
                               repoData('eu.ownyourdata.allergy.diary'), FALSE)
                       medData <- dateRangeSelect(
                               repoData('eu.ownyourdata.allergy.medintake'), FALSE)
                       data <- combineData(combineData(condData, diaryData), medData)
                       if(nrow(data) > 0){
                               data$Medikamenteneinnahme <- 'Nein'
                               data[data$value, 'Medikamenteneinnahme'] <- 'Ja'
                               data <- data[, c('date', 'value.x', 'Medikamenteneinnahme', 'value.y')]
                               colnames(data) <- c('Datum', 'Befinden', 'Medikamenteneinnahme', 'Notiz')
                               data[data$Medikamenteneinnahme, ]
                       }
                       data },
               { pollData <- dateRangeSelect(pollData(input$tableSelect))
                 if(nrow(pollData) > 0){
                         pollData$Datum <- format(as.POSIXct(pollData$timestamp, 
                                                             origin='1970-01-01'), 
                                                  '%Y-%m-%d %k Uhr')
                         pollData <- pollData[, c('Datum', 'value', 'belastungTxt')]
                         colnames(pollData) <- c('Datum', 'Pollenbelastung', 'Beschreibung')
                         pollData
                 } else {
                         data.frame()
                 }})
}, options = list(
        language = list(
                url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/German.json')
        )
))