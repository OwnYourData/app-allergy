# show trend chart
# last update:2016-10-10

dateRangeSelect <- function(data, ts = TRUE){
        if(nrow(data) > 0){
                mymin <- as.Date(input$dateRange[1])
                mymax <- as.Date(input$dateRange[2])
                daterange <- seq(mymin, mymax, 'days')
                if(ts){
                        data[as.Date(as.POSIXct(data$timestamp, origin = '1970-01-01')) 
                             %in% daterange, ]
                } else {
                        data[as.Date(data$date) %in% daterange, ]
                }
        } else {
                data.frame()
        }
}

pollData <- function(pollSelect){
        if(pollSelect == 'keine'){
                data.frame()
        } else {
                plz <- strsplit(pollSelect, ':')[[1]][1]
                typ <- trimws(strsplit(pollSelect, ':')[[1]][2])
                repo <- paste0(app_id, '.pollination', plz)
                data <- repoData(repo)
                data <- data[data$pollType == typ, ]
                if(nrow(data) > 0){
                        data$belastungTxt <- lapply(data$value, function(x){
                                switch(as.character(x), 
                                            '0'='keine Belastung', 
                                            '1'='niedrige Belastung',
                                            '2'='mittlere Belastung',
                                            '3'='hohe Belastung',
                                            '4'='sehr hohe Belastung')})
                        data
                } else {
                        data.frame()
                }
        }
}

writePollSelect <- function(){
        app <- currApp()
        if(length(app) > 0){
                url <- itemsUrl(app[['url']],
                                paste0(appKey, '.chart_config'))
                cfg <- readItems(app, url)
                if(nrow(cfg) > 1){
                        deleteRepo(app, url)
                        cfg <- data.frame()
                }
                data <- list(
                        poll1Select = input$poll1Select,
                        poll2Select = input$poll2Select,
                        poll3Select = input$poll3Select,
                        '_oydRepoName' = 'Konfiguration')
                if(nrow(cfg) == 0){
                        writeItem(app, url, data)
                } else {
                        updateItem(app, url, data, cfg$id)
                }
        }
}

observeEvent(input$poll1Select, writePollSelect())
observeEvent(input$poll2Select, writePollSelect())
observeEvent(input$poll3Select, writePollSelect())

