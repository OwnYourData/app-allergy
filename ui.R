# Setup and config ========================================
library(shiny)
library(shinyBS) #https://ebailey78.github.io/shinyBS/index.html
library(jsonlite)

source("oyd_helpers.R")

saved <- getPiaConnection('allergy')
saved_url        <- saved[['url']]
saved_app_key    <- saved[['app_key']]
saved_app_secret <- saved[['app_secret']]

# Shiny UI ================================================
shinyUI(fluidPage(
        titlePanel('Allergie-Tagebuch'),
        bsAlert('topAlert'),
        sidebarLayout(
                sidebarPanel(
                        tabsetPanel(type='tabs', selected='Allergie-Verlauf',
# Allergy specific ========================================
                                    tabPanel('Allergie-Verlauf',
                                             h3('Anzeige'),
                                             dateRangeInput('dateRange',
                                                            language = 'de',
                                                            separator = ' bis ',
                                                            format = 'dd.mm.yyyy',
                                                            label = 'Zeitfenster',
                                                            start = Sys.Date() - 30, end = Sys.Date()),
                                             hr(),
                                             h3('Daten eingeben'),
                                             dateInput('manDate',
                                                       language = 'de',
                                                       format = 'dd.mm.yyyy',
                                                       label = 'Datum'),
                                             div(style='display:inline-block', checkboxInput('usePollination', label = NULL, value = FALSE)),
                                             div(style='display:inline-block', h4('Pollenbelastung')),
                                             div(style='display:inline-block', span('speichern')),
                                             selectInput('manAllergy', label = NULL, 
                                                         choices = list('Allergie auswählen...',
                                                                        'Erle (Alnus)', 
                                                                        'Hasel (Corylus)',
                                                                        'Zypressengewächse (Cupressaceae)',
                                                                        'Esche (Fraxinus)',
                                                                        'Buche (Fagus)',
                                                                        'Eiche (Quercus)',
                                                                        'Weide (Salix)',
                                                                        'Ulme (Ulmus)',
                                                                        'Birke (Betula)',
                                                                        'Platane (Platanus)',
                                                                        'Ölbaum (Olea)',
                                                                        'Gräser (Poaceae)',
                                                                        'Roggen (Secale)',
                                                                        'Nessel- und Glaskraut (Urticaceae)',
                                                                        'Pilzsporen (Alternaria)',
                                                                        'Beifuß (Artemisia)',
                                                                        'Ragweed (Ambrosia)'),
                                                         selected = 'auswählen...'),
                                             sliderInput('manPollination', NULL, value=0, min=0, max=4),
                                             helpText('Skala: 0 (keine) bis 4 (hohe Belastung)'),
                                             div(style='display:inline-block', checkboxInput('useCondition', label = NULL, value = TRUE)),
                                             div(style='display:inline-block', h4('Befinden')),
                                             div(style='display:inline-block', span('speichern')),
                                             sliderInput('manCondition', NULL, value=5, min=1, max=10),
                                             helpText('Skala: 1 (sehr gut) bis 10 (sehr schlecht)'),
                                             div(style='display:inline-block', checkboxInput('useMedintake', label = NULL, value = TRUE)),
                                             div(style='display:inline-block', h4('Medikament')),
                                             div(style='display:inline-block', span('speichern')),
                                             selectInput('manMedintake', label = 'Medikament eingenommen', 
                                                         choices = list('Ja' = 1, 
                                                                        'Nein' = 0), 
                                                         selected = FALSE),
                                             actionButton('exportButton', 'Speichern'),
                                             htmlOutput('last_saved')
                                    ),

# PIA =====================================================
                                    tabPanel('PIA', 
                                             h3('Authentifizierung'),
                                             textInput('allergy_url', 'Adresse:', saved_url),
                                             textInput('allergy_app_key', 'ID (Allergien):', saved_app_key),
                                             textInput('allergy_app_secret', 'Secret (Allergien):', saved_app_secret),
                                             checkboxInput('localAllergySave', label = 'Zugriffsinformationen lokal speichern', value = FALSE),
                                             hr(),
                                             htmlOutput('allergy_token'),
                                             htmlOutput('allergy_records')
                                    ),

# Pollination data collection =============================
                                    tabPanel('Datensammlung', 
                                             h3('Pollenbelastung'),
                                             helpText('tägliche Datensammlung von', a('Pollenwarndienst.at', href='http://www.pollenwarndienst.at')),
                                             selectInput('allergy', label = h4('Allergie'), 
                                                         choices = list('auswählen...',
                                                                        'Erle (Alnus)', 
                                                                        'Hasel (Corylus)',
                                                                        'Zypressengewächse (Cupressaceae)',
                                                                        'Esche (Fraxinus)',
                                                                        'Buche (Fagus)',
                                                                        'Eiche (Quercus)',
                                                                        'Weide (Salix)',
                                                                        'Ulme (Ulmus)',
                                                                        'Birke (Betula)',
                                                                        'Platane (Platanus)',
                                                                        'Ölbaum (Olea)',
                                                                        'Gräser (Poaceae)',
                                                                        'Roggen (Secale)',
                                                                        'Nessel- und Glaskraut (Urticaceae)',
                                                                        'Pilzsporen (Alternaria)',
                                                                        'Beifuß (Artemisia)',
                                                                        'Ragweed (Ambrosia)'),
                                                         selected = 'auswählen...'),
                                                textInput('plz', 'PLZ:')
                                        ),

# Scheduler ===============================================
                                        tabPanel('Benachrichtigung', 
                                                h3('Benachrichtigung'),
                                                textInput('email', 'Emailadresse:'),
                                                htmlOutput('email_status'),
                                                helpText('Wenn sie hier ihre Emailadresse eingeben, erhalten sie jeden Abend eine Email mit der Abfrage nach ihrem Befinden und ob sie Medikamente eingenommen haben.'),
                                                hr(),
                                                h3('Email Konfiguration'),
                                                htmlOutput('mail_config'),
                                                textInput('mailer_address', 'Mail Server:'),
                                                numericInput('mailer_port', 'Port:', 0),
                                                textInput('mailer_user', 'Benutzer:'),
                                                passwordInput('mailer_password', 'Passwort')
                                        )
                         )
                ),

# Main Panel ==============================================
                mainPanel(
                        bsAlert('noData'),
                        bsAlert('noPIA'),
                        plotOutput(outputId = 'plot', height = '300px')
                )
        )
))
