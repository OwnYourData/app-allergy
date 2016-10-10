# layout for trend chart
# last update: 2016-10-10

appStatusTrend <- function(){
        tabPanel('Verlauf', br(),
                 plotlyOutput('trendChart')
        )
}