# global constants available to the app
# last update:2016-10-06

# constants required for every app
appName <- 'allergy'
appTitle <- 'Allergie-Tagebuch'
app_id <- 'eu.ownyourdata.allergy'

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
pwdScript <- 'bGlicmFyeShSQ3VybCkNCmxpYnJhcnkoWE1MKQ0KcG9sbGVuTGlzdCA8LSBjKCdaeXByZXNzZW5nZXfDpGNoc2UgKEN1cHJlc3NhY2VhZSknLCAnRXJsZSAoQWxudXMpJywgJ0hhc2VsIChDb3J5bHVzKScsICdFc2NoZSAoRnJheGludXMpJywgJ0JpcmtlIChCZXR1bGEpJywgJ1BsYXRhbmUgKFBsYXRhbnVzKScsICdHcsOkc2VyIChQb2FjZWFlKScsICdSb2dnZW4gKFNlY2FsZSknLCAnTmVzc2VsLSB1bmQgR2xhc2tyYXV0IChVcnRpY2FjZWFlKScsICfDlmxiYXVtIChPbGVhKScsICdCZWlmdcOfIChBcnRlbWlzaWEpJywgJ1JhZ3dlZWQgKEFtYnJvc2lhKScsICdQaWx6c3BvcmVuIChBbHRlcm5hcmlhKScpDQpkZWZhdWx0SGVhZGVycyA8LSBmdW5jdGlvbih0b2tlbikgew0KICBjKCdBY2NlcHQnPScqLyonLCAnQ29udGVudC1UeXBlJz0nYXBwbGljYXRpb24vanNvbicsICdBdXRob3JpemF0aW9uJz1wYXN0ZSgnQmVhcmVyJywgdG9rZW4pKQ0KfQ0KaXRlbXNVcmwgPC0gZnVuY3Rpb24odXJsLCByZXBvX25hbWUpIHsNCiAgcGFzdGUwKHVybCwgJy9hcGkvcmVwb3MvJywgcmVwb19uYW1lLCAnL2l0ZW1zJykNCn0NCmdldFRva2VuIDwtIGZ1bmN0aW9uKHBpYV91cmwsIGFwcF9rZXksIGFwcF9zZWNyZXQpIHsNCiAgYXV0aF91cmwgPC0gcGFzdGUwKHBpYV91cmwsICcvb2F1dGgvdG9rZW4nKQ0KICBvcHRUaW1lb3V0IDwtIFJDdXJsOjpjdXJsT3B0aW9ucyhjb25uZWN0dGltZW91dCA9IDEwKQ0KICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6cG9zdEZvcm0oYXV0aF91cmwsIGNsaWVudF9pZCA9IGFwcF9rZXksIGNsaWVudF9zZWNyZXQgPSBhcHBfc2VjcmV0LCBncmFudF90eXBlID0gJ2NsaWVudF9jcmVkZW50aWFscycsIC5vcHRzID0gb3B0VGltZW91dCksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgaWYgKGlzLm5hKHJlc3BvbnNlKSkgew0KICAgIHJldHVybihOQSkNCiAgfSBlbHNlIHsNCiAgICBpZihqc29ubGl0ZTo6dmFsaWRhdGUocmVzcG9uc2VbMV0pKXsNCiAgICAgIHJldHVybihyanNvbjo6ZnJvbUpTT04ocmVzcG9uc2VbMV0pJGFjY2Vzc190b2tlbikNCiAgICB9IGVsc2Ugew0KICAgICAgcmV0dXJuKE5BKQ0KICAgIH0NCiAgfQ0KfQ0Kc2V0dXBBcHAgPC0gZnVuY3Rpb24ocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkgew0KICBhcHBfdG9rZW4gPC0gZ2V0VG9rZW4ocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkNCiAgaWYoaXMubmEoYXBwX3Rva2VuKSl7DQogICAgdmVjdG9yKCkNCiAgfSBlbHNlIHsNCiAgICBjKCd1cmwnID0gcGlhX3VybCwgJ2FwcF9rZXknID0gYXBwX2tleSwgJ2FwcF9zZWNyZXQnID0gYXBwX3NlY3JldCwgJ3Rva2VuJyA9IGFwcF90b2tlbikNCiAgfQ0KfQ0KcjJkIDwtIGZ1bmN0aW9uKHJlc3BvbnNlKXsNCiAgaWYgKGlzLm5hKHJlc3BvbnNlKSkgew0KICAgIGRhdGEuZnJhbWUoKQ0KICB9IGVsc2Ugew0KICAgIGlmIChuY2hhcihyZXNwb25zZSkgPiAwKSB7DQogICAgICByZXRWYWwgPC0gcmpzb246OmZyb21KU09OKHJlc3BvbnNlKQ0KICAgICAgaWYobGVuZ3RoKHJldFZhbCkgPT0gMCkgew0KICAgICAgICBkYXRhLmZyYW1lKCkNCiAgICAgIH0gZWxzZSB7DQogICAgICAgIGlmICgnZXJyb3InICVpbiUgbmFtZXMocmV0VmFsKSkgew0KICAgICAgICAgIGRhdGEuZnJhbWUoKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgIGlmICghaXMubnVsbChyZXRWYWwkbWVzc2FnZSkpIHsNCiAgICAgICAgICAgIGlmIChyZXRWYWwkbWVzc2FnZSA9PSANCiAgICAgICAgICAgICAgICAnZXJyb3IuYWNjZXNzRGVuaWVkJykgew0KICAgICAgICAgICAgICBkYXRhLmZyYW1lKCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgIGRvLmNhbGwocmJpbmQsIGxhcHBseShyZXRWYWwsIGRhdGEuZnJhbWUpKQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBkby5jYWxsKHJiaW5kLCBsYXBwbHkocmV0VmFsLCBkYXRhLmZyYW1lKSkNCiAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgIH0NCiAgICB9IGVsc2Ugew0KICAgICAgZGF0YS5mcmFtZSgpDQogICAgfQ0KICB9DQp9DQpyZWFkSXRlbXMgPC0gZnVuY3Rpb24oYXBwLCByZXBvX3VybCkgew0KICBpZiAobGVuZ3RoKGFwcCkgPT0gMCkgew0KICAgIGRhdGEuZnJhbWUoKQ0KICAgIHJldHVybigpDQogIH0NCiAgaGVhZGVycyA8LSBkZWZhdWx0SGVhZGVycyhhcHBbWyd0b2tlbiddXSkNCiAgdXJsX2RhdGEgPC0gcGFzdGUwKHJlcG9fdXJsLCAnP3NpemU9MjAwMCcpDQogIGhlYWRlciA8LSBSQ3VybDo6YmFzaWNIZWFkZXJHYXRoZXJlcigpDQogIGRvYyA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6Z2V0VVJJKHVybF9kYXRhLCAub3B0cz1saXN0KGh0dHBoZWFkZXIgPSBoZWFkZXJzKSwgaGVhZGVyZnVuY3Rpb24gPSBoZWFkZXIkdXBkYXRlKSwNCiAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKE5BKSB9KQ0KICByZXNwb25zZSA8LSBOQQ0KICByZXNwRGF0YSA8LSBkYXRhLmZyYW1lKCkNCiAgaWYoIWlzLm5hKGRvYykpew0KICAgIHJlY3MgPC0gdHJ5Q2F0Y2goDQogICAgICBhcy5pbnRlZ2VyKGhlYWRlciR2YWx1ZSgpW1snWC1Ub3RhbC1Db3VudCddXSksDQogICAgICBlcnJvciA9IGZ1bmN0aW9uKGUpIHsgcmV0dXJuKDApfSkNCiAgICBpZihyZWNzID4gMjAwMCkgew0KICAgICAgZm9yKHBhZ2UgaW4gMDpmbG9vcihyZWNzLzIwMDApKXsNCiAgICAgICAgdXJsX2RhdGEgPC0gcGFzdGUwKHJlcG9fdXJsLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgJz9wYWdlPScsIHBhZ2UsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAnJnNpemU9MjAwMCcpDQogICAgICAgIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgICAgICAgIFJDdXJsOjpnZXRVUkwodXJsX2RhdGEsDQogICAgICAgICAgICAgICAgICAgICAgICAub3B0cz1saXN0KGh0dHBoZWFkZXI9aGVhZGVycykpLA0KICAgICAgICAgIGVycm9yID0gZnVuY3Rpb24oZSkgeyByZXR1cm4oTkEpIH0pDQogICAgICAgIHN1YkRhdGEgPC0gcjJkKHJlc3BvbnNlKQ0KICAgICAgICBpZihucm93KHJlc3BEYXRhKT4wKXsNCiAgICAgICAgICByZXNwRGF0YSA8LSByYmluZChyZXNwRGF0YSwgc3ViRGF0YSkNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICByZXNwRGF0YSA8LSBzdWJEYXRhDQogICAgICAgIH0NCiAgICAgIH0NCiAgICB9IGVsc2Ugew0KICAgICAgcmVzcG9uc2UgPC0gdHJ5Q2F0Y2goDQogICAgICAgIFJDdXJsOjpnZXRVUkwodXJsX2RhdGEsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMpKSwNCiAgICAgICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgICAgIHJlc3BEYXRhIDwtIHIyZChyZXNwb25zZSkNCiAgICB9DQogIH0NCiAgcmVzcERhdGENCn0NCndyaXRlSXRlbSA8LSBmdW5jdGlvbihhcHAsIHJlcG9fdXJsLCBpdGVtKSB7DQogIGhlYWRlcnMgPC0gZGVmYXVsdEhlYWRlcnMoYXBwW1sndG9rZW4nXV0pDQogIGRhdGEgPC0gcmpzb246OnRvSlNPTihpdGVtKQ0KICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6cG9zdEZvcm0ocmVwb191cmwsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMsIHBvc3RmaWVsZHMgPSBkYXRhKSksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IA0KICAgICAgcmV0dXJuKE5BKSB9KQ0KICByZXNwb25zZQ0KfQ0KdXBkYXRlSXRlbSA8LSBmdW5jdGlvbihhcHAsIHJlcG9fdXJsLCBpdGVtLCBpZCkgew0KICBoZWFkZXJzIDwtIGRlZmF1bHRIZWFkZXJzKGFwcFtbJ3Rva2VuJ11dKQ0KICBpdGVtIDwtIGMoaXRlbSwgYyhpZD1hcy5udW1lcmljKGlkKSkpDQogIGRhdGEgPC0gcmpzb246OnRvSlNPTihpdGVtKQ0KICByZXNwb25zZSA8LSB0cnlDYXRjaCgNCiAgICBSQ3VybDo6cG9zdEZvcm0ocmVwb191cmwsIC5vcHRzPWxpc3QoaHR0cGhlYWRlciA9IGhlYWRlcnMsIHBvc3RmaWVsZHMgPSBkYXRhKSksDQogICAgZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCiAgcmVzcG9uc2UNCn0NCmRlbGV0ZUl0ZW0gPC0gZnVuY3Rpb24oYXBwLCByZXBvX3VybCwgaWQpew0KICBoZWFkZXJzIDwtIGRlZmF1bHRIZWFkZXJzKGFwcFtbJ3Rva2VuJ11dKQ0KICBpdGVtX3VybCA8LSBwYXN0ZTAocmVwb191cmwsICcvJywgaWQpDQogIHJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KICAgIGh0dHI6OkRFTEVURShpdGVtX3VybCwgYWRkX2hlYWRlcnMoaGVhZGVycykpLA0KICAgIGVycm9yID0gZnVuY3Rpb24oZSkgeyByZXR1cm4oTkEpIH0pDQogIHJlc3BvbnNlDQp9DQoNCnBseiA8LSAnW3Bsel0nDQpyZXBvTmFtZSA8LSAnW3JlcG9fbmFtZV0nDQpwaWFfdXJsIDwtICdbcGlhX3VybF0nDQphcHBfa2V5IDwtICdbYXBwX2tleV0nDQphcHBfc2VjcmV0IDwtICdbYXBwX3NlY3JldF0nDQphcHAgPC0gc2V0dXBBcHAocGlhX3VybCwgYXBwX2tleSwgYXBwX3NlY3JldCkNCnVybCA8LSBpdGVtc1VybChwaWFfdXJsLCBwYXN0ZTAoJ2V1Lm93bnlvdXJkYXRhLmFsbGVyZ3kucG9sbGluYXRpb24nLCBwbHopKQ0KDQp3ZWJwYWdlIDwtIGdldFVSTChwYXN0ZTAoJ2h0dHBzOi8vd3d3LnBvbGxlbndhcm5kaWVuc3QuYXQvcHJvZ25vc2UvMy10YWdlcy1wcm9nbm9zZS5odG1sP3R4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGV4dGVuc2lvbiU1RD1TY0xvYWQmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwdmVuZG9yJTVEPVNjcmVlbmNvZGUmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwY29udHJvbGxlciU1RD1Mb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGFjdGlvbiU1RD1zdGFydHBhZ2VzZWFyY2hmb3JtJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QmFyZ3VtZW50cyU1RD1ZVG93T250OTMxZjkxMjY4YWM5ZmFhYWRjY2U0ZmE1YmE3NGI1ZTg3NTliYTZmNDImdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwcmVxdWVzdCU1RD1hJTNBNCUzQSU3QnMlM0ExMCUzQSUyMiU0MGV4dGVuc2lvbiUyMiUzQnMlM0E2JTNBJTIyU2NMb2FkJTIyJTNCcyUzQTExJTNBJTIyJTQwY29udHJvbGxlciUyMiUzQnMlM0E0JTNBJTIyTG9hZCUyMiUzQnMlM0E3JTNBJTIyJTQwYWN0aW9uJTIyJTNCcyUzQTE5JTNBJTIyc3RhcnRwYWdlc2VhcmNoZm9ybSUyMiUzQnMlM0E3JTNBJTIyJTQwdmVuZG9yJTIyJTNCcyUzQTEwJTNBJTIyU2NyZWVuY29kZSUyMiUzQiU3RGI1OWU0NmJmZWEwYzU5MmEwNTVlMTVjN2Q3ZGE5ZWUxNjg3YTBlNWEmdHhfc2Nsb2FkX2xvYWQlNUJfX3RydXN0ZWRQcm9wZXJ0aWVzJTVEPWElM0EyJTNBJTdCcyUzQTMlM0ElMjJ6aXAlMjIlM0JpJTNBMSUzQnMlM0E0JTNBJTIyY2l0eSUyMiUzQmklM0ExJTNCJTdENmI4ZmM4M2E4ZDkxNGNiODg2ZGU4M2FhZDEyMTliMmZlZThiZjM1NyZ0eF9zY2xvYWRfbG9hZCU1QnppcCU1RD0nLCBwbHosICcmdHhfc2Nsb2FkX2xvYWQlNUJjaXR5JTVEPSNicmVhZGNydW1iJykpDQp3ZWJwYWdlIDwtIHJlYWRMaW5lcyh0YyA8LSB0ZXh0Q29ubmVjdGlvbih3ZWJwYWdlKSk7IGNsb3NlKHRjKQ0KcGFnZXRyZWUgPC0gaHRtbFRyZWVQYXJzZSh3ZWJwYWdlLCB1c2VJbnRlcm5hbE5vZGVzID0gVFJVRSkNCmxhcHBseShwb2xsZW5MaXN0LCBmdW5jdGlvbih4KXsNCiAgeFBhdGhTdHIgPC0gcGFzdGUwKCIvL2gzW0BjbGFzcz0ncG9sbHRpdGxlJyBhbmQgY29udGFpbnModGV4dCgpLCciLCB4LCAiJyldLy4uLy9zcGFuW0BjbGFzcz0naW52aXNpYmxlJ10iKQ0KICBiZWxhc3R1bmcgPC0gdHJpbXdzKHhwYXRoU0FwcGx5KHBhZ2V0cmVlLCB4UGF0aFN0ciwgeG1sVmFsdWUpWzFdKQ0KICByZXN1bHQgPC0gc3dpdGNoKGJlbGFzdHVuZywgJ0tlaW5lIEJlbGFzdHVuZyc9MCwgJ25pZWRyaWcnPTEsICdtaXR0ZWwnPTIsICdob2NoJz0zLCAnc2VociBob2NoJz00KQ0KICBpZihyZXN1bHQ+MCl7DQogICAgcmVjb3JkIDwtIGxpc3QodGltZXN0YW1wID0gYXMubnVtZXJpYyhTeXMudGltZSgpKSwgcG9sbFR5cGUgPSB4LCB2YWx1ZSA9IHJlc3VsdCkNCiAgICB3cml0ZUl0ZW0oYXBwLCB1cmwsIHJlY29yZCkNCiAgfQ0KfSk='
