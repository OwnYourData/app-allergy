# show trend chart
# last update:2016-10-10

trendPlotly <- function(){
        pdf(NULL)
        outputPlot <- plotly_empty()
        poll1Select <- input$poll1Select
        poll1Data <- data.frame()
        if(poll1Select != 'keine'){
                plz1 <- strsplit(poll1Select, ':')[[1]][1]
                typ1 <- trimws(strsplit(poll1Select, ':')[[1]][2])
                repo1 <- paste0(app_id, '.pollination', plz1)
                poll1Data <- repoData(repo1)
                poll1Data <- poll1Data[poll1Data$pollType == typ1, ]
        }
        poll2Select <- input$poll2Select
        poll2Data <- data.frame()
        if(poll2Select != 'keine'){
                plz2 <- strsplit(poll2Select, ':')[[1]][1]
                typ2 <- trimws(strsplit(poll2Select, ':')[[1]][2])
                repo2 <- paste0(app_id, '.pollination', plz2)
                poll2Data <- repoData(repo2)
                poll2Data <- poll1Data[poll2Data$pollType == typ2, ]
        }
        poll3Select <- input$poll3Select
        poll3Data <- data.frame()
        if(poll3Select != 'keine'){
                plz3 <- strsplit(poll3Select, ':')[[1]][1]
                typ3 <- trimws(strsplit(poll3Select, ':')[[1]][2])
                repo3 <- paste0(app_id, '.pollination', plz3)
                poll3Data <- repoData(repo3)
                poll3Data <- poll3Data[poll3Data$pollType == typ3, ]
        }
        condData <- repoData('eu.ownyourdata.allergy.condition')
        medData <- repoData('eu.ownyourdata.allergy.medintake')
        diaryData <- repoData('eu.ownyourdata.allergy.diary')
        plotly_output <- FALSE
        if(nrow(medData) > 0){
                plotly_output <- TRUE
                outputPlot <- plot_ly(x = as.POSIXct(medData$date),
                                      y = as.integer(medData$value)*6,
                                      type = 'bar',
                                      name = 'Medikament')
        }
        if(nrow(poll1Data) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(poll1Data$timestamp,
                                                 origin = '1970-01-01'),
                                  y = as.numeric(poll1Data$value),
                                  yaxis = 'y2',
                                  name = poll1Select,
                                  line=list(
                                          width = 2,
                                          color = 'green',
                                          shape = 'spline'))
        }
        if(nrow(poll2Data) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(poll2Data$timestamp,
                                                 origin = '1970-01-01'),
                                  y = as.numeric(poll2Data$value),
                                  yaxis = 'y2',
                                  name = poll2Select,
                                  line=list(
                                          width = 2,
                                          color = 'orange',
                                          shape = 'spline'))
        }
        if(nrow(poll3Data) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(poll3Data$timestamp,
                                                 origin = '1970-01-01'),
                                  y = as.numeric(poll3Data$value),
                                  yaxis = 'y2',
                                  name = poll3Select,
                                  line=list(
                                          width = 2,
                                          color = 'brown',
                                          shape = 'spline'))
        }
        if(nrow(condData) > 0){
                plotly_output <- TRUE
                outputPlot <- outputPlot %>%
                        add_lines(x = as.POSIXct(paste(as.Date(condData$date), "12:00")),
                                  y = as.numeric(condData$value),
                                  name = 'Befinden',
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
                diaryCondData$size <- 0.11
                diaryCondData$color <- 'orange'
                diaryCondData[is.na(diaryCondData$diary), 'size'] <- 0.1
                diaryCondData[is.na(diaryCondData$diary), 'color'] <- 'blue'
                outputPlot <- outputPlot %>%
                        add_markers(x = ~as.POSIXct(paste(as.Date(diaryCondData$date), "12:00")),
                                    y = ~as.numeric(diaryCondData$value),
                                    hoverinfo = 'text',
                                    text = diaryCondData$diary,
                                    size = diaryCondData$size,
                                    color = diaryCondData$color
                        )
                }
        
        if(plotly_output){
                outputPlot <- outputPlot %>%
                        layout( title = '',
                                xaxis = list(
                                        type = 'date'
                                ),
                                yaxis = list(
                                        title = 'Befinden',
                                        titlefont = list(
                                                color='blue'      
                                        ),
                                        range = c(0.5,6.5),
                                        nticks = 1
                                ),
                                yaxis2 = list(
                                        overlaying = 'y',
                                        side = 'right',
                                        title = 'Pollenbelastung',
                                        range = c(0,4),
                                        nticks = 6
                                ),
                                showlegend = FALSE,
                                margin = list(l = 80, r = 80),
                                barmode = 'group',
                                bargap = 10
                        )
        }
        dev.off()
        outputPlot
}
        