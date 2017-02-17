# layout for configuring pollination sources
# last update: 2017-02-17

appSourcePollenwarndienst <- function(){
        tabPanel('Pollenwarndienst', br(),
                 helpText('Konfiguriere hier jene Postleitzahlen von denen regelmäßig die Pollenbelastung (via pollenwarndienst.at) gespeichert werden soll.', style='display:inline'), 
                 br(),br(),
                 fluidRow(
                         column(4,
                                selectInput('plzList',
                                            'Postleitzahlen:',
                                            plzUiList,
                                            multiple=TRUE, 
                                            selectize=FALSE,
                                            size=12,
                                            selected = 'Gräser (Poaceae)'),
                                actionButton('delPlzList', 'Entfernen', 
                                             icon('trash'))),
                         column(8,
                                textInput('plzName',
                                          'Name:',
                                          value = ''),
                                textInput('plzCode',
                                          'Postleitzahl:',
                                          value = ''),
                                br(),
                                actionButton('addPlzItem', 
                                             'Hinzufügen', icon('plus')),
                                actionButton('updatePlzItem', 
                                             'Aktualisieren', icon('edit'))
                         )
                 )
        )
}
