# data import for Pollenwarndienst
# last update: 2017-02-17

# get stored PLZs
readPlzItems <- function(){
        app <- currApp()
        plzItems <- data.frame()
        if(length(app) > 0){
                retVal <- readSchedulerItemsFunction()
                if(nrow(retVal) > 0){
                        retVal <- retVal[retVal$task == 'Rscript', ]
                        if(nrow(retVal) > 0){
                                plzItems <- retVal
                                rownames(plzItems) <- plzItems$name
                                plzItems <- plzItems[, c('parameters.replace.plz', 
                                                         'parameters.replace.country', 
                                                         'id')]
                                colnames(plzItems) <- c('plzCode', 'country', 'id')
                        }
                }
        }
        plzItems
}

plzList <- function(){
        allItems <- readPlzItems()
        colRepos <- vector()
        if(nrow(allItems) > 0){
                colRepos <- rownames(allItems)
                allItems$repo <- paste0(app_id, '.pollination', allItems$plzCode)
        } else {
                colRepos <- c('keine Datenquellen vorhanden')
        }
        
        plz <- allItems$plzCode
        if(length(plz) > 0){
                plzPollList <- c(apply(allItems, 1, function(x){
                        as.character(sort(mapply(
                                paste0, 
                                rep(x['plzCode'], 
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
                poll1SelectDefault <- plzPollList[1]
                poll2SelectDefault <- plzPollList[2]
                poll3SelectDefault <- plzPollList[3]
                updateSelectInput(
                        session,
                        'poll1Select',
                        choices = c('keine', plzPollList),
                        selected = poll1SelectDefault)
                updateSelectInput(
                        session,
                        'poll2Select',
                        choices = c('keine', plzPollList),
                        selected = poll2SelectDefault)
                updateSelectInput(
                        session,
                        'poll3Select',
                        choices = c('keine', plzPollList),
                        selected = poll3SelectDefault)
        }
        appRepos <<- append(appReposDefault,
                            setNames(as.character(allItems$repo),
                                     as.list(rownames(allItems))))
        updateSelectInput(
                session,
                'repoSelect',
                choices = names(appRepos),
                selected = names(appRepos)[1])
}

# show attributes on selecting an item in the Collector list
observeEvent(input$plzList, {
        selItem <- input$plzList
        if(length(selItem)>1){
                selItem <- selItem[1]
                updateSelectInput(session, 'plzList', selected = selItem)
        }
        allItems <- readPlzItems()
        selItemName <- selItem
        selItemPlz <- allItems[rownames(allItems) == selItem, 'plzCode']
        selItemCountry <- allItems[rownames(allItems) == selItem, 'country']
        updateTextInput(session, 'plzName',
                        value = selItemName)
        updateSelectInput(session, 'country',
                          selected = selItemCountry)
        updateTextInput(session, 'plzCode',
                        value = trim(as.character(selItemPlz)))
})

observeEvent(input$addPlzItem, {
        errMsg <- ''
        itemName <- input$plzName
        itemPlz <- input$plzCode
        itemCountry <- input$country
        
        allItems <- readPlzItems()
        if(itemName %in% rownames(allItems)){
                errMsg <- 'Name bereits vergeben'
        }
        if(errMsg == ''){
                app <- currApp()
                replace <- list(
                        plz = itemPlz,
                        country = itemCountry,
                        repo_name = itemName
                )
                writeSchedulerRscriptReference(app,
                                               itemName,
                                               'Pollenwarndienst',
                                               '2 */12 * * *',
                                               replace)
                initNames <- rownames(allItems)
                updateSelectInput(session, 'plzList',
                                  choices = c(initNames, itemName),
                                  selected = NA)
                updateTextInput(session, 'plzName',
                                value = '')
                updateSelectInput(session, 'country',
                                  selected = ' ')
                updateTextInput(session, 'plzCode',
                                value = '')
        }
        closeAlert(session, 'myPlzItemStatus')
        if(errMsg != ''){
                createAlert(session, 'taskInfo', 
                            'myPlzItemStatus',
                            title = 'Achtung',
                            content = errMsg,
                            style = 'warning',
                            append = 'false')
        }
        plzList()
})

observeEvent(input$updatePlzItem, {
        errMsg   <- ''
        selItem  <- input$plzList
        itemName <- input$plzName
        itemCountry  <- input$country
        itemPlz  <- input$plzCode
        if(is.null(selItem)){
                errMsg <- 'Keine Postleitzahl ausgewählt.'
        }
        if(errMsg == ''){
                allItems <- readPlzItems()
                app <- currApp()
                id <- allItems[rownames(allItems) == selItem, 'id']
                replace <- list(
                        plz = itemPlz,
                        country = itemCountry,
                        repo_name = itemName
                )
                writeSchedulerRscriptReference(app,
                                               itemName,
                                               'Pollenwarndienst',
                                               '2 */12 * * *',
                                               replace, 
                                               id)
                newRowNames <- rownames(allItems)
                newRowNames[newRowNames == selItem] <- itemName
                updateSelectInput(session, 'plzList',
                                  choices = newRowNames,
                                  selected = NA)
                updateTextInput(session, 'plzName',
                                value = '')
                updateSelectInput(session, 'country',
                                  selected = ' ')
                updateTextInput(session, 'plzCode',
                                value = '')
        }
        closeAlert(session, 'myPlzItemStatus')
        if(errMsg != ''){
                createAlert(session, 'taskInfo', 
                            'myPlzItemStatus',
                            title = 'Achtung',
                            content = errMsg,
                            style = 'warning',
                            append = 'false')
        }
        plzList()
})

observeEvent(input$delPlzList, {
        errMsg  <- ''
        selItem <- input$plzList
        if(is.null(selItem)){
                errMsg <- 'Keine Postleitzahl ausgewählt.'
        }
        if(errMsg == ''){
                allItems <- readPlzItems()
                newRowNames <- rownames(allItems)
                app <- currApp()
                url <- itemsUrl(app[['url']],
                                schedulerKey)
                id <- allItems[rownames(allItems) == selItem, 'id']
                deleteItem(app, url, id)
                newRowNames <- newRowNames[newRowNames != selItem]
                allItems <- allItems[rownames(allItems) != selItem, ]
                updateSelectInput(session, 'plzList',
                                  choices = newRowNames,
                                  selected = NA)
                updateTextInput(session, 'plzName',
                                value = '')
                updateSelectInput(session, 'country',
                                  selected = ' ')
                updateTextInput(session, 'plzCode',
                                value = '')
        }
        closeAlert(session, 'myPlzItemStatus')
        if(errMsg != ''){
                createAlert(session, 'taskInfo', 
                            'myPlzItemStatus',
                            title = 'Achtung',
                            content = errMsg,
                            style = 'warning',
                            append = 'false')
        }
        plzList()
})
