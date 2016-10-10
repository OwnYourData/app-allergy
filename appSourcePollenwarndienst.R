# layout for configuring pollination sources
# last update: 2016-10-06

appSourcePollenwarndienst <- function(){
        tabPanel('Pollenwarndienst', br(),
                 fluidRow(
                         column(4,
                                selectInput('pwdList',
                                            'Pollen Typ:',
                                            pwdUiList,
                                            multiple=TRUE, 
                                            selectize=FALSE,
                                            size=12,
                                            selected = 'Gräser (Poaceae)'),
                                actionButton('delpwdList', 'Entfernen', 
                                             icon('trash'))),
                         column(8,
                                textInput('pwdItemName',
                                          'Name:',
                                          value = 'Gräser (Poaceae)'),
                                textInput('pwdPlzItem',
                                          'Postleitzahl:',
                                          value = '2540'),
                                br(),
                                actionButton('addPwdItem', 
                                             'Hinzufügen', icon('plus')),
                                actionButton('updatePwdItem', 
                                             'Aktualisieren', icon('edit'))
                         )
                 )
        )
}
