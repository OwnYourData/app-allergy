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
        'Pilzsporen (Alternaria)')
pollenListDE <- c(
        'Erle (Alnus)',
        'Hasel (Corylus)',
        'Esche (Fraxinus)',
        'Birke (Betula)',
        'Gräser (Poaceae)',
        'Roggen (Secale)',
        'Beifuß (Artemisia)',
        'Ragweed (Ambrosia)')
pollenListCH<-c(
        'alder (Alnus)',
        'hazel (Corylus)',
        'ash (Fraxinus)',
        'birch (Betula)',
        'Plane tree (Platanus)',
        'Beech (Fagus)',
        'Oak (Quercus)',
        'grasses (Poaceae)',
        'mugwort (Artemisia)',
        'ragweed (Ambrosia)')
diaryEmailText <- '<ul><li>bewerte dein heutiges Befinden auf einer Skala von 1 (sehr gut) bis 6 (sehr schlecht)</li>
<li>hast du heute ein Allergiemedikament eingenommen (Ja / Nein)</li>
<li>optional kannst du auch ein paar Worte zu deinem heutigen Allergie-Tag eingeben</li></ul>
Antworte auf dieses Mail und schreibe in die 1. Zeile dein Befinden (1-6), in die 2. Zeile Medikamenten-Einnahme (J/N, wenn leer dann wird Nein angenommen) und in die 3. Zeile einen Freitext.'

