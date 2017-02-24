# layout for trend chart
# last update: 2016-10-10

appStatusTrend <- function(){
        tabPanel('Verlauf', br(),
                 fluidRow(
                       column(4, 
                              selectInput('poll1Select',
                                          label = 'Pollen #1',
                                          choices = c('keine'),
                                          selected = 'keine')),
                       column(4, 
                              selectInput('poll2Select',
                                          label = 'Pollen #2',
                                          choices = c('keine'),
                                          selected = 'keine')),
                       column(4, 
                              selectInput('poll3Select',
                                          label = 'Pollen #3',
                                          choices = c('keine'),
                                          selected = 'keine'))),
                 plotlyOutput('trendChart')
        )
}