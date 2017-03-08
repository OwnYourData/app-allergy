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
pollenList <- c(
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
diaryEmailText <- '<ul><li>bewerte dein heutiges Befinden auf einer Skala von 1 (sehr gut) bis 6 (sehr schlecht)</li>
<li>hast du heute ein Allergiemedikament eingenommen (Ja / Nein)</li>
<li>optional kannst du auch ein paar Worte zu deinem heutigen Allergie-Tag eingeben</li></ul>
Antworte auf dieses Mail und schreibe in die 1. Zeile dein Befinden (1-6), in die 2. Zeile Medikamenten-Einnahme (J/N, wenn leer dann wird Nein angenommen) und in die 3. Zeile einen Freitext.'

# base64 encoded pwdImport_script.R
pwdScript <- 'bGlicmFyeShSQ3VybCkNCmxpYnJhcnkoWE1MKQ0KbGlicmFyeShodHRyKQ0KcG9sbGVuTGlzdCA8LSBjKCdaeXByZXNzZW5nZXfDpGNoc2UgKEN1cHJlc3NhY2VhZSknLCAnRXJsZSAoQWxudXMpJywgJ0hhc2VsIChDb3J5bHVzKScsICdFc2NoZSAoRnJheGludXMpJywgJ0JpcmtlIChCZXR1bGEpJywgJ1BsYXRhbmUgKFBsYXRhbnVzKScsICdHcsOkc2VyIChQb2FjZWFlKScsICdSb2dnZW4gKFNlY2FsZSknLCAnTmVzc2VsLSB1bmQgR2xhc2tyYXV0IChVcnRpY2FjZWFlKScsICfDlmxiYXVtIChPbGVhKScsICdCZWlmdcOfIChBcnRlbWlzaWEpJywgJ1JhZ3dlZWQgKEFtYnJvc2lhKScsICdQaWx6c3BvcmVuIChBbHRlcm5hcmlhKScpDQpkZWZhdWx0SGVhZGVycyA8LSBmdW5jdGlvbih0b2tlbikgew0KICBjKCdBY2NlcHQnPScqLyonLCAnQ29udGVudC1UeXBlJz0nYXBwbGljYXRpb24vanNvbicsICdBdXRob3JpemF0aW9uJz1wYXN0ZSgnQmVhcmVyJywgdG9rZW4pKQ0KfQ0KaXRlbXNVcmwgPC0gZnVuY3Rpb24odXJsLCByZXBvX25hbWUpIHsNCiAgcGFzdGUwKHVybCwgJy9hcGkvcmVwb3MvJywgcmVwb19uYW1lLCAnL2l0ZW1zJykNCn0NCmdldFRva2VuIDwtIGZ1bmN0aW9uKHBpYV91cmwsIGFwcF9rZXksIGFwcF9zZWNyZXQpIHsNCiAgYXV0aF91cmwgPC0gcGFzdGUwKHBpYV91cmwsICcvb2F1dGgvdG9rZW4nKQ0KICBvcHRUaW1lb3V0IDwtIFJDdXJsOjpjdXJsT3B0aW9ucyhjb25uZWN0dGltZW91dCA9IDEwKQ0KICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6cG9zdEZvcm0oYXV0aF91cmwsIGNsaWVudF9pZCA9IGFwcF9rZXksIGNsaWVudF9zZWNyZXQgPSBhcHBfc2VjcmV0LCBncmFudF90eXBlID0gJ2NsaWVudF9jcmVkZW50aWFscycsIC5vcHRzID0gb3B0VGltZW91dCksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgaWYgKGlzLm5hKHJlc3BvbnNlKSkgew0KICAgIHJldHVybihOQSkNCiAgfSBlbHNlIHsNCiAgICBpZihqc29ubGl0ZTo6dmFsaWRhdGUocmVzcG9uc2VbMV0pKXsNCiAgICAgIHJldHVybihyanNvbjo6ZnJvbUpTT04ocmVzcG9uc2VbMV0pJGFjY2Vzc190b2tlbikNCiAgICB9IGVsc2Ugew0KICAgICAgcmV0dXJuKE5BKQ0KICAgIH0NCiAgfQ0KfQ0Kc2V0dXBBcHAgPC0gZnVuY3Rpb24ocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkgew0KICBhcHBfdG9rZW4gPC0gZ2V0VG9rZW4ocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkNCiAgaWYoaXMubmEoYXBwX3Rva2VuKSl7DQogICAgdmVjdG9yKCkNCiAgfSBlbHNlIHsNCiAgICBjKCd1cmwnID0gcGlhX3VybCwgJ2FwcF9rZXknID0gYXBwX2tleSwgJ2FwcF9zZWNyZXQnID0gYXBwX3NlY3JldCwgJ3Rva2VuJyA9IGFwcF90b2tlbikNCiAgfQ0KfQ0KcjJkIDwtIGZ1bmN0aW9uKHJlc3BvbnNlKXsNCiAgaWYgKGlzLm5hKHJlc3BvbnNlKSkgew0KICAgIGRhdGEuZnJhbWUoKQ0KICB9IGVsc2Ugew0KICAgIGlmIChuY2hhcihyZXNwb25zZSkgPiAwKSB7DQogICAgICByZXRWYWwgPC0gcmpzb246OmZyb21KU09OKHJlc3BvbnNlKQ0KICAgICAgaWYobGVuZ3RoKHJldFZhbCkgPT0gMCkgew0KICAgICAgICBkYXRhLmZyYW1lKCkNCiAgICAgIH0gZWxzZSB7DQogICAgICAgIGlmICgnZXJyb3InICVpbiUgbmFtZXMocmV0VmFsKSkgew0KICAgICAgICAgIGRhdGEuZnJhbWUoKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgIGlmICghaXMubnVsbChyZXRWYWwkbWVzc2FnZSkpIHsNCiAgICAgICAgICAgIGlmIChyZXRWYWwkbWVzc2FnZSA9PSANCiAgICAgICAgICAgICAgICAnZXJyb3IuYWNjZXNzRGVuaWVkJykgew0KICAgICAgICAgICAgICBkYXRhLmZyYW1lKCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgIGRvLmNhbGwocmJpbmQsIGxhcHBseShyZXRWYWwsIGRhdGEuZnJhbWUpKQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBkby5jYWxsKHJiaW5kLCBsYXBwbHkocmV0VmFsLCBkYXRhLmZyYW1lKSkNCiAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgIH0NCiAgICB9IGVsc2Ugew0KICAgICAgZGF0YS5mcmFtZSgpDQogICAgfQ0KICB9DQp9DQpyZWFkSXRlbXMgPC0gZnVuY3Rpb24oYXBwLCByZXBvX3VybCkgew0KICBpZiAobGVuZ3RoKGFwcCkgPT0gMCkgew0KICAgIGRhdGEuZnJhbWUoKQ0KICAgIHJldHVybigpDQogIH0NCiAgaGVhZGVycyA8LSBkZWZhdWx0SGVhZGVycyhhcHBbWyd0b2tlbiddXSkNCiAgdXJsX2RhdGEgPC0gcGFzdGUwKHJlcG9fdXJsLCAnP3NpemU9MjAwMCcpDQogIGhlYWRlciA8LSBSQ3VybDo6YmFzaWNIZWFkZXJHYXRoZXJlcigpDQogIGRvYyA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6Z2V0VVJJKHVybF9kYXRhLCAub3B0cz1saXN0KGh0dHBoZWFkZXIgPSBoZWFkZXJzKSwgaGVhZGVyZnVuY3Rpb24gPSBoZWFkZXIkdXBkYXRlKSwNCiAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKE5BKSB9KQ0KICByZXNwb25zZSA8LSBOQQ0KICByZXNwRGF0YSA8LSBkYXRhLmZyYW1lKCkNCiAgaWYoIWlzLm5hKGRvYykpew0KICAgIHJlY3MgPC0gdHJ5Q2F0Y2goDQogICAgICBhcy5pbnRlZ2VyKGhlYWRlciR2YWx1ZSgpW1snWC1Ub3RhbC1Db3VudCddXSksDQogICAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKDApfSkNCiAgICBpZihyZWNzID4gMjAwMCkgew0KICAgICAgZm9yKHBhZ2UgaW4gMDpmbG9vcihyZWNzLzIwMDApKXsNCiAgICAgICAgdXJsX2RhdGEgPC0gcGFzdGUwKHJlcG9fdXJsLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgJz9wYWdlPScsIHBhZ2UsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAnJnNpemU9MjAwMCcpDQogICAgICAgIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgICAgICAgIFJDdXJsOjpnZXRVUkwodXJsX2RhdGEsDQogICAgICAgICAgICAgICAgICAgICAgICAub3B0cz1saXN0KGh0dHBoZWFkZXI9aGVhZGVycykpLA0KICAgICAgICAgIGVycm9yID0gZnVuY3Rpb24oZSkgeyByZXR1cm4oTkEpIH0pDQogICAgICAgIHN1YkRhdGEgPC0gcjJkKHJlc3BvbnNlKQ0KICAgICAgICBpZihucm93KHJlc3BEYXRhKT4wKXsNCiAgICAgICAgICByZXNwRGF0YSA8LSByYmluZChyZXNwRGF0YSwgc3ViRGF0YSkNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICByZXNwRGF0YSA8LSBzdWJEYXRhDQogICAgICAgIH0NCiAgICAgIH0NCiAgICB9IGVsc2Ugew0KICAgICAgcmVzcG9uc2UgPC0gdHJ5Q2F0Y2goDQogICAgICAgIFJDdXJsOjpnZXRVUkwodXJsX2RhdGEsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMpKSwNCiAgICAgICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgICAgIHJlc3BEYXRhIDwtIHIyZChyZXNwb25zZSkNCiAgICB9DQogIH0NCiAgcmVzcERhdGENCn0NCndyaXRlSXRlbSA8LSBmdW5jdGlvbihhcHAsIHJlcG9fdXJsLCBpdGVtKSB7DQogIGhlYWRlcnMgPC0gZGVmYXVsdEhlYWRlcnMoYXBwW1sndG9rZW4nXV0pDQogIGRhdGEgPC0gcmpzb246OnRvSlNPTihpdGVtKQ0KICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6cG9zdEZvcm0ocmVwb191cmwsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMsIHBvc3RmaWVsZHMgPSBkYXRhKSksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IA0KICAgICAgcmV0dXJuKE5BKSB9KQ0KICByZXNwb25zZQ0KfQ0KdXBkYXRlSXRlbSA8LSBmdW5jdGlvbihhcHAsIHJlcG9fdXJsLCBpdGVtLCBpZCkgew0KICBoZWFkZXJzIDwtIGRlZmF1bHRIZWFkZXJzKGFwcFtbJ3Rva2VuJ11dKQ0KICBpdGVtIDwtIGMoaXRlbSwgYyhpZD1hcy5udW1lcmljKGlkKSkpDQogIGRhdGEgPC0gcmpzb246OnRvSlNPTihpdGVtKQ0KICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6cG9zdEZvcm0ocmVwb191cmwsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMsIHBvc3RmaWVsZHMgPSBkYXRhKSksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgcmVzcG9uc2UNCn0NCmRlbGV0ZUl0ZW0gPC0gZnVuY3Rpb24oYXBwLCByZXBvX3VybCwgaWQpew0KICBoZWFkZXJzIDwtIGRlZmF1bHRIZWFkZXJzKGFwcFtbJ3Rva2VuJ11dKQ0KICBpdGVtX3VybCA8LSBwYXN0ZTAocmVwb191cmwsICcvJywgaWQpDQogIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgIGh0dHI6OkRFTEVURShpdGVtX3VybCwgYWRkX2hlYWRlcnMoaGVhZGVycykpLA0KICAgIGVycm9yID0gZnVuY3Rpb24oZSkgeyANCiAgICAgIHJldHVybihOQSkgfSkNCiAgcmVzcG9uc2UNCn0NCg0KcGx6IDwtICdbcGx6XScNCnJlcG9OYW1lIDwtICdbcmVwb19uYW1lXScNCnBpYV91cmwgPC0gJ1twaWFfdXJsXScNCmFwcF9rZXkgPC0gJ1thcHBfa2V5XScNCmFwcF9zZWNyZXQgPC0gJ1thcHBfc2VjcmV0XScNCmFwcCA8LSBzZXR1cEFwcChwaWFfdXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KQ0KdXJsIDwtIGl0ZW1zVXJsKHBpYV91cmwsIHBhc3RlMCgnZXUub3dueW91cmRhdGEuYWxsZXJneS5wb2xsaW5hdGlvbicsIHBseikpDQphbGxJdGVtcyA8LSByZWFkSXRlbXMoYXBwLCB1cmwpDQpybSA8LSBhbGxJdGVtc1thcy5udW1lcmljKGFsbEl0ZW1zJHRpbWVzdGFtcCkgPiBhcy5udW1lcmljKFN5cy50aW1lKCkpLCBdDQpsYXBwbHkocm0kaWQsIGZ1bmN0aW9uKHgpIGRlbGV0ZUl0ZW0oYXBwLCB1cmwsIHgpKQ0Kd2VicGFnZSA8LSBnZXRVUkwocGFzdGUwKCdodHRwczovL3d3dy5wb2xsZW53YXJuZGllbnN0LmF0L3Byb2dub3NlLzMtdGFnZXMtcHJvZ25vc2UuaHRtbD90eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDBleHRlbnNpb24lNUQ9U2NMb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MHZlbmRvciU1RD1TY3JlZW5jb2RlJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGNvbnRyb2xsZXIlNUQ9TG9hZCZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDBhY3Rpb24lNUQ9c3RhcnRwYWdlc2VhcmNoZm9ybSZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUJhcmd1bWVudHMlNUQ9WVRvd09udDkzMWY5MTI2OGFjOWZhYWFkY2NlNGZhNWJhNzRiNWU4NzU5YmE2ZjQyJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MHJlcXVlc3QlNUQ9YSUzQTQlM0ElN0JzJTNBMTAlM0ElMjIlNDBleHRlbnNpb24lMjIlM0JzJTNBNiUzQSUyMlNjTG9hZCUyMiUzQnMlM0ExMSUzQSUyMiU0MGNvbnRyb2xsZXIlMjIlM0JzJTNBNCUzQSUyMkxvYWQlMjIlM0JzJTNBNyUzQSUyMiU0MGFjdGlvbiUyMiUzQnMlM0ExOSUzQSUyMnN0YXJ0cGFnZXNlYXJjaGZvcm0lMjIlM0JzJTNBNyUzQSUyMiU0MHZlbmRvciUyMiUzQnMlM0ExMCUzQSUyMlNjcmVlbmNvZGUlMjIlM0IlN0RiNTllNDZiZmVhMGM1OTJhMDU1ZTE1YzdkN2RhOWVlMTY4N2EwZTVhJnR4X3NjbG9hZF9sb2FkJTVCX190cnVzdGVkUHJvcGVydGllcyU1RD1hJTNBMiUzQSU3QnMlM0EzJTNBJTIyemlwJTIyJTNCaSUzQTElM0JzJTNBNCUzQSUyMmNpdHklMjIlM0JpJTNBMSUzQiU3RDZiOGZjODNhOGQ5MTRjYjg4NmRlODNhYWQxMjE5YjJmZWU4YmYzNTcmdHhfc2Nsb2FkX2xvYWQlNUJ6aXAlNUQ9JywgcGx6LCAnJnR4X3NjbG9hZF9sb2FkJTVCY2l0eSU1RD0jYnJlYWRjcnVtYicpKQ0Kd2VicGFnZSA8LSByZWFkTGluZXModGMgPC0gdGV4dENvbm5lY3Rpb24od2VicGFnZSkpOyBjbG9zZSh0YykNCnBhZ2V0cmVlIDwtIGh0bWxUcmVlUGFyc2Uod2VicGFnZSwgdXNlSW50ZXJuYWxOb2RlcyA9IFRSVUUpDQpsYXBwbHkocG9sbGVuTGlzdCwgZnVuY3Rpb24oeCl7DQogIHhQYXRoU3RyIDwtIHBhc3RlMCgiLy9oM1tAY2xhc3M9J3BvbGx0aXRsZScgYW5kIGNvbnRhaW5zKHRleHQoKSwnIiwgeCwgIicpXS8uLi8vc3BhbltAY2xhc3M9J2ludmlzaWJsZSddIikNCiAgZm9yKGkgaW4gMTozKXsNCiAgICBiZWxhc3R1bmcgPC0gdHJpbXdzKHhwYXRoU0FwcGx5KHBhZ2V0cmVlLCB4UGF0aFN0ciwgeG1sVmFsdWUpW2ldKQ0KICAgIHJlc3VsdCA8LSBzd2l0Y2goYmVsYXN0dW5nLCAnS2VpbmUgQmVsYXN0dW5nJz0wLCAnbmllZHJpZyc9MSwgJ21pdHRlbCc9MiwgJ2hvY2gnPTMsICdzZWhyIGhvY2gnPTQpDQogICAgaWYocmVzdWx0PjApew0KICAgICAgaWYoaT09MSl7DQogICAgICAgIHJlY29yZCA8LSBsaXN0KHRpbWVzdGFtcD1hcy5udW1lcmljKFN5cy50aW1lKCkpLCBwb2xsVHlwZT14LCB2YWx1ZT1yZXN1bHQsICdfb3lkUmVwb05hbWUnPXJlcG9OYW1lKQ0KICAgICAgfSBlbHNlIHsNCiAgICAgICAgbXlEYXQgPC0geHBhdGhTQXBwbHkocGFnZXRyZWUsIHBhc3RlMCgiLy9oM1tAY2xhc3M9J3BvbGx0aXRsZScgYW5kIGNvbnRhaW5zKHRleHQoKSwnIiwgeCwgIicpXS8uLi8vZGl2W0BjbGFzcz0nZGF0ZSddIiksIHhtbFZhbHVlKVtpXQ0KICAgICAgICBteURhdCA8LSBzdWIoJ0rDpG5uZXInLCAnSmFudWFyeScsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ0ZlYnJ1YXInLCAnRmVicnVhcnknLCBteURhdCkNCiAgICAgICAgbXlEYXQgPC0gc3ViKCdNw6RyeicsICdNYXJjaCcsIG15RGF0KQ0KICAgICAgICBteURhdCA8LSBzdWIoJ01haScsICdNYXknLCBteURhdCkNCiAgICAgICAgbXlEYXQgPC0gc3ViKCdKdW5pJywgJ0p1bmUnLCBteURhdCkNCiAgICAgICAgbXlEYXQgPC0gc3ViKCdKdWxpJywgJ0p1bHknLCBteURhdCkNCiAgICAgICAgbXlEYXQgPC0gc3ViKCdPa3RvYmVyJywgJ09jdG9iZXInLCBteURhdCkNCiAgICAgICAgbXlEYXQgPC0gc3ViKCdEZXplbWJlcicsICdEZWNlbWJlcicsIG15RGF0KQ0KICAgICAgICB0cyA8LSBhcy5QT1NJWGN0KHBhc3RlKGFzLkRhdGUoZ3N1YignLiosICguKiknLCAnXFwxJywgbXlEYXQpLCAnJWQuICVCJyksICIxMjowMCIpKQ0KICAgICAgICByZWNvcmQgPC0gbGlzdCh0aW1lc3RhbXA9YXMubnVtZXJpYyh0cyksIHBvbGxUeXBlPXgsIHZhbHVlPXJlc3VsdCwgJ19veWRSZXBvTmFtZSc9cmVwb05hbWUpDQogICAgICB9DQogICAgICB3cml0ZUl0ZW0oYXBwLCB1cmwsIHJlY29yZCkNCiAgICB9DQogIH0NCn0p'