trendPlotly <- function(){
        pdf(NULL)
        poll1Select <- input$poll1Select
        poll1Data <- dateRangeSelect(pollData(poll1Select))
        poll2Select <- input$poll2Select
        poll2Data <- dateRangeSelect(pollData(poll2Select))
        poll3Select <- input$poll3Select
        poll3Data <- dateRangeSelect(pollData(poll3Select))
        condData <- dateRangeSelect(
                repoData('eu.ownyourdata.allergy.condition'), FALSE)
        medData <- dateRangeSelect(
                repoData('eu.ownyourdata.allergy.medintake'), FALSE)
        # medData$medTxt <- ''
        # medData[medData$value, 'medTxt'] <- 'Medikament eingenommen'
        diaryData <- dateRangeSelect(
                repoData('eu.ownyourdata.allergy.diary'), FALSE)

        plotly_output <- FALSE
        outputPlot <- plot_ly()
        if(nrow(medData) > 0){
                plotly_output <- TRUE
                outputPlot <- plot_ly(x = as.POSIXct(medData$date),
                                      y = as.integer(medData$value)*6,
                                      type = 'bar',
                                      name = 'Medikament',
                                      text = 'Medikament eingenommen',
                                      marker = list(color = 'rgb(158,202,225)'))
        }
        if(nrow(poll1Data) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(poll1Data$timestamp,
                                                 origin = '1970-01-01'),
                                  y = as.numeric(poll1Data$value),
                                  yaxis = 'y2',
                                  name = paste0(substr(poll1Select, 1, 12), "\u2026"),
                                  line=list(
                                          width = 2,
                                          color = 'red',
                                          shape = 'spline')) %>%
                        add_markers(x = as.POSIXct(poll1Data$timestamp,
                                                   origin = '1970-01-01'),
                                    y = as.numeric(poll1Data$value),
                                    yaxis = 'y2',
                                    name = '',
                                    marker = list(
                                            color='red',
                                            size = 6),
                                    text = paste0(
                                            poll1Select, ' - ',
                                            poll1Data$belastungTxt),
                                    showlegend = FALSE)
        }
        if(nrow(poll2Data) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(poll2Data$timestamp,
                                                 origin = '1970-01-01'),
                                  y = as.numeric(poll2Data$value),
                                  yaxis = 'y2',
                                  name = paste0(substr(poll2Select, 1, 12), "\u2026"),
                                  line=list(
                                          width = 2,
                                          color = 'orange',
                                          shape = 'spline')) %>%
                        add_markers(x = as.POSIXct(poll2Data$timestamp,
                                                   origin = '1970-01-01'),
                                    y = as.numeric(poll2Data$value),
                                    yaxis = 'y2',
                                    name = '',
                                    marker = list(
                                            color='orange',
                                            size = 6),
                                    text = paste0(
                                            poll2Select, ' - ',
                                            poll2Data$belastungTxt),
                                    showlegend = FALSE)
        }
        if(nrow(poll3Data) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(poll3Data$timestamp,
                                                 origin = '1970-01-01'),
                                  y = as.numeric(poll3Data$value),
                                  yaxis = 'y2',
                                  name = paste0(substr(poll3Select, 1, 12), "\u2026"),
                                  line=list(
                                          width = 2,
                                          color = 'brown',
                                          shape = 'spline')) %>%
                        add_markers(x = as.POSIXct(poll3Data$timestamp,
                                                   origin = '1970-01-01'),
                                    y = as.numeric(poll3Data$value),
                                    yaxis = 'y2',
                                    name = '',
                                    marker = list(
                                            color='brown',
                                            size = 6),
                                    text = paste0(
                                            poll3Select, ' - ',
                                            poll3Data$belastungTxt),
                                    showlegend = FALSE)
        }
        if(nrow(condData) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(paste(as.Date(condData$date), "0:00")),
                                  y = as.numeric(condData$value),
                                  name = 'Befinden',
                                  hoverinfo = 'text',
                                  text = '',
                                  line=list(
                                          width = 3,
                                          color = 'blue',
                                          shape = 'spline'))
        }
        if(nrow(diaryData) > 0){
                plotly_output <- TRUE
                diaryCondData <- merge.data.frame(condData,
                                                  diaryData,
                                                  by='date',
                                                  all = TRUE)
                colnames(diaryCondData) <- c('date', 'id', 'value', 'id2', 'diary')
                diaryCondData$size <- 10
                diaryCondData[is.na(diaryCondData$diary), 'size'] <- 6
                outputPlot <- outputPlot %>%
                        add_markers(x = ~as.POSIXct(paste(as.Date(diaryCondData$date), "0:00")),
                                    y = ~as.numeric(diaryCondData$value),
                                    text = diaryCondData$diary,
                                    marker = list(
                                            color= 'blue',
                                            size = diaryCondData$size),
                                    name = 'Befinden',
                                    showlegend = FALSE)
        }
        
        if(plotly_output){
                outputPlot <- outputPlot %>%
                        layout( title = '',
                                xaxis = list(
                                        title = '',
                                        type = 'date',
                                        tickformat = '%Y-%m-%d'),
                                yaxis = list(
                                        title = '< besser - Befinden - schlechter >',
                                        titlefont = list(
                                                color='blue'),
                                        range = c(0,6.5),
                                        nticks = 1),
                                yaxis2 = list(
                                        overlaying = 'y',
                                        side = 'right',
                                        title = 'Pollenbelastung',
                                        range = c(-0.5, 4.5),
                                        nticks = 6)
                        )
        } else {
                outputPlot <- plotly_empty()
        }
        dev.off()
        outputPlot
}
        