appSourceEmail <- function(){
        tabPanel('Email Abfragen', br(),
                 fluidRow(
                         column(2,
                                img(src='email.png',width='100px')),
                         column(10,
                                helpText('Wenn du hier deine Emailadresse eingibst, erhältst du jeden Tag eine Email mit Fragen für dein Allergie-Tagebuch.'),
                                textInput('allergyEmail', 'Emailadresse:'),
                                actionButton('saveAllergyEmail', 'Speichern',
                                             icon('save')),
                                actionButton('cancelAllergyEmail', 
                                             'Emailversand beenden',
                                             icon('trash')),
                                br(), br(), uiOutput('allergyEmailStatus')
                         )
                 )
        )                 
}