# layout for section "Status"
# last update: 2016-10-10

source('uiStatusDateSelect.R')
source('appStatusTrend.R')

appStatus <- function(){
        fluidRow(
                column(12, 
                       uiStatusDateSelect(),
                       bsAlert('dataStatus'),
                       tabsetPanel(type='tabs',
                                   appStatusTrend()
                       )
                )
        )
}

# constants for configurable Tabs
# defaultStatTabsName <- c('Plot')
# 
# defaultStatTabsUI <- c(
#         "
#         tabPanel('Plot',
#                  plotOutput(outputId = ns('bank2Plot'), height = '300px')
#         )
#         "
# )
# 
# defaultStatTabsLogic <- c(
#         "
#         output$bank2Plot <- renderPlot({
#                 data <- currData()
#                 plot(x=data$date, y=data$value, type='l', 
#                         xlab='Datum', ylab='Euro')
#         
#         })
#         "
# )
