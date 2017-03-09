# global constants available to the app
# last update:2016-10-06

# constants required for every app
appName <- 'allergy'
appTitle <- 'Allergie-Tagebuch'
app_id <- 'eu.ownyourdata.allergy'
mobileUrl <- 'https://allergie-mobil.datentresor.org'

# definition of data structure
currRepoSelect <- ''
appRepos <- list()
appReposDefault <- list(
        Befinden             = 'eu.ownyourdata.allergy.condition',
        Medikamenteneinnahme = 'eu.ownyourdata.allergy.medintake',
        Tagebuch             = 'eu.ownyourdata.allergy.diary',
        Verlauf              = 'eu.ownyourdata.allergy.log')
appStruct <- list(
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
                fieldWidths = c(100, 400)),
        Verlauf = list(
                fields      = c('date', 'description'),
                fieldKey    = 'date',
                fieldTypes  = c('date', 'string'),
                fieldInits  = c('empty', 'empty'),
                fieldTitles = c('Datum', 'Text'),
                fieldWidths = c(150, 450))
        )

# Version information
currVersion <- "0.5.0"
verHistory <- data.frame(rbind(
        c(version = "0.5.0",
          text    = "Möglichkeit zur Texteingabe für jeden Tag"),
        c(version = "0.4.1",
          text    = "Verwendung von Listennamen in neuem Datentresor"),
        c(version = "0.4.0",
          text    = "UI Update (basierend auf OYD Template)"),
        c(version = "0.3.0",
          text    = "erstes Release")
))

# app specific constants
plzUiList <- vector()
scriptRepo <- 'eu.ownyourdata.allergy.script'
pollenListAT <- c(
        'Zypressengewächse (Cupressaceae)',
        'Erle (Alnus)',
        'Hasel (Corylus)',
        'Esche (Fraxinus)',
        'Birke (Betula)',
        'Platane (Platanus)',
        'Gräser (Poaceae)',
        'Roggen (Secale)',
        'Nessel- und Glaskraut (Urticaceae)',
        'Ölbaum (Olea)',
        'Beifuß (Artemisia)',
        'Ragweed (Ambrosia)',
        'Pilzsporen (Alternaria)'
)
pollenListDE <- c(
        'Erle (Alnus)',
        'Hasel (Corylus)',
        'Esche (Fraxinus)',
        'Birke (Betula)',
        'Gräser (Poaceae)',
        'Roggen (Secale)',
        'Beifuß (Artemisia)',
        'Ragweed (Ambrosia)')
pollenListCH <- c(
        'Erle (Alnus)',
        'Hasel (Corylus)',
        'Esche (Fraxinus)',
        'Birke (Betula)',
        'Platane (Platanus)',
        'Buche (Fagus)',
        'Oak (Quercus)',
        'Gräser (Poaceae)',
        'Beifuß (Artemisia)',
        'Ragweed (Ambrosia)'
)
diaryEmailText <- '<ul><li>bewerte dein heutiges Befinden auf einer Skala von 1 (sehr gut) bis 6 (sehr schlecht)</li>
<li>hast du heute ein Allergiemedikament eingenommen (Ja / Nein)</li>
<li>optional kannst du auch ein paar Worte zu deinem heutigen Allergie-Tag eingeben</li></ul>
Antworte auf dieses Mail und schreibe in die 1. Zeile dein Befinden (1-6), in die 2. Zeile Medikamenten-Einnahme (J/N, wenn leer dann wird Nein angenommen) und in die 3. Zeile einen Freitext.'

# base64 encoded pwdImport_script.R
pwdScript <- 'bGlicmFyeShSQ3VybCkNCmxpYnJhcnkoWE1MKQ0KbGlicmFyeShodHRyKQ0KcG9sbGVuTGlzdEFUIDwtIGMoJ1p5cHJlc3Nlbmdld8OkY2hzZSAoQ3VwcmVzc2FjZWFlKScsICdFcmxlIChBbG51cyknLCAnSGFzZWwgKENvcnlsdXMpJywgJ0VzY2hlIChGcmF4aW51cyknLCAnQmlya2UgKEJldHVsYSknLCAnUGxhdGFuZSAoUGxhdGFudXMpJywgJ0dyw6RzZXIgKFBvYWNlYWUpJywgJ1JvZ2dlbiAoU2VjYWxlKScsICdOZXNzZWwtIHVuZCBHbGFza3JhdXQgKFVydGljYWNlYWUpJywgJ8OWbGJhdW0gKE9sZWEpJywgJ0JlaWZ1w58gKEFydGVtaXNpYSknLCAnUmFnd2VlZCAoQW1icm9zaWEpJywgJ1BpbHpzcG9yZW4gKEFsdGVybmFyaWEpJykNCnBvbGxlbkxpc3RERSA8LSBjKCdFcmxlIChBbG51cyknLCdIYXNlbCAoQ29yeWx1cyknLCdFc2NoZSAoRnJheGludXMpJywnQmlya2UgKEJldHVsYSknLCdHcsOkc2VyIChQb2FjZWFlKScsJ1JvZ2dlbiAoU2VjYWxlKScsJ0JlaWZ1w58gKEFydGVtaXNpYSknLCdSYWd3ZWVkIChBbWJyb3NpYSknKQ0KcG9sbGVuTGlzdENIIDwtIGMoJ0VybGUgKEFsbnVzKScsJ0hhc2VsIChDb3J5bHVzKScsJ0VzY2hlIChGcmF4aW51cyknLCdCaXJrZSAoQmV0dWxhKScsJ1BsYXRhbmUgKFBsYXRhbnVzKScsJ0J1Y2hlIChGYWd1cyknLCdPYWsgKFF1ZXJjdXMpJywnR3LDpHNlciAoUG9hY2VhZSknLCdCZWlmdcOfIChBcnRlbWlzaWEpJywnUmFnd2VlZCAoQW1icm9zaWEpJykNCmRlZmF1bHRIZWFkZXJzIDwtIGZ1bmN0aW9uKHRva2VuKSB7DQogIGMoJ0FjY2VwdCc9JyovKicsICdDb250ZW50LVR5cGUnPSdhcHBsaWNhdGlvbi9qc29uJywgJ0F1dGhvcml6YXRpb24nPXBhc3RlKCdCZWFyZXInLCB0b2tlbikpDQp9DQppdGVtc1VybCA8LSBmdW5jdGlvbih1cmwsIHJlcG9fbmFtZSkgew0KICBwYXN0ZTAodXJsLCAnL2FwaS9yZXBvcy8nLCByZXBvX25hbWUsICcvaXRlbXMnKQ0KfQ0KZ2V0VG9rZW4gPC0gZnVuY3Rpb24ocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkgew0KICBhdXRoX3VybCA8LSBwYXN0ZTAocGlhX3VybCwgJy9vYXV0aC90b2tlbicpDQogIG9wdFRpbWVvdXQgPC0gUkN1cmw6OmN1cmxPcHRpb25zKGNvbm5lY3R0aW1lb3V0ID0gMTApDQogIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgIFJDdXJsOjpwb3N0Rm9ybShhdXRoX3VybCwgY2xpZW50X2lkID0gYXBwX2tleSwgY2xpZW50X3NlY3JldCA9IGFwcF9zZWNyZXQsIGdyYW50X3R5cGUgPSAnY2xpZW50X2NyZWRlbnRpYWxzJywgLm9wdHMgPSBvcHRUaW1lb3V0KSwNCiAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKE5BKSB9KQ0KICBpZiAoaXMubmEocmVzcG9uc2UpKSB7DQogICAgcmV0dXJuKE5BKQ0KICB9IGVsc2Ugew0KICAgIGlmKGpzb25saXRlOjp2YWxpZGF0ZShyZXNwb25zZVsxXSkpew0KICAgICAgcmV0dXJuKHJqc29uOjpmcm9tSlNPTihyZXNwb25zZVsxXSkkYWNjZXNzX3Rva2VuKQ0KICAgIH0gZWxzZSB7DQogICAgICByZXR1cm4oTkEpDQogICAgfQ0KICB9DQp9DQpzZXR1cEFwcCA8LSBmdW5jdGlvbihwaWFfdXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KSB7DQogIGFwcF90b2tlbiA8LSBnZXRUb2tlbihwaWFfdXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KQ0KICBpZihpcy5uYShhcHBfdG9rZW4pKXsNCiAgICB2ZWN0b3IoKQ0KICB9IGVsc2Ugew0KICAgIGMoJ3VybCcgPSBwaWFfdXJsLCAnYXBwX2tleScgPSBhcHBfa2V5LCAnYXBwX3NlY3JldCcgPSBhcHBfc2VjcmV0LCAndG9rZW4nID0gYXBwX3Rva2VuKQ0KICB9DQp9DQpyMmQgPC0gZnVuY3Rpb24ocmVzcG9uc2Upew0KICBpZiAoaXMubmEocmVzcG9uc2UpKSB7DQogICAgZGF0YS5mcmFtZSgpDQogIH0gZWxzZSB7DQogICAgaWYgKG5jaGFyKHJlc3BvbnNlKSA'
