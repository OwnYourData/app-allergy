# show trend chart
# last update:2016-10-10

trendPlotly <- function(){
        pdf(NULL)
        outputPlot <- plotly_empty()
        pollData <- repoData('eu.ownyourdata.allergy.pollination')
        condData <- repoData('eu.ownyourdata.allergy.condition')
        medData <- repoData('eu.ownyourdata.allergy.medintake')
        if((nrow(pollData) > 0) &
           (nrow(condData) > 0)){
                outputPlot <- plot_ly(x = as.POSIXct(medData$date),
                                      y = as.integer(medData$value)*4,
                                      type = 'bar',
                                      name = 'Medikament') %>%
                        add_lines(x = as.POSIXct(pollData$date),
                                  y = pollData$value,
                                  name = 'Pollenbelastung') %>%
                        add_lines(x = as.POSIXct(condData$date),
                                  y = condData$value,
                                  name = 'Befinden',
                                  yaxis = 'y2') %>%
                        layout( title = '',
                                xaxis = list(
                                        type = 'date'
                                ),
                                yaxis = list(
                                        title = 'Pollenbelastung',
                                        range = c(0,4)
                                ),
                                yaxis2 = list(
                                        overlaying = 'y',
                                        side = 'right',
                                        title = 'Befinden',
                                        range = c(1,10)
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
        