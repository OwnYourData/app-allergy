appSourceEmail <- function(){
        tabPanel('Email Abfragen', br(),
                 fluidRow(
                         column(2,
                                img(src='email.png',width='100px')),
                         column(10,
                                helpText('Wenn du hier deine Emailadresse eingibst, erhältst du jeden Abend eine Email mit der Frage nach deinem Befinden an diesen Tag.'),
                                textInput('email', 'Emailadresse:')
                         )
                 )
        )                 
}