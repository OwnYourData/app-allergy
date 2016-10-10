# global constants available to the app
# last update:2016-10-06

# constants required for every app
appName <- 'allergy'
appTitle <- 'Allergie Tagebuch'
app_id <- 'eu.ownyourdata.allergy'

appFields <- c('text')
appFieldKey <- 'text'
appFieldTypes <- c('string')
appFieldInits <- c('empty')
appFieldTitles <- c('Text')
appFieldWidths <- c(600)

# Version information
currVersion <- "0.4.0"
verHistory <- data.frame(rbind(
        c(version = "0.3.0",
          text    = "erstes Release"),
        c(version = "0.4.0",
          text    = "UI Update (basierend auf OYD Template)")
))

# app specific constants