# base64 encoded pwdImport_script.R
pwdScript <- 'bGlicmFyeShSQ3VybCkNCmxpYnJhcnkoWE1MKQ0KbGlicmFyeShodHRyKQ0KcG9sbGVuTGlzdEFUPC1jKCdaeXByZXNzZW5nZXfDpGNoc2UgKEN1cHJlc3NhY2VhZSknLCdFcmxlIChBbG51cyknLCdIYXNlbCAoQ29yeWx1cyknLCdFc2NoZSAoRnJheGludXMpJywnQmlya2UgKEJldHVsYSknLCdQbGF0YW5lIChQbGF0YW51cyknLCdHcsOkc2VyIChQb2FjZWFlKScsJ1JvZ2dlbiAoU2VjYWxlKScsJ05lc3NlbC0gdW5kIEdsYXNrcmF1dCAoVXJ0aWNhY2VhZSknLCfDlmxiYXVtIChPbGVhKScsJ0JlaWZ1w58gKEFydGVtaXNpYSknLCdSYWd3ZWVkIChBbWJyb3NpYSknLCdQaWx6c3BvcmVuIChBbHRlcm5hcmlhKScpDQpwb2xsZW5MaXN0REU8LWMoJ0VybGUgKEFsbnVzKScsJ0hhc2VsIChDb3J5bHVzKScsJ0VzY2hlIChGcmF4aW51cyknLCdCaXJrZSAoQmV0dWxhKScsJ0dyw6RzZXIgKFBvYWNlYWUpJywnUm9nZ2VuIChTZWNhbGUpJywnQmVpZnXDnyAoQXJ0ZW1pc2lhKScsJ1JhZ3dlZWQgKEFtYnJvc2lhKScpDQpwb2xsZW5MaXN0Q0g8LWMoJ2FsZGVyIChBbG51cyknLCdoYXplbCAoQ29yeWx1cyknLCdhc2ggKEZyYXhpbnVzKScsJ2JpcmNoIChCZXR1bGEpJywnUGxhbmUgdHJlZSAoUGxhdGFudXMpJywnQmVlY2ggKEZhZ3VzKScsJ09hayAoUXVlcmN1cyknLCdncmFzc2VzIChQb2FjZWFlKScsJ211Z3dvcnQgKEFydGVtaXNpYSknLCdyYWd3ZWVkIChBbWJyb3NpYSknKQ0KZGVmYXVsdEhlYWRlcnM8LWZ1bmN0aW9uKHRva2VuKXsNCmMoJ0FjY2VwdCc9JyovKicsJ0NvbnRlbnQtVHlwZSc9J2FwcGxpY2F0aW9uL2pzb24nLCdBdXRob3JpemF0aW9uJz1wYXN0ZSgnQmVhcmVyJyx0b2tlbikpfQ0KaXRlbXNVcmw8LWZ1bmN0aW9uKHVybCxyZXBvX25hbWUpew0KcGFzdGUwKHVybCwnL2FwaS9yZXBvcy8nLHJlcG9fbmFtZSwnL2l0ZW1zJyl9DQpnZXRUb2tlbjwtZnVuY3Rpb24ocGlhX3VybCxhcHBfa2V5LGFwcF9zZWNyZXQpew0KYXV0aF91cmw8LXBhc3RlMChwaWFfdXJsLCcvb2F1dGgvdG9rZW4nKQ0Kb3B0VGltZW91dDwtUkN1cmw6OmN1cmxPcHRpb25zKGNvbm5lY3R0aW1lb3V0PTEwKQ0KcmVzcG9uc2U8LXRyeUNhdGNoKA0KUkN1cmw6OnBvc3RGb3JtKGF1dGhfdXJsLGNsaWVudF9pZD1hcHBfa2V5LGNsaWVudF9zZWNyZXQ9YXBwX3NlY3JldCxncmFudF90eXBlPSdjbGllbnRfY3JlZGVudGlhbHMnLC5vcHRzPW9wdFRpbWVvdXQpLA0KZXJyb3I9ZnVuY3Rpb24oZSl7cmV0dXJuKE5BKX0pDQppZihpcy5uYShyZXNwb25zZSkpew0KcmV0dXJuKE5BKQ0KfWVsc2V7DQppZihqc29ubGl0ZTo6dmFsaWRhdGUocmVzcG9uc2VbMV0pKXsNCnJldHVybihyanNvbjo6ZnJvbUpTT04ocmVzcG9uc2VbMV0pJGFjY2Vzc190b2tlbikNCn1lbHNlew0KcmV0dXJuKE5BKX19fQ0Kc2V0dXBBcHA8LWZ1bmN0aW9uKHBpYV91cmwsYXBwX2tleSxhcHBfc2VjcmV0KXsNCmFwcF90b2tlbjwtZ2V0VG9rZW4ocGlhX3VybCxhcHBfa2V5LGFwcF9zZWNyZXQpDQppZihpcy5uYShhcHBfdG9rZW4pKXsNCnZlY3RvcigpDQp9ZWxzZXsNCmMoJ3VybCc9cGlhX3VybCwnYXBwX2tleSc9YXBwX2tleSwnYXBwX3NlY3JldCc9YXBwX3NlY3JldCwndG9rZW4nPWFwcF90b2tlbil9fQ0KcjJkPC1mdW5jdGlvbihyZXNwb25zZSl7DQppZihpcy5uYShyZXNwb25zZSkpew0KZGF0YS5mcmFtZSgpDQp9ZWxzZXsNCmlmKG5jaGFyKHJlc3BvbnNlKT4wKXsNCnJldFZhbDwtcmpzb246OmZyb21KU09OKHJlc3BvbnNlKQ0KaWYobGVuZ3RoKHJldFZhbCk9PTApew0KZGF0YS5mcmFtZSgpDQp9ZWxzZXsNCmlmKCdlcnJvciclaW4lbmFtZXMocmV0VmFsKSl7DQpkYXRhLmZyYW1lKCkNCn1lbHNlew0KaWYoIWlzLm51bGwocmV0VmFsJG1lc3NhZ2UpKXsNCmlmKHJldFZhbCRtZXNzYWdlPT0NCidlcnJvci5hY2Nlc3NEZW5pZWQnKXsNCmRhdGEuZnJhbWUoKQ0KfWVsc2V7DQpkby5jYWxsKHJiaW5kLGxhcHBseShyZXRWYWwsZGF0YS5mcmFtZSkpfQ0KfWVsc2V7DQpkby5jYWxsKHJiaW5kLGxhcHBseShyZXRWYWwsZGF0YS5mcmFtZSkpfX19DQp9ZWxzZXsNCmRhdGEuZnJhbWUoKX19fQ0KcmVhZEl0ZW1zPC1mdW5jdGlvbihhcHAscmVwb191cmwpew0KaWYobGVuZ3RoKGFwcCk9PTApew0KZGF0YS5mcmFtZSgpDQpyZXR1cm4oKX0NCmhlYWRlcnM8LWRlZmF1bHRIZWFkZXJzKGFwcFtbJ3Rva2VuJ11dKQ0KdXJsX2RhdGE8LXBhc3RlMChyZXBvX3VybCwnP3NpemU9MjAwMCcpDQpoZWFkZXI8LVJDdXJsOjpiYXNpY0hlYWRlckdhdGhlcmVyKCkNCmRvYzwtdHJ5Q2F0Y2goDQpSQ3VybDo6Z2V0VVJJKHVybF9kYXRhLC5vcHRzPWxpc3QoaHR0cGhlYWRlcj1oZWFkZXJzKSxoZWFkZXJmdW5jdGlvbj1oZWFkZXIkdXBkYXRlKSwNCmVycm9yPWZ1bmN0aW9uKGUpe3JldHVybihOQSl9KQ0KcmVzcG9uc2U8LU5BDQpyZXNwRGF0YTwtZGF0YS5mcmFtZSgpDQppZighaXMubmEoZG9jKSl7DQpyZWNzPC10cnlDYXRjaCgNCmFzLmludGVnZXIoaGVhZGVyJHZhbHVlKClbWydYLVRvdGFsLUNvdW50J11dKSwNCmVycm9yPWZ1bmN0aW9uKGUpe3JldHVybigwKX0pDQppZihyZWNzPjIwMDApew0KZm9yKHBhZ2UgaW4gMDpmbG9vcihyZWNzLzIwMDApKXsNCnVybF9kYXRhPC1wYXN0ZTAocmVwb191cmwsDQonP3BhZ2U9JyxwYWdlLA0KJyZzaXplPTIwMDAnKQ0KcmVzcG9uc2U8LXRyeUNhdGNoKA0KUkN1cmw6OmdldFVSTCh1cmxfZGF0YSwNCi5vcHRzPWxpc3QoaHR0cGhlYWRlcj1oZWFkZXJzKSksDQplcnJvcj1mdW5jdGlvbihlKXtyZXR1cm4oTkEpfSkNCnN1YkRhdGE8LXIyZChyZXNwb25zZSkNCmlmKG5yb3cocmVzcERhdGEpPjApew0KcmVzcERhdGE8LXJiaW5kKHJlc3BEYXRhLHN1YkRhdGEpDQp9ZWxzZXsNCnJlc3BEYXRhPC1zdWJEYXRhfX0NCn1lbHNlew0KcmVzcG9uc2U8LXRyeUNhdGNoKA0KUkN1cmw6OmdldFVSTCh1cmxfZGF0YSwub3B0cz1saXN0KGh0dHBoZWFkZXI9aGVhZGVycykpLA0KZXJyb3I9ZnVuY3Rpb24oZSl7cmV0dXJuKE5BKX0pDQpyZXNwRGF0YTwtcjJkKHJlc3BvbnNlKX19DQpyZXNwRGF0YX0NCndyaXRlSXRlbTwtZnVuY3Rpb24oYXBwLHJlcG9fdXJsLGl0ZW0pew0KaGVhZGVyczwtZGVmYXVsdEhlYWRlcnMoYXBwW1sndG9rZW4nXV0pDQpkYXRhPC1yanNvbjo6dG9KU09OKGl0ZW0pDQpyZXNwb25zZTwtdHJ5Q2F0Y2goDQpSQ3VybDo6cG9zdEZvcm0ocmVwb191cmwsLm9wdHM9bGlzdChodHRwaGVhZGVyPWhlYWRlcnMscG9zdGZpZWxkcz1kYXRhKSksDQplcnJvcj1mdW5jdGlvbihlKXsNCnJldHVybihOQSl9KQ0KcmVzcG9uc2V9DQp1cGRhdGVJdGVtPC1mdW5jdGlvbihhcHAscmVwb191cmwsaXRlbSxpZCl7DQpoZWFkZXJzPC1kZWZhdWx0SGVhZGVycyhhcHBbWyd0b2tlbiddXSkNCml0ZW08LWMoaXRlbSxjKGlkPWFzLm51bWVyaWMoaWQpKSkNCmRhdGE8LXJqc29uOjp0b0pTT04oaXRlbSkNCnJlc3BvbnNlPC10cnlDYXRjaCgNClJDdXJsOjpwb3N0Rm9ybShyZXBvX3VybCwub3B0cz1saXN0KGh0dHBoZWFkZXI9aGVhZGVycyxwb3N0ZmllbGRzPWRhdGEpKSwNCmVycm9yPWZ1bmN0aW9uKGUpe3JldHVybihOQSl9KQ0KcmVzcG9uc2V9DQpkZWxldGVJdGVtPC1mdW5jdGlvbihhcHAscmVwb191cmwsaWQpew0KaGVhZGVyczwtZGVmYXVsdEhlYWRlcnMoYXBwW1sndG9rZW4nXV0pDQppdGVtX3VybDwtcGFzdGUwKHJlcG9fdXJsLCcvJyxpZCkNCnJlc3BvbnNlPC10cnlDYXRjaCgNCmh0dHI6OkRFTEVURShpdGVtX3VybCxhZGRfaGVhZGVycyhoZWFkZXJzKSksDQplcnJvcj1mdW5jdGlvbihlKXsNCnJldHVybihOQSl9KQ0KcmVzcG9uc2V9DQpwbHo8LSdbcGx6XScNCmNvdW50cnk8LSdbY291bnRyeV0nDQpyZXBvTmFtZTwtJ1tyZXBvX25hbWVdJw0KcGlhX3VybDwtJ1twaWFfdXJsXScNCmFwcF9rZXk8LSdbYXBwX2tleV0nDQphcHBfc2VjcmV0PC0nW2FwcF9zZWNyZXRdJw0KYXBwPC1zZXR1cEFwcChwaWFfdXJsLGFwcF9rZXksYXBwX3NlY3JldCkNCnVybDwtaXRlbXNVcmwocGlhX3VybCxwYXN0ZTAoJ2V1Lm93bnlvdXJkYXRhLmFsbGVyZ3kucG9sbGluYXRpb25fJyxzd2l0Y2goY291bnRyeSwnw5ZzdGVycmVpY2gnPSdBJywnRGV1dHNjaGxhbmQnPSdEJywnU2Nod2Vpeic9J0NIJyksJy0nLHBseikpDQphbGxJdGVtczwtcmVhZEl0ZW1zKGFwcCx1cmwpDQpybTwtYWxsSXRlbXNbYXMubnVtZXJpYyhhbGxJdGVtcyR0aW1lc3RhbXApPmFzLm51bWVyaWMoU3lzLnRpbWUoKSksXQ0KbGFwcGx5KHJtJGlkLGZ1bmN0aW9uKHgpZGVsZXRlSXRlbShhcHAsdXJsLHgpKQ0KaWYoY291bnRyeT09J8OWc3RlcnJlaWNoJyl7d2VicGFnZTwtZ2V0VVJMKHBhc3RlMCgnaHR0cHM6Ly93d3cucG9sbGVuaW5mby5vcmcvQVQvZGUvcHJvZ25vc2UvMy10YWdlcy1wcm9nbm9zZS5odG1sP3R4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGV4dGVuc2lvbiU1RD1TY0xvYWQmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwdmVuZG9yJTVEPVNjcmVlbmNvZGUmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwY29udHJvbGxlciU1RD1Mb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGFjdGlvbiU1RD1zdGFydHBhZ2VzZWFyY2hmb3JtJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QmFyZ3VtZW50cyU1RD1ZVG93T250OTMxZjkxMjY4YWM5ZmFhYWRjY2U0ZmE1YmE3NGI1ZTg3NTliYTZmNDImdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwcmVxdWVzdCU1RD1hJTNBNCUzQSU3QnMlM0ExMCUzQSUyMiU0MGV4dGVuc2lvbiUyMiUzQnMlM0E2JTNBJTIyU2NMb2FkJTIyJTNCcyUzQTExJTNBJTIyJTQwY29udHJvbGxlciUyMiUzQnMlM0E0JTNBJTIyTG9hZCUyMiUzQnMlM0E3JTNBJTIyJTQwYWN0aW9uJTIyJTNCcyUzQTE5JTNBJTIyc3RhcnRwYWdlc2VhcmNoZm9ybSUyMiUzQnMlM0E3JTNBJTIyJTQwdmVuZG9yJTIyJTNCcyUzQTEwJTNBJTIyU2NyZWVuY29kZSUyMiUzQiU3RGI1OWU0NmJmZWEwYzU5MmEwNTVlMTVjN2Q3ZGE5ZWUxNjg3YTBlNWEmdHhfc2Nsb2FkX2xvYWQlNUJfX3RydXN0ZWRQcm9wZXJ0aWVzJTVEPWElM0EyJTNBJTdCcyUzQTMlM0ElMjJ6aXAlMjIlM0JpJTNBMSUzQnMlM0E0JTNBJTIyY2l0eSUyMiUzQmklM0ExJTNCJTdENmI4ZmM4M2E4ZDkxNGNiODg2ZGU4M2FhZDEyMTliMmZlZThiZjM1NyZ0eF9zY2xvYWRfbG9hZCU1QnppcCU1RD0nLHBseiwnJnR4X3NjbG9hZF9sb2FkJTVCY2l0eSU1RD0jYnJlYWRjcnVtYicpKX0NCmlmKGNvdW50cnk9PSdEZXV0c2NobGFuZCcpe3dlYnBhZ2U8LWdldFVSTChwYXN0ZTAoJ2h0dHBzOi8vd3d3LnBvbGxlbmluZm8ub3JnL0RFL2RlL3Byb2dub3NlLzMtdGFnZXMtcHJvZ25vc2UuaHRtbD90eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDBleHRlbnNpb24lNUQ9U2NMb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MHZlbmRvciU1RD1TY3JlZW5jb2RlJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGNvbnRyb2xsZXIlNUQ9TG9hZCZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUIlNDBhY3Rpb24lNUQ9c3RhcnRwYWdlc2VhcmNoZm9ybSZ0eF9zY2xvYWRfbG9hZCU1Ql9fcmVmZXJyZXIlNUQlNUJhcmd1bWVudHMlNUQ9WVRvd09udDkzMWY5MTI2OGFjOWZhYWFkY2NlNGZhNWJhNzRiNWU4NzU5YmE2ZjQyJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MHJlcXVlc3QlNUQ9YSUzQTQlM0ElN0JzJTNBMTAlM0ElMjIlNDBleHRlbnNpb24lMjIlM0JzJTNBNiUzQSUyMlNjTG9hZCUyMiUzQnMlM0ExMSUzQSUyMiU0MGNvbnRyb2xsZXIlMjIlM0JzJTNBNCUzQSUyMkxvYWQlMjIlM0JzJTNBNyUzQSUyMiU0MGFjdGlvbiUyMiUzQnMlM0ExOSUzQSUyMnN0YXJ0cGFnZXNlYXJjaGZvcm0lMjIlM0JzJTNBNyUzQSUyMiU0MHZlbmRvciUyMiUzQnMlM0ExMCUzQSUyMlNjcmVlbmNvZGUlMjIlM0IlN0RiNTllNDZiZmVhMGM1OTJhMDU1ZTE1YzdkN2RhOWVlMTY4N2EwZTVhJnR4X3NjbG9hZF9sb2FkJTVCX190cnVzdGVkUHJvcGVydGllcyU1RD1hJTNBMiUzQSU3QnMlM0EzJTNBJTIyemlwJTIyJTNCaSUzQTElM0JzJTNBNCUzQSUyMmNpdHklMjIlM0JpJTNBMSUzQiU3RDZiOGZjODNhOGQ5MTRjYjg4NmRlODNhYWQxMjE5YjJmZWU4YmYzNTcmdHhfc2Nsb2FkX2xvYWQlNUJ6aXAlNUQ9JyxwbHosJyZ0eF9zY2xvYWRfbG9hZCU1QmNpdHklNUQ9I2JyZWFkY3J1bWInKSl9DQppZihjb3VudHJ5PT0nU2Nod2Vpeicpe3dlYnBhZ2U8LWdldFVSTChwYXN0ZTAoJ2h0dHBzOi8vd3d3LnBvbGxlbmluZm8ub3JnL0NIL2VuL3Byb2dub3Npcy9wb2xsZW4tbG9hZC5odG1sP3R4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGV4dGVuc2lvbiU1RD1TY0xvYWQmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwdmVuZG9yJTVEPVNjcmVlbmNvZGUmdHhfc2Nsb2FkX2xvYWQlNUJfX3JlZmVycmVyJTVEJTVCJTQwY29udHJvbGxlciU1RD1Mb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MGFjdGlvbiU1RD1sb2FkJnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QmFyZ3VtZW50cyU1RD1ZVG95T250ek9qTTZJbnBwY0NJN2N6bzBPaUkzTWpBeElqdHpPalE2SW1OcGRIa2lPM002TURvaUlqdDlmYTllZGJjNmRlMDNkZGQ3NTM4NWY4YWY1NzE0NTRlZjcxYzY4NjQ5JnR4X3NjbG9hZF9sb2FkJTVCX19yZWZlcnJlciU1RCU1QiU0MHJlcXVlc3QlNUQ9YSUzQTQlM0ElN0JzJTNBMTAlM0ElMjIlNDBleHRlbnNpb24lMjIlM0JzJTNBNiUzQSUyMlNjTG9hZCUyMiUzQnMlM0ExMSUzQSUyMiU0MGNvbnRyb2xsZXIlMjIlM0JzJTNBNCUzQSUyMkxvYWQlMjIlM0JzJTNBNyUzQSUyMiU0MGFjdGlvbiUyMiUzQnMlM0E0JTNBJTIybG9hZCUyMiUzQnMlM0E3JTNBJTIyJTQwdmVuZG9yJTIyJTNCcyUzQTEwJTNBJTIyU2NyZWVuY29kZSUyMiUzQiU3RDRmMmMxNWJhMzYxNTcwN2RkMGE0YmVmMTUxZjFmZDhmMTRjMzY5MjEmdHhfc2Nsb2FkX2xvYWQlNUJfX3RydXN0ZWRQcm9wZXJ0aWVzJTVEPWElM0EyJTNBJTdCcyUzQTMlM0ElMjJ6aXAlMjIlM0JpJTNBMSUzQnMlM0E0JTNBJTIyY2l0eSUyMiUzQmklM0ExJTNCJTdENmI4ZmM4M2E4ZDkxNGNiODg2ZGU4M2FhZDEyMTliMmZlZThiZjM1NyZ0eF9zY2xvYWRfbG9hZCU1QnppcCU1RD0mdHhfc2Nsb2FkX2xvYWQlNUJjaXR5JTVEPScscGx6LCcjYnJlYWRjcnVtYicpKX0NCndlYnBhZ2U8LXJlYWRMaW5lcyh0YzwtdGV4dENvbm5lY3Rpb24od2VicGFnZSkpO2Nsb3NlKHRjKQ0KcGFnZXRyZWU8LWh0bWxUcmVlUGFyc2Uod2VicGFnZSx1c2VJbnRlcm5hbE5vZGVzPVRSVUUpDQpwb2xsZW5MaXN0PC1zd2l0Y2goY291bnRyeSwnw5ZzdGVycmVpY2gnPXBvbGxlbkxpc3RBVCwnRGV1dHNjaGxhbmQnPXBvbGxlbkxpc3RERSwnU2Nod2Vpeic9cG9sbGVuTGlzdENIKQ0KbGFwcGx5KHBvbGxlbkxpc3QsZnVuY3Rpb24oeCl7DQp4UGF0aFN0cjwtcGFzdGUwKCIvL2gzW0BjbGFzcz0ncG9sbHRpdGxlJ2FuZGNvbnRhaW5zKHRleHQoKSwnIix4LCInKV0vLi4vL3NwYW5bQGNsYXNzPSdpbnZpc2libGUnXSIpDQpmb3IoaSBpbiAxOjMpew0KYmVsYXN0dW5nPC10b2xvd2VyKHRyaW13cyh4cGF0aFNBcHBseShwYWdldHJlZSx4UGF0aFN0cix4bWxWYWx1ZSlbaV0pKQ0KcmVzdWx0PC1zd2l0Y2goYmVsYXN0dW5nLCdrZWluZSBiZWxhc3R1bmcnPTAsJ25vIGFsbGVyZ3kgcmlzayc9MCwnbmllZHJpZyc9MSwnbG93Jz0xLCdtaXR0ZWwnPTIsJ21vZGVyYXRlJz0yLCdob2NoJz0zLCdoaWdoJz0zLCdzZWhyIGhvY2gnPTQsJ3ZlcnkgaGlnaCc9NCx7LTF9KQ0KaWYocmVzdWx0PjApew0KaWYoaT09MSl7DQpyZWNvcmQ8LWxpc3QodGltZXN0YW1wPWFzLm51bWVyaWMoU3lzLnRpbWUoKSkscG9sbFR5cGU9eCx2YWx1ZT1yZXN1bHQsJ19veWRSZXBvTmFtZSc9cmVwb05hbWUpDQp9ZWxzZXsNCm15RGF0PC14cGF0aFNBcHBseShwYWdldHJlZSxwYXN0ZTAoIi8vaDNbQGNsYXNzPSdwb2xsdGl0bGUnYW5kY29udGFpbnModGV4dCgpLCciLHgsIicpXS8uLi8vZGl2W0BjbGFzcz0nZGF0ZSddIikseG1sVmFsdWUpW2ldDQpteURhdDwtc3ViKCdKw6RubmVyJywnSmFudWFyeScsbXlEYXQpDQpteURhdDwtc3ViKCdGZWJydWFyJywnRmVicnVhcnknLG15RGF0KQ0KbXlEYXQ8LXN1YignTcOkcnonLCdNYXJjaCcsbXlEYXQpDQpteURhdDwtc3ViKCdNYWknLCdNYXknLG15RGF0KQ0KbXlEYXQ8LXN1YignSnVuaScsJ0p1bmUnLG15RGF0KQ0KbXlEYXQ8LXN1YignSnVsaScsJ0p1bHknLG15RGF0KQ0KbXlEYXQ8LXN1YignT2t0b2JlcicsJ09jdG9iZXInLG15RGF0KQ0KbXlEYXQ8LXN1YignRGV6ZW1iZXInLCdEZWNlbWJlcicsbXlEYXQpDQp0czwtYXMuUE9TSVhjdChwYXN0ZShhcy5EYXRlKGdzdWIoJy4qLCguKiknLCdcXDEnLG15RGF0KSwnJWQuICVCJyksIjEyOjAwIikpDQpyZWNvcmQ8LWxpc3QodGltZXN0YW1wPWFzLm51bWVyaWModHMpLHBvbGxUeXBlPXgsdmFsdWU9cmVzdWx0LCdfb3lkUmVwb05hbWUnPXJlcG9OYW1lKX0NCndyaXRlSXRlbShhcHAsdXJsLHJlY29yZCl9fX0p'
