# global constants available to the app
# last update:2016-10-06

# constants required for every app
appName <- 'allergy'
appTitle <- 'Allergie-Tagebuch'
app_id <- 'eu.ownyourdata.allergy'
helpUrl <- 'https://www.ownyourdata.eu/apps/allergy'
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
currVersion <- "0.5.1"
verHistory <- data.frame(rbind(
        c(version = "0.5.1",
          text    = "Deutschland und Schweiz als Datenquelle hinzugefügt"),
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
pwdScript <- 'bGlicmFyeShSQ3VybCkNCmxpYnJhcnkoWE1MKQ0KbGlicmFyeShodHRyKQ0KcG9sbGVuTGlzdEFUIDwtIGMoJ1p5cHJlc3Nlbmdld8OkY2hzZSAoQ3VwcmVzc2FjZWFlKScsICdFcmxlIChBbG51cyknLCAnSGFzZWwgKENvcnlsdXMpJywgJ0VzY2hlIChGcmF4aW51cyknLCAnQmlya2UgKEJldHVsYSknLCAnUGxhdGFuZSAoUGxhdGFudXMpJywgJ0dyw6RzZXIgKFBvYWNlYWUpJywgJ1JvZ2dlbiAoU2VjYWxlKScsICdOZXNzZWwtIHVuZCBHbGFza3JhdXQgKFVydGljYWNlYWUpJywgJ8OWbGJhdW0gKE9sZWEpJywgJ0JlaWZ1w58gKEFydGVtaXNpYSknLCAnUmFnd2VlZCAoQW1icm9zaWEpJywgJ1BpbHpzcG9yZW4gKEFsdGVybmFyaWEpJykNCnBvbGxlbkxpc3RERSA8LSBjKCdFcmxlIChBbG51cyknLCdIYXNlbCAoQ29yeWx1cyknLCdFc2NoZSAoRnJheGludXMpJywnQmlya2UgKEJldHVsYSknLCdHcsOkc2VyIChQb2FjZWFlKScsJ1JvZ2dlbiAoU2VjYWxlKScsJ0JlaWZ1w58gKEFydGVtaXNpYSknLCdSYWd3ZWVkIChBbWJyb3NpYSknKQ0KcG9sbGVuTGlzdENIIDwtIGMoJ0VybGUgKEFsbnVzKScsJ0hhc2VsIChDb3J5bHVzKScsJ0VzY2hlIChGcmF4aW51cyknLCdCaXJrZSAoQmV0dWxhKScsJ1BsYXRhbmUgKFBsYXRhbnVzKScsJ0J1Y2hlIChGYWd1cyknLCdPYWsgKFF1ZXJjdXMpJywnR3LDpHNlciAoUG9hY2VhZSknLCdCZWlmdcOfIChBcnRlbWlzaWEpJywnUmFnd2VlZCAoQW1icm9zaWEpJykNCmRlZmF1bHRIZWFkZXJzIDwtIGZ1bmN0aW9uKHRva2VuKSB7DQogIGMoJ0FjY2VwdCc9JyovKicsICdDb250ZW50LVR5cGUnPSdhcHBsaWNhdGlvbi9qc29uJywgJ0F1dGhvcml6YXRpb24nPXBhc3RlKCdCZWFyZXInLCB0b2tlbikpDQp9DQppdGVtc1VybCA8LSBmdW5jdGlvbih1cmwsIHJlcG9fbmFtZSkgew0KICBwYXN0ZTAodXJsLCAnL2FwaS9yZXBvcy8nLCByZXBvX25hbWUsICcvaXRlbXMnKQ0KfQ0KZ2V0VG9rZW4gPC0gZnVuY3Rpb24ocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkgew0KICBhdXRoX3VybCA8LSBwYXN0ZTAocGlhX3VybCwgJy9vYXV0aC90b2tlbicpDQogIG9wdFRpbWVvdXQgPC0gUkN1cmw6OmN1cmxPcHRpb25zKGNvbm5lY3R0aW1lb3V0ID0gMTApDQogIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgIFJDdXJsOjpwb3N0Rm9ybShhdXRoX3VybCwgY2xpZW50X2lkID0gYXBwX2tleSwgY2xpZW50X3NlY3JldCA9IGFwcF9zZWNyZXQsIGdyYW50X3R5cGUgPSAnY2xpZW50X2NyZWRlbnRpYWxzJywgLm9wdHMgPSBvcHRUaW1lb3V0KSwNCiAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKE5BKSB9KQ0KICBpZiAoaXMubmEocmVzcG9uc2UpKSB7DQogICAgcmV0dXJuKE5BKQ0KICB9IGVsc2Ugew0KICAgIGlmKGpzb25saXRlOjp2YWxpZGF0ZShyZXNwb25zZVsxXSkpew0KICAgICAgcmV0dXJuKHJqc29uOjpmcm9tSlNPTihyZXNwb25zZVsxXSkkYWNjZXNzX3Rva2VuKQ0KICAgIH0gZWxzZSB7DQogICAgICByZXR1cm4oTkEpDQogICAgfQ0KICB9DQp9DQpzZXR1cEFwcCA8LSBmdW5jdGlvbihwaWFfdXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KSB7DQogIGFwcF90b2tlbiA8LSBnZXRUb2tlbihwaWFfdXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KQ0KICBpZihpcy5uYShhcHBfdG9rZW4pKXsNCiAgICB2ZWN0b3IoKQ0KICB9IGVsc2Ugew0KICAgIGMoJ3VybCcgPSBwaWFfdXJsLCAnYXBwX2tleScgPSBhcHBfa2V5LCAnYXBwX3NlY3JldCcgPSBhcHBfc2VjcmV0LCAndG9rZW4nID0gYXBwX3Rva2VuKQ0KICB9DQp9DQpyMmQgPC0gZnVuY3Rpb24ocmVzcG9uc2Upew0KICBpZiAoaXMubmEocmVzcG9uc2UpKSB7DQogICAgZGF0YS5mcmFtZSgpDQogIH0gZWxzZSB7DQogICAgaWYgKG5jaGFyKHJlc3BvbnNlKSA+IDApIHsNCiAgICAgIHJldFZhbCA8LSByanNvbjo6ZnJvbUpTT04ocmVzcG9uc2UpDQogICAgICBpZihsZW5ndGgocmV0VmFsKSA9PSAwKSB7DQogICAgICAgIGRhdGEuZnJhbWUoKQ0KICAgICAgfSBlbHNlIHsNCiAgICAgICAgaWYgKCdlcnJvcicgJWluJSBuYW1lcyhyZXRWYWwpKSB7DQogICAgICAgICAgZGF0YS5mcmFtZSgpDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgaWYgKCFpcy5udWxsKHJldFZhbCRtZXNzYWdlKSkgew0KICAgICAgICAgICAgaWYgKHJldFZhbCRtZXNzYWdlID09IA0KICAgICAgICAgICAgICAgICdlcnJvci5hY2Nlc3NEZW5pZWQnKSB7DQogICAgICAgICAgICAgIGRhdGEuZnJhbWUoKQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgZG8uY2FsbChyYmluZCwgbGFwcGx5KHJldFZhbCwgZGF0YS5mcmFtZSkpDQogICAgICAgICAgICB9DQogICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGRvLmNhbGwocmJpbmQsIGxhcHBseShyZXRWYWwsIGRhdGEuZnJhbWUpKQ0KICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgfQ0KICAgIH0gZWxzZSB7DQogICAgICBkYXRhLmZyYW1lKCkNCiAgICB9DQogIH0NCn0NCnJlYWRJdGVtcyA8LSBmdW5jdGlvbihhcHAsIHJlcG9fdXJsKSB7DQogIGlmIChsZW5ndGgoYXBwKSA9PSAwKSB7DQogICAgZGF0YS5mcmFtZSgpDQogICAgcmV0dXJuKCkNCiAgfQ0KICBoZWFkZXJzIDwtIGRlZmF1bHRIZWFkZXJzKGFwcFtbJ3Rva2VuJ11dKQ0KICB1cmxfZGF0YSA8LSBwYXN0ZTAocmVwb191cmwsICc/c2l6ZT0yMDAwJykNCiAgaGVhZGVyIDwtIFJDdXJsOjpiYXNpY0hlYWRlckdhdGhlcmVyKCkNCiAgZG9jIDwtIHRyeUNhdGNoKA0KICAgIFJDdXJsOjpnZXRVUkkodXJsX2RhdGEsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMpLCBoZWFkZXJmdW5jdGlvbiA9IGhlYWRlciR1cGRhdGUpLA0KICAgIGVycm9yID0gZnVuY3Rpb24oZSkgeyByZXR1cm4oTkEpIH0pDQogIHJlc3BvbnNlIDwtIE5BDQogIHJlc3BEYXRhIDwtIGRhdGEuZnJhbWUoKQ0KICBpZighaXMubmEoZG9jKSl7DQogICAgcmVjcyA8LSB0cnlDYXRjaCgNCiAgICAgIGFzLmludGVnZXIoaGVhZGVyJHZhbHVlKClbWydYLVRvdGFsLUNvdW50J11dKSwNCiAgICAgIGVycm9yID0gZnVuY3Rpb24oZSkgeyByZXR1cm4oMCl9KQ0KICAgIGlmKHJlY3MgPiAyMDAwKSB7DQogICAgICBmb3IocGFnZSBpbiAwOmZsb29yKHJlY3MvMjAwMCkpew0KICAgICAgICB1cmxfZGF0YSA8LSBwYXN0ZTAocmVwb191cmwsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAnP3BhZ2U9JywgcGFnZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICcmc2l6ZT0yMDAwJykNCiAgICAgICAgcmVzcG9uc2UgPC0gdHJ5Q2F0Y2goDQogICAgICAgICAgUkN1cmw6OmdldFVSTCh1cmxfZGF0YSwNCiAgICAgICAgICAgICAgICAgICAgICAgIC5vcHRzPWxpc3QoaHR0cGhlYWRlcj1oZWFkZXJzKSksDQogICAgICAgICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgICAgICAgc3ViRGF0YSA8LSByMmQocmVzcG9uc2UpDQogICAgICAgIGlmKG5yb3cocmVzcERhdGEpPjApew0KICAgICAgICAgIHJlc3BEYXRhIDwtIHJiaW5kKHJlc3BEYXRhLCBzdWJEYXRhKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgIHJlc3BEYXRhIDwtIHN1YkRhdGENCiAgICAgICAgfQ0KICAgICAgfQ0KICAgIH0gZWxzZSB7DQogICAgICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICAgICAgUkN1cmw6OmdldFVSTCh1cmxfZGF0YSwgLm9wdHM9bGlzdChodHRwaGVhZGVyID0gaGVhZGVycykpLA0KICAgICAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKE5BKSB9KQ0KICAgICAgcmVzcERhdGEgPC0gcjJkKHJlc3BvbnNlKQ0KICAgIH0NCiAgfQ0KICByZXNwRGF0YQ0KfQ0Kd3JpdGVJdGVtIDwtIGZ1bmN0aW9uKGFwcCwgcmVwb191cmwsIGl0ZW0pIHsNCiAgaGVhZGVycyA8LSBkZWZhdWx0SGVhZGVycyhhcHBbWyd0b2tlbiddXSkNCiAgZGF0YSA8LSByanNvbjo6dG9KU09OKGl0ZW0pDQogIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgIFJDdXJsOjpwb3N0Rm9ybShyZXBvX3VybCwgLm9wdHM9bGlzdChodHRwaGVhZGVyID0gaGVhZGVycywgcG9zdGZpZWxkcyA9IGRhdGEpKSwNCiAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgDQogICAgICByZXR1cm4oTkEpIH0pDQogIHJlc3BvbnNlDQp9DQp1cGRhdGVJdGVtIDwtIGZ1bmN0aW9uKGFwcCwgcmVwb191cmwsIGl0ZW0sIGlkKSB7DQogIGhlYWRlcnMgPC0gZGVmYXVsdEhlYWRlcnMoYXBwW1sndG9rZW4nXV0pDQogIGl0ZW0gPC0gYyhpdGVtLCBjKGlkPWFzLm51bWVyaWMoaWQpKSkNCiAgZGF0YSA8LSByanNvbjo6dG9KU09OKGl0ZW0pDQogIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgIFJDdXJsOjpwb3N0Rm9ybShyZXBvX3VybCwgLm9wdHM9bGlzdChodHRwaGVhZGVyID0gaGVhZGVycywgcG9zdGZpZWxkcyA9IGRhdGEpKSwNCiAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKE5BKSB9KQ0KICByZXNwb25zZQ0KfQ0KZGVsZXRlSXRlbSA8LSBmdW5jdGlvbihhcHAsIHJlcG9fdXJsLCBpZCl7DQogIGhlYWRlcnMgPC0gZGVmYXVsdEhlYWRlcnMoYXBwW1sndG9rZW4nXV0pDQogIGl0ZW1fdXJsIDwtIHBhc3RlMChyZXBvX3VybCwgJy8nLCBpZCkNCiAgcmVzcG9uc2UgPC0gdHJ5Q2F0Y2goDQogICAgaHR0cjo6REVMRVRFKGl0ZW1fdXJsLCBhZGRfaGVhZGVycyhoZWFkZXJzKSksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IA0KICAgICAgcmV0dXJuKE5BKSB9KQ0KICByZXNwb25zZQ0KfQ0KDQpwbHogPC0gJ1twbHpdJw0KY291bnRyeSA8LSAnW2NvdW50cnldJw0KcmVwb05hbWUgPC0gJ1tyZXBvX25hbWVdJw0KcGlhX3VybCA8LSAnW3BpYV91cmxdJw0KYXBwX2tleSA8LSAnW2FwcF9rZXldJw0KYXBwX3NlY3JldCA8LSAnW2FwcF9zZWNyZXRdJw0KYXBwIDwtIHNldHVwQXBwKHBpYV91cmwsIGFwcF9rZXksIGFwcF9zZWNyZXQpDQp1cmwgPC0gaXRlbXNVcmwocGlhX3VybCwgcGFzdGUwKCdldS5vd255b3VyZGF0YS5hbGxlcmd5LnBvbGxpbmF0aW9uXycsIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudHJ5LCAnLScsIHBseikpDQphbGxJdGVtcyA8LSByZWFkSXRlbXMoYXBwLCB1cmwpDQpybSA8LSBhbGxJdGVtc1thcy5udW1lcmljKGFsbEl0ZW1zJHRpbWVzdGFtcCkgPiBhcy5udW1lcmljKFN5cy50aW1lKCkpLCBdDQpsYXBwbHkocm0kaWQsIGZ1bmN0aW9uKHgpIGRlbGV0ZUl0ZW0oYXBwLCB1cmwsIHgpKQ0KaWYoY291bnRyeSA9PSAnw5ZzdGVycmVpY2gnKXsgd2VicGFnZSA8LSBnZXRVUkwocGFzdGUwKCdodHRwczovL3d3dy5wb2xsZW5pbmZvLm9yZy9BVC9kZS9wcm9nbm9zZS8zLXRhZ2VzLXByb2dub3NlLmh0bWw/dHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwZXh0ZW5zaW9uJTVEPVNjTG9hZCZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDB2ZW5kb3IlNUQ9U2NyZWVuY29kZSZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDBjb250cm9sbGVyJTVEPUxvYWQmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwYWN0aW9uJTVEPXN0YXJ0cGFnZXNlYXJjaGZvcm0mdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCYXJndW1lbnRzJTVEPVlUb3dPbnQ5MzFmOTEyNjhhYzlmYWFhZGNjZTRmYTViYTc0YjVlODc1OWJhNmY0MiZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDByZXF1ZXN0JTVEPWElM0E0JTNBJTdCcyUzQTEwJTNBJTIyJTQwZXh0ZW5zaW9uJTIyJTNCcyUzQTYlM0ElMjJTY0xvYWQlMjIlM0JzJTNBMTElM0ElMjIlNDBjb250cm9sbGVyJTIyJTNCcyUzQTQlM0ElMjJMb2FkJTIyJTNCcyUzQTclM0ElMjIlNDBhY3Rpb24lMjIlM0JzJTNBMTklM0ElMjJzdGFydHBhZ2VzZWFyY2hmb3JtJTIyJTNCcyUzQTclM0ElMjIlNDB2ZW5kb3IlMjIlM0JzJTNBMTAlM0ElMjJTY3JlZW5jb2RlJTIyJTNCJTdEYjU5ZTQ2YmZlYTBjNTkyYTA1NWUxNWM3ZDdkYTllZTE2ODdhMGU1YSZ0eF9zY2xvYWRfbG9hZCU1Ql9fdHJ1c3RlZFByb3BlcnRpZXMlNUQ9YSUzQTIlM0ElN0JzJTNBMyUzQSUyMnppcCUyMiUzQmklM0ExJTNCcyUzQTQlM0ElMjJjaXR5JTIyJTNCaSUzQTElM0IlN0Q2YjhmYzgzYThkOTE0Y2I4ODZkZTgzYWFkMTIxOWIyZmVlOGJmMzU3JnR4X3NjbG9hZF9sb2FkJTVCemlwJTVEPScsIHBseiwgJyZ0eF9zY2xvYWRfbG9hZCU1QmNpdHklNUQ9I2JyZWFkY3J1bWInKSkgfQ0KaWYoY291bnRyeSA9PSAnRGV1dHNjaGxhbmQnKXsgd2VicGFnZSA8LSBnZXRVUkwocGFzdGUwKCdodHRwczovL3d3dy5wb2xsZW5pbmZvLm9yZy9ERS9kZS9wcm9nbm9zZS8zLXRhZ2VzLXByb2dub3NlLmh0bWw/dHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwZXh0ZW5zaW9uJTVEPVNjTG9hZCZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDB2ZW5kb3IlNUQ9U2NyZWVuY29kZSZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDBjb250cm9sbGVyJTVEPUxvYWQmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwYWN0aW9uJTVEPXN0YXJ0cGFnZXNlYXJjaGZvcm0mdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCYXJndW1lbnRzJTVEPVlUb3dPbnQ5MzFmOTEyNjhhYzlmYWFhZGNjZTRmYTViYTc0YjVlODc1OWJhNmY0MiZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDByZXF1ZXN0JTVEPWElM0E0JTNBJTdCcyUzQTEwJTNBJTIyJTQwZXh0ZW5zaW9uJTIyJTNCcyUzQTYlM0ElMjJTY0xvYWQlMjIlM0JzJTNBMTElM0ElMjIlNDBjb250cm9sbGVyJTIyJTNCcyUzQTQlM0ElMjJMb2FkJTIyJTNCcyUzQTclM0ElMjIlNDBhY3Rpb24lMjIlM0JzJTNBMTklM0ElMjJzdGFydHBhZ2VzZWFyY2hmb3JtJTIyJTNCcyUzQTclM0ElMjIlNDB2ZW5kb3IlMjIlM0JzJTNBMTAlM0ElMjJTY3JlZW5jb2RlJTIyJTNCJTdEYjU5ZTQ2YmZlYTBjNTkyYTA1NWUxNWM3ZDdkYTllZTE2ODdhMGU1YSZ0eF9zY2xvYWRfbG9hZCU1Ql9fdHJ1c3RlZFByb3BlcnRpZXMlNUQ9YSUzQTIlM0ElN0JzJTNBMyUzQSUyMnppcCUyMiUzQmklM0ExJTNCcyUzQTQlM0ElMjJjaXR5JTIyJTNCaSUzQTElM0IlN0Q2YjhmYzgzYThkOTE0Y2I4ODZkZTgzYWFkMTIxOWIyZmVlOGJmMzU3JnR4X3NjbG9hZF9sb2FkJTVCemlwJTVEPScsIHBseiwgJyZ0eF9zY2xvYWRfbG9hZCU1QmNpdHklNUQ9I2JyZWFkY3J1bWInKSkgfQ0KaWYoY291bnRyeSA9PSAnU2Nod2VpeicpeyB3ZWJwYWdlIDwtIGdldFVSTChwYXN0ZTAoJ2h0dHBzOi8vd3d3LnBvbGxlbmluZm8ub3JnL0NIL2VuL3Byb2dub3Npcy9wb2xsZW4tbG9hZC5odG1sP3R4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGV4dGVuc2lvbiU1RD1TY0xvYWQmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwdmVuZG9yJTVEPVNjcmVlbmNvZGUmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwY29udHJvbGxlciU1RD1Mb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGFjdGlvbiU1RD1sb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QmFyZ3VtZW50cyU1RD1ZVG95T250ek9qTTZJbnBwY0NJN2N6bzBPaUk0T0RRNUlqdHpPalE2SW1OcGRIa2lPM002TURvaUlqdDkwY2I5N2Y2MTg4ODFjZTUyNjY3ZTRlZDI5YjJiNDliYmMyNzk0ZWUxJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MHJlcXVlc3QlNUQ9YSUzQTQlM0ElN0JzJTNBMTAlM0ElMjIlNDBleHRlbnNpb24lMjIlM0JzJTNBNiUzQSUyMlNjTG9hZCUyMiUzQnMlM0ExMSUzQSUyMiU0MGNvbnRyb2xsZXIlMjIlM0JzJTNBNCUzQSUyMkxvYWQlMjIlM0JzJTNBNyUzQSUyMiU0MGFjdGlvbiUyMiUzQnMlM0E0JTNBJTIybG9hZCUyMiUzQnMlM0E3JTNBJTIyJTQwdmVuZG9yJTIyJTNCcyUzQTEwJTNBJTIyU2NyZWVuY29kZSUyMiUzQiU3RDRmMmMxNWJhMzYxNTcwN2RkMGE0YmVmMTUxZjFmZDhmMTRjMzY5MjEmdHhfc2Nsb2FkX2xvYWQlNUJfX3RydXN0ZWRQcm9wZXJ0aWVzJTVEPWElM0EyJTNBJTdCcyUzQTMlM0ElMjJ6aXAlMjIlM0JpJTNBMSUzQnMlM0E0JTNBJTIyY2l0eSUyMiUzQmklM0ExJTNCJTdENmI4ZmM4M2E4ZDkxNGNiODg2ZGU4M2FhZDEyMTliMmZlZThiZjM1NyZ0eF9zY2xvYWRfbG9hZCU1QnppcCU1RCcsIHBseiwgJyZ0eF9zY2xvYWRfbG9hZCU1QmNpdHklNUQ9I2JyZWFkY3J1bWInKSl9DQp3ZWJwYWdlIDwtIHJlYWRMaW5lcyh0YyA8LSB0ZXh0Q29ubmVjdGlvbih3ZWJwYWdlKSk7IGNsb3NlKHRjKQ0KcGFnZXRyZWUgPC0gaHRtbFRyZWVQYXJzZSh3ZWJwYWdlLCB1c2VJbnRlcm5hbE5vZGVzID0gVFJVRSkNCnBvbGxlbkxpc3QgPC0gc3dpdGNoKGNvdW50cnksICfDlnN0ZXJyZWljaCcgPSBwb2xsZW5MaXN0QVQsICdEZXV0c2NobGFuZCcgPSBwb2xsZW5MaXN0REUsICdTY2h3ZWl6JyA9IHBvbGxlbkxpc3RDSCkNCmxhcHBseShwb2xsZW5MaXN0LCBmdW5jdGlvbih4KXsNCiAgeFBhdGhTdHIgPC0gcGFzdGUwKCIvL2gzW0BjbGFzcz0ncG9sbHRpdGxlJyBhbmQgY29udGFpbnModGV4dCgpLCciLCB4LCAiJyldLy4uLy9zcGFuW0BjbGFzcz0naW52aXNpYmxlJ10iKQ0KICBmb3IoaSBpbiAxOjMpew0KICAgIGJlbGFzdHVuZyA8LSB0cmltd3MoeHBhdGhTQXBwbHkocGFnZXRyZWUsIHhQYXRoU3RyLCB4bWxWYWx1ZSlbaV0pDQogICAgcmVzdWx0IDwtIHN3aXRjaChiZWxhc3R1bmcsICdLZWluZSBCZWxhc3R1bmcnPTAsICduaWVkcmlnJz0xLCAnbWl0dGVsJz0yLCAnaG9jaCc9MywgJ3NlaHIgaG9jaCc9NCkNCiAgICBpZihyZXN1bHQ+MCl7DQogICAgICBpZihpPT0xKXsNCiAgICAgICAgcmVjb3JkIDwtIGxpc3QodGltZXN0YW1wPWFzLm51bWVyaWMoU3lzLnRpbWUoKSksIHBvbGxUeXBlPXgsIHZhbHVlPXJlc3VsdCwgJ19veWRSZXBvTmFtZSc9cmVwb05hbWUpDQogICAgICB9IGVsc2Ugew0KICAgICAgICBteURhdCA8LSB4cGF0aFNBcHBseShwYWdldHJlZSwgcGFzdGUwKCIvL2gzW0BjbGFzcz0ncG9sbHRpdGxlJyBhbmQgY29udGFpbnModGV4dCgpLCciLCB4LCAiJyldLy4uLy9kaXZbQGNsYXNzPSdkYXRlJ10iKSwgeG1sVmFsdWUpW2ldDQogICAgICAgIG15RGF0IDwtIHN1YignSsOkbm5lcicsICdKYW51YXJ5JywgbXlEYXQpDQogICAgICAgIG15RGF0IDwtIHN1YignRmVicnVhcicsICdGZWJydWFyeScsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ03DpHJ6JywgJ01hcmNoJywgbXlEYXQpDQogICAgICAgIG15RGF0IDwtIHN1YignTWFpJywgJ01heScsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ0p1bmknLCAnSnVuZScsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ0p1bGknLCAnSnVseScsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ09rdG9iZXInLCAnT2N0b2JlcicsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ0RlemVtYmVyJywgJ0RlY2VtYmVyJywgbXlEYXQpDQogICAgICAgIHRzIDwtIGFzLlBPU0lYY3QocGFzdGUoYXMuRGF0ZShnc3ViKCcuKiwgKC4qKScsICdcXDEnLCBteURhdCksICclZC4gJUInKSwgIjEyOjAwIikpDQogICAgICAgIHJlY29yZCA8LSBsaXN0KHRpbWVzdGFtcD1hcy5udW1lcmljKHRzKSwgcG9sbFR5cGU9eCwgdmFsdWU9cmVzdWx0LCAnX295ZFJlcG9OYW1lJz1yZXBvTmFtZSkNCiAgICAgIH0NCiAgICAgIHdyaXRlSXRlbShhcHAsIHVybCwgcmVjb3JkKQ0KICAgIH0NCiAgfQ0KfSk='
