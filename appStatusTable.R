# layout for table
# last update: 2017-02-19

appStatusTable <- function(){
        tabPanel('Tabelle', br(),
                 selectInput('tableSelect',
                             label = 'Liste',
                             choices = c('keine'),
                             selected = 'keine'),
                 DT::dataTableOutput('tableList'))
}