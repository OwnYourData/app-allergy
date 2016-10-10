# global constants available to the app
# last update:2016-10-06

# constants required for every app
appName <- 'allergy'
appTitle <- 'Allergie Tagebuch'
app_id <- 'eu.ownyourdata.allergy'

# definition of data structure
appRepos <- list(Pollenbelastung      = 'eu.ownyourdata.allergy.pollination',
                 Befinden             = 'eu.ownyourdata.allergy.condition',
                 Medikamenteneinnahme = 'eu.ownyourdata.allergy.medintake')
appStruct <- list(
        Pollenbelastung = list(
                fields     = c('date', 'pollType', 'pollPLZ', 'value'),
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
                fields     = c('date', 'value'),
                fieldKey    = 'date',
                fieldTypes  = c('date', 'boolean'),
                fieldInits  = c('empty', 'false'),
                fieldTitles = c('Datum', 'Einnahme'),
                fieldWidths = c(100, 100)))

# Version information
currVersion <- "0.4.0"
verHistory <- data.frame(rbind(
        c(version = "0.3.0",
          text    = "erstes Release"),
        c(version = "0.4.0",
          text    = "UI Update (basierend auf OYD Template)")
))

# app specific constants
pwdUiList <- c('Gräser (Poaceae)', 'Pilzsporen (Alternaria)')