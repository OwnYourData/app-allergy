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
                                plzItems <- plzItems[, c('parameters.replace.PLZ', 'id')]
                                colnames(plzItems) <- c('plzCode', 'id')
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
        # updateSelectInput(
        #         session,
        #         'statusRepoSelect',
        #         choices = colRepos,
        #         selected = colRepos[1])
        appRepos <<- append(appReposDefault,
                            setNames(as.character(allItems$repo),
                                     as.list(rownames(allItems))))
        updateSelectInput(
                session,
                'repoSelect',
                choices = names(appRepos),
                selected = 'Verlauf')
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
        updateTextInput(session, 'plzName',
                        value = selItemName)
        updateTextInput(session, 'plzCode',
                        value = trim(as.character(selItemPlz)))
})

observeEvent(input$addPlzItem, {
        errMsg <- ''
        itemName <- input$plzName
        itemPlz  <- input$plzCode

        allItems <- readPlzItems()
        if(itemName %in% rownames(allItems)){
                errMsg <- 'Name bereits vergeben'
        }
        if(errMsg == ''){
                app <- currApp()
                replace <- list(
                        PLZ = itemPlz,
                        repoName = itemName
                )
                writeSchedulerRscriptReference(app,
                                               itemName,
                                               'Pollenwarndienst',
                                               '6 */4 * * *',
                                               replace)
                initNames <- rownames(allItems)
                updateSelectInput(session, 'plzList',
                                  choices = c(initNames, itemName),
                                  selected = NA)
                updateTextInput(session, 'plzName',
                                value = '')
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
        itemPlz  <- input$plzCode
        if(is.null(selItem)){
                errMsg <- 'Keine Postleitzahl ausgewählt.'
        }
        if(errMsg == ''){
                allItems <- readPlzItems()
                app <- currApp()
                id <- allItems[rownames(allItems) == selItem, 'id']
                replace <- list(
                        PLZ = itemPlz,
                        repoName = itemName
                )
                writeSchedulerRscriptReference(app,
                                               itemName,
                                               'Pollenwarndienst',
                                               '6 */4 * * *',
                                               replace, 
                                               id)
                newRowNames <- rownames(allItems)
                newRowNames[newRowNames == selItem] <- itemName
                updateSelectInput(session, 'plzList',
                                  choices = newRowNames,
                                  selected = NA)
                updateTextInput(session, 'plzName',
                                value = '')
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
