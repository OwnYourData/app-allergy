# global constants available to the app
# last update:2016-10-06

# constants required for every app
appName <- 'allergy'
appTitle <- 'Allergie-Tagebuch'
app_id <- 'eu.ownyourdata.allergy'

# definition of data structure
appRepos <- list(Pollenbelastung      = 'eu.ownyourdata.allergy.pollination',
                 Befinden             = 'eu.ownyourdata.allergy.condition',
                 Medikamenteneinnahme = 'eu.ownyourdata.allergy.medintake',
                 Tagebuch             = 'eu.ownyourdata.allergy.diary')
appStruct <- list(
        Pollenbelastung = list(
                fields      = c('date', 'pollType', 'pollPLZ', 'value'),
                fieldKey    = 'date',
                fieldTypes  = c('date', 'string', 'string', 'integer'),
                fieldInits  = c('empty', 'empty', 'empty', 'zero'),
                fieldTitles = c('Datum', 'Typ', 'PLZ', 'Belastung'),
                fieldWidths = c(100, 250, 100, 100)),
        Befinden = list(
                fields     = c('date', 'value'),
                fieldKey    = 'date',
                fieldTypes  = c('date', 'integer'),
                fieldInits  = c('empty', 'empty'),
                fieldTitles = c('Datum', 'Befinden'),
                fieldWidths = c(100, 100)),
        Medikamenteneinnahme = list(
                fields      = c('date', 'value'),
                fieldKey    = 'date',
                fieldTypes  = c('date', 'boolean'),
                fieldInits  = c('empty', 'false'),
                fieldTitles = c('Datum', 'Einnahme'),
                fieldWidths = c(100, 100)),
        Tagebuch =list(
                fields      = c('date', 'value'),
                fieldKey    = 'date',
                fieldTypes  = c('date', 'string'),
                fieldInits  = c('empty', 'empty'),
                fieldTitles = c('Datum', 'Tagebucheintrag'),
                fieldWidths = c(100, 400)
        ))

# Version information
currVersion <- "0.4.1"
verHistory <- data.frame(rbind(
        c(version = "0.4.1",
          text    = "Verwendung von Listennamen in neuem Datentresor"),
        c(version = "0.4.0",
          text    = "UI Update (basierend auf OYD Template)"),
        c(version = "0.3.0",
          text    = "erstes Release")
))

# app specific constants
pwdUiList <- c('Gräser (Poaceae)', 'Pilzsporen (Alternaria)')
diaryEmailText <- '<ul><li>bewerte dein heutiges Befinden auf einer Skala von 1 (sehr gut) bis 6 (sehr schlecht)</li>
<li>hast du heute ein Allergiemedikament eingenommen (Ja / Nein)</li>
<li>optional kannst du auch ein paar Worte zu deinem heutigen Allergie-Tag eingeben</li></ul>
Antworte auf dieses Mail und schreibe in die 1. Zeile dein Befinden (1-6), in die 2. Zeile Medikamenten-Einnahme (J/N, wenn leer dann wird Nein angenommen) und in die 3. Zeile einen Freitext.'
