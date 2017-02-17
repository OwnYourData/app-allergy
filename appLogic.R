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
        allItems <- readPlzItems()
        updateSelectInput(session, 'plzList',
                          choices = rownames(allItems))
        plzList()
        
        # write script to collect Pollenwarndienst-Data used by scheduler ------
        app <- currApp()
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

output$trendChart <- renderPlotly({
        trendPlotly()
})
