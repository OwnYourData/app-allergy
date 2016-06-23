# OYD: Allergie-Tagebuch  - last update:2016-05-20
# Manifest for allergy app ================================
'
encode with https://www.base64encode.org/
{
        "name":"Allergy App",
        "identifier":"eu.ownyourdata.allergy",
        "type":"external",
        "description":"track your allergy (pollination, mood, medicine intake)",
        "permissions":["eu.ownyourdata.allergy.pollination:read",
                       "eu.ownyourdata.allergy.pollination:write",
                       "eu.ownyourdata.allergy.pollination:update",
                       "eu.ownyourdata.allergy.pollination:delete",
                       "eu.ownyourdata.allergy.condition:read",
                       "eu.ownyourdata.allergy.condition:write",
                       "eu.ownyourdata.allergy.condition:update",
                       "eu.ownyourdata.allergy.condition:delete",
                       "eu.ownyourdata.allergy.medintake:read",
                       "eu.ownyourdata.allergy.medintake:write",
                       "eu.ownyourdata.allergy.medintake:update",
                       "eu.ownyourdata.allergy.medintake:delete",
                       "eu.ownyourdata.scheduler:read",
                       "eu.ownyourdata.scheduler:write",
                       "eu.ownyourdata.scheduler:update",
                       "eu.ownyourdata.scheduler:delete",
                       "eu.ownyourdata.scheduler.email_config:read",
                       "eu.ownyourdata.scheduler.email_config:write",
                       "eu.ownyourdata.scheduler.email_config:update",
                       "eu.ownyourdata.scheduler.email_config:delete"]
}
ew0KICAgICAgICAibmFtZSI6IkFsbGVyZ3kgQXBwIiwNCiAgICAgICAgImlkZW50aWZpZXIiOiJldS5vd255b3VyZGF0YS5hbGxlcmd5IiwNCiAgICAgICAgInR5cGUiOiJleHRlcm5hbCIsDQogICAgICAgICJkZXNjcmlwdGlvbiI6InRyYWNrIHlvdXIgYWxsZXJneSAocG9sbGluYXRpb24sIG1vb2QsIG1lZGljaW5lIGludGFrZSkiLA0KICAgICAgICAicGVybWlzc2lvbnMiOlsiZXUub3dueW91cmRhdGEuYWxsZXJneS5wb2xsaW5hdGlvbjpyZWFkIiwNCiAgICAgICAgICAgICAgICAgICAgICAgImV1Lm93bnlvdXJkYXRhLmFsbGVyZ3kucG9sbGluYXRpb246d3JpdGUiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuYWxsZXJneS5wb2xsaW5hdGlvbjp1cGRhdGUiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuYWxsZXJneS5wb2xsaW5hdGlvbjpkZWxldGUiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuYWxsZXJneS5jb25kaXRpb246cmVhZCIsDQogICAgICAgICAgICAgICAgICAgICAgICJldS5vd255b3VyZGF0YS5hbGxlcmd5LmNvbmRpdGlvbjp3cml0ZSIsDQogICAgICAgICAgICAgICAgICAgICAgICJldS5vd255b3VyZGF0YS5hbGxlcmd5LmNvbmRpdGlvbjp1cGRhdGUiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuYWxsZXJneS5jb25kaXRpb246ZGVsZXRlIiwNCiAgICAgICAgICAgICAgICAgICAgICAgImV1Lm93bnlvdXJkYXRhLmFsbGVyZ3kubWVkaW50YWtlOnJlYWQiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuYWxsZXJneS5tZWRpbnRha2U6d3JpdGUiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuYWxsZXJneS5tZWRpbnRha2U6dXBkYXRlIiwNCiAgICAgICAgICAgICAgICAgICAgICAgImV1Lm93bnlvdXJkYXRhLmFsbGVyZ3kubWVkaW50YWtlOmRlbGV0ZSIsDQogICAgICAgICAgICAgICAgICAgICAgICJldS5vd255b3VyZGF0YS5zY2hlZHVsZXI6cmVhZCIsDQogICAgICAgICAgICAgICAgICAgICAgICJldS5vd255b3VyZGF0YS5zY2hlZHVsZXI6d3JpdGUiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZXUub3dueW91cmRhdGEuc2NoZWR1bGVyOnVwZGF0ZSIsDQogICAgICAgICAgICAgICAgICAgICAgICJldS5vd255b3VyZGF0YS5zY2hlZHVsZXI6ZGVsZXRlIiwNCiAgICAgICAgICAgICAgICAgICAgICAgImV1Lm93bnlvdXJkYXRhLnNjaGVkdWxlci5lbWFpbF9jb25maWc6cmVhZCIsDQogICAgICAgICAgICAgICAgICAgICAgICJldS5vd255b3VyZGF0YS5zY2hlZHVsZXIuZW1haWxfY29uZmlnOndyaXRlIiwNCiAgICAgICAgICAgICAgICAgICAgICAgImV1Lm93bnlvdXJkYXRhLnNjaGVkdWxlci5lbWFpbF9jb25maWc6dXBkYXRlIiwNCiAgICAgICAgICAgICAgICAgICAgICAgImV1Lm93bnlvdXJkYXRhLnNjaGVkdWxlci5lbWFpbF9jb25maWc6ZGVsZXRlIl0NCn0NCg==
'

# Setup and config ========================================
# install.packages(c('shiny', 'shinyBS', 'RCurl', 'jsonlite', 'dplyr', 'tidyr'), repos='https://cran.rstudio.com/')
library(shiny)
library(RCurl)
library(jsonlite)
library(dplyr)
library(tidyr)

source("oyd_helpers.R")

first <- TRUE
# script für heute
# library(XML); suppressPackageStartupMessages(library(RCurl)); url<-'https://www.pollenwarndienst.at/de/aktuelle-werte.html?zip=[PLZ]&maincity=10&tabber=2'; data<-getURL(url,ssl.verifypeer=0L, followlocation=1L); page<-htmlTreeParse(data, useInternal=TRUE); value<-xpathSApply(page,"/html/body/div[@id='wrapper']/div[@id='content']/div[@id='content_left']/div[@id='c3']/div[@id='charts_container']/div[@id='tabber_contamination']/div[@class='chart_content contamination ']/div[@class='contamination_row']/div[contains(text(), '[allergy]')]/following::div[1]", xmlValue)[1]; if (is.null(value) | value=='') value <- '0'; result <- utf8ToInt(value);
script_pollenwarndienst <- "bGlicmFyeShYTUwpOyBzdXBwcmVzc1BhY2thZ2VTdGFydHVwTWVzc2FnZXMobGlicmFyeShSQ3VybCkpOyB1cmw8LSdodHRwczovL3d3dy5wb2xsZW53YXJuZGllbnN0LmF0L2RlL2FrdHVlbGxlLXdlcnRlLmh0bWw/emlwPVtQTFpdJm1haW5jaXR5PTEwJnRhYmJlcj0yJzsgZGF0YTwtZ2V0VVJMKHVybCxzc2wudmVyaWZ5cGVlcj0wTCwgZm9sbG93bG9jYXRpb249MUwpOyBwYWdlPC1odG1sVHJlZVBhcnNlKGRhdGEsIHVzZUludGVybmFsPVRSVUUpOyB2YWx1ZTwteHBhdGhTQXBwbHkocGFnZSwiL2h0bWwvYm9keS9kaXZbQGlkPSd3cmFwcGVyJ10vZGl2W0BpZD0nY29udGVudCddL2RpdltAaWQ9J2NvbnRlbnRfbGVmdCddL2RpdltAaWQ9J2MzJ10vZGl2W0BpZD0nY2hhcnRzX2NvbnRhaW5lciddL2RpdltAaWQ9J3RhYmJlcl9jb250YW1pbmF0aW9uJ10vZGl2W0BjbGFzcz0nY2hhcnRfY29udGVudCBjb250YW1pbmF0aW9uICddL2RpdltAY2xhc3M9J2NvbnRhbWluYXRpb25fcm93J10vZGl2W2NvbnRhaW5zKHRleHQoKSwgJ1thbGxlcmd5XScpXS9mb2xsb3dpbmc6OmRpdlsxXSIsIHhtbFZhbHVlKVsxXTsgaWYgKGlzLm51bGwodmFsdWUpIHwgdmFsdWU9PScnKSB2YWx1ZSA8LSAnMCc7IHJlc3VsdCA8LSB1dGY4VG9JbnQodmFsdWUpOw=="
# script für morgen
# library(XML); suppressPackageStartupMessages(library(RCurl)); url<-'https://www.pollenwarndienst.at/de/aktuelle-werte.html?zip=[PLZ]&maincity=10&tabber=2'; data<-getURL(url,ssl.verifypeer=0L, followlocation=1L); page<-htmlTreeParse(data, useInternal=TRUE); value<-xpathSApply(page,"/html/body/div[@id='wrapper']/div[@id='content']/div[@id='content_left']/div[@id='c3']/div[@id='charts_container']/div[@id='tabber_contamination']/div[@class='chart_content contamination ']/div[@class='contamination_row']/div[contains(text(), '[allergy]')]/following::div[3]", xmlValue)[1]; if (is.null(value) | value=='') value <- '0'; result <- utf8ToInt(value);
script_pollenwarndienst1 <- "bGlicmFyeShYTUwpOyBzdXBwcmVzc1BhY2thZ2VTdGFydHVwTWVzc2FnZXMobGlicmFyeShSQ3VybCkpOyB1cmw8LSdodHRwczovL3d3dy5wb2xsZW53YXJuZGllbnN0LmF0L2RlL2FrdHVlbGxlLXdlcnRlLmh0bWw/emlwPVtQTFpdJm1haW5jaXR5PTEwJnRhYmJlcj0yJzsgZGF0YTwtZ2V0VVJMKHVybCxzc2wudmVyaWZ5cGVlcj0wTCwgZm9sbG93bG9jYXRpb249MUwpOyBwYWdlPC1odG1sVHJlZVBhcnNlKGRhdGEsIHVzZUludGVybmFsPVRSVUUpOyB2YWx1ZTwteHBhdGhTQXBwbHkocGFnZSwiL2h0bWwvYm9keS9kaXZbQGlkPSd3cmFwcGVyJ10vZGl2W0BpZD0nY29udGVudCddL2RpdltAaWQ9J2NvbnRlbnRfbGVmdCddL2RpdltAaWQ9J2MzJ10vZGl2W0BpZD0nY2hhcnRzX2NvbnRhaW5lciddL2RpdltAaWQ9J3RhYmJlcl9jb250YW1pbmF0aW9uJ10vZGl2W0BjbGFzcz0nY2hhcnRfY29udGVudCBjb250YW1pbmF0aW9uICddL2RpdltAY2xhc3M9J2NvbnRhbWluYXRpb25fcm93J10vZGl2W2NvbnRhaW5zKHRleHQoKSwgJ1thbGxlcmd5XScpXS9mb2xsb3dpbmc6OmRpdlszXSIsIHhtbFZhbHVlKVsxXTsgaWYgKGlzLm51bGwodmFsdWUpIHwgdmFsdWU9PScnKSB2YWx1ZSA8LSAnMCc7IHJlc3VsdCA8LSB1dGY4VG9JbnQodmFsdWUpOw=="
# script für übermorgen
# library(XML); suppressPackageStartupMessages(library(RCurl)); url<-'https://www.pollenwarndienst.at/de/aktuelle-werte.html?zip=[PLZ]&maincity=10&tabber=2'; data<-getURL(url,ssl.verifypeer=0L, followlocation=1L); page<-htmlTreeParse(data, useInternal=TRUE); value<-xpathSApply(page,"/html/body/div[@id='wrapper']/div[@id='content']/div[@id='content_left']/div[@id='c3']/div[@id='charts_container']/div[@id='tabber_contamination']/div[@class='chart_content contamination ']/div[@class='contamination_row']/div[contains(text(), '[allergy]')]/following::div[5]", xmlValue)[1]; if (is.null(value) | value=='') value <- '0'; result <- utf8ToInt(value);
script_pollenwarndienst2 <- "bGlicmFyeShYTUwpOyBzdXBwcmVzc1BhY2thZ2VTdGFydHVwTWVzc2FnZXMobGlicmFyeShSQ3VybCkpOyB1cmw8LSdodHRwczovL3d3dy5wb2xsZW53YXJuZGllbnN0LmF0L2RlL2FrdHVlbGxlLXdlcnRlLmh0bWw/emlwPVtQTFpdJm1haW5jaXR5PTEwJnRhYmJlcj0yJzsgZGF0YTwtZ2V0VVJMKHVybCxzc2wudmVyaWZ5cGVlcj0wTCwgZm9sbG93bG9jYXRpb249MUwpOyBwYWdlPC1odG1sVHJlZVBhcnNlKGRhdGEsIHVzZUludGVybmFsPVRSVUUpOyB2YWx1ZTwteHBhdGhTQXBwbHkocGFnZSwiL2h0bWwvYm9keS9kaXZbQGlkPSd3cmFwcGVyJ10vZGl2W0BpZD0nY29udGVudCddL2RpdltAaWQ9J2NvbnRlbnRfbGVmdCddL2RpdltAaWQ9J2MzJ10vZGl2W0BpZD0nY2hhcnRzX2NvbnRhaW5lciddL2RpdltAaWQ9J3RhYmJlcl9jb250YW1pbmF0aW9uJ10vZGl2W0BjbGFzcz0nY2hhcnRfY29udGVudCBjb250YW1pbmF0aW9uICddL2RpdltAY2xhc3M9J2NvbnRhbWluYXRpb25fcm93J10vZGl2W2NvbnRhaW5zKHRleHQoKSwgJ1thbGxlcmd5XScpXS9mb2xsb3dpbmc6OmRpdls1XSIsIHhtbFZhbHVlKVsxXTsgaWYgKGlzLm51bGwodmFsdWUpIHwgdmFsdWU9PScnKSB2YWx1ZSA8LSAnMCc7IHJlc3VsdCA8LSB1dGY4VG9JbnQodmFsdWUpOw=="
# see summaryPic.R
script_summaryPic <- "bGlicmFyeShYTUwpDQpjb250ZW50IDwtICINCmBgYHtyLCBmaWcuYWxpZ249J2NlbnRlcicsIGZpZy5oZWlnaHQ9NCwgZmlnLndpZHRoPTgsIGVjaG89RkFMU0UsIG1lc3NhZ2U9RkFMU0UsIHdhcm5pbmc9RkFMU0V9DQpsaWJyYXJ5KHJlYWRyKQ0KbGlicmFyeShrbml0cikNCmxpYnJhcnkoUkN1cmwpDQpsaWJyYXJ5KGpzb25saXRlKQ0KbGlicmFyeSh0aWR5cikNCg0KZ2V0VG9rZW4gPC0gZnVuY3Rpb24odXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KSB7DQp1cmxfYXV0aCA8LSBwYXN0ZTAodXJsLCAnL29hdXRoL3Rva2VuJykNCnJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KcG9zdEZvcm0odXJsX2F1dGgsDQpjbGllbnRfaWQ9YXBwX2tleSwNCmNsaWVudF9zZWNyZXQ9YXBwX3NlY3JldCwNCmdyYW50X3R5cGU9J2NsaWVudF9jcmVkZW50aWFscycpLA0KZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCmlmIChpcy5uYShyZXNwb25zZSkpIHsNCnJldHVybihOQSkNCn0gZWxzZSB7DQpyZXR1cm4oZnJvbUpTT04ocmVzcG9uc2VbMV0pJGFjY2Vzc190b2tlbikNCn0NCn0NCg0KaXRlbXNVcmwgPC0gZnVuY3Rpb24odXJsLCBhcHBfa2V5KSB7DQpwYXN0ZTAodXJsLCAnL2FwaS9yZXBvcy8nLCBhcHBfa2V5LCAnL2l0ZW1zJykNCn0NCg0KcmVhZEl0ZW1zIDwtIGZ1bmN0aW9uKHJlcG8sIHVybCkgew0KaWYgKGxlbmd0aChyZXBvKSA9PSAwKSB7DQpkYXRhLmZyYW1lKCkNCn0gZWxzZSB7DQpoZWFkZXJzIDwtIGRlZmF1bHRIZWFkZXJzKHJlcG9bWyd0b2tlbiddXSkNCnVybF9kYXRhIDwtIHBhc3RlMCh1cmwsICc/c2l6ZT0yMDAwJykNCnJlc3BvbnNlIDwtIHRyeUNhdGNoKA0KZ2V0VVJMKHVybF9kYXRhLA0KLm9wdHM9bGlzdChodHRwaGVhZGVyID0gaGVhZGVycykpLA0KZXJyb3IgPSBmdW5jdGlvbihlKSB7IHJldHVybihOQSkgfSkNCmlmIChpcy5uYShyZXNwb25zZSkpIHsNCmRhdGEuZnJhbWUoKQ0KfSBlbHNlIHsNCmlmIChuY2hhcihyZXNwb25zZSkgPiAwKSB7DQpyZXRWYWwgPC0gZnJvbUpTT04ocmVzcG9uc2UpDQppZihsZW5ndGgocmV0VmFsKSA9PSAwKSB7DQpkYXRhLmZyYW1lKCkNCn0gZWxzZSB7DQppZiAoJ2Vycm9yJyAlaW4lIG5hbWVzKHJldFZhbCkpIHsNCmRhdGEuZnJhbWUoKQ0KfSBlbHNlIHsNCmlmICghaXMubnVsbChyZXRWYWwkbWVzc2FnZSkpIHsNCmlmIChyZXRWYWwkbWVzc2FnZSA9PSAnZXJyb3IuYWNjZXNzRGVuaWVkJykgew0KZGF0YS5mcmFtZSgpDQp9IGVsc2Ugew0KcmV0VmFsDQp9DQp9IGVsc2Ugew0KcmV0VmFsDQp9DQp9DQp9DQp9IGVsc2Ugew0KZGF0YS5mcmFtZSgpDQp9DQp9DQp9DQp9DQoNCmRlZmF1bHRIZWFkZXJzIDwtIGZ1bmN0aW9uKHRva2VuKSB7DQpjKCdBY2NlcHQnICAgICAgICA9ICcqLyonLA0KJ0NvbnRlbnQtVHlwZScgID0gJ2FwcGxpY2F0aW9uL2pzb24nLA0KJ0F1dGhvcml6YXRpb24nID0gcGFzdGUoJ0JlYXJlcicsIHRva2VuKSkNCn0NCg0KZ2V0UmVwbyA8LSBmdW5jdGlvbih1cmwsIGtleSwgc2VjcmV0KSB7DQpjKCd1cmwnICAgICAgICA9IHVybCwNCidhcHBfa2V5JyAgICA9IGtleSwNCidhcHBfc2VjcmV0JyA9IHNlY3JldCwNCid0b2tlbicgICAgICA9IGdldFRva2VuKHVybCwgDQprZXksIA0Kc2VjcmV0KSkNCn0NCg0KYWxsZXJneURhdGEgPC0gZnVuY3Rpb24oY2F0ZWdvcnksIHJlcG8pew0KaWYobGVuZ3RoKHJlcG8pID4gMCkgew0KdXJsIDwtIGl0ZW1zVXJsKHJlcG9bWyd1cmwnXV0sIA0KcGFzdGUwKHJlcG9bWydhcHBfa2V5J11dLCANCicuJyxjYXRlZ29yeSkpDQpwaWFEYXRhIDwtIHJlYWRJdGVtcyhyZXBvLCB1cmwpDQp9IGVsc2Ugew0KcGlhRGF0YSA8LSBkYXRhLmZyYW1lKCkNCn0NCnBpYURhdGENCn0NCg0KYWxsQWxsZXJneURhdGEgPC0gZnVuY3Rpb24odXJsLCBhcHBfa2V5LCBhcHBfc2VjcmV0KXsNCmlmKChuY2hhcih1cmwpID4gMCkgJiANCihuY2hhcihhcHBfa2V5KSA+IDApICYgDQoobmNoYXIoYXBwX3NlY3JldCkgPiAwKSkgew0KY3VyclJlcG8gPC0gZ2V0UmVwbyh1cmwsIGFwcF9rZXksIGFwcF9zZWNyZXQpDQpwX2RhdGEgPC0gZGF0YS5mcmFtZSgpDQptX2RhdGEgPC0gZGF0YS5mcmFtZSgpDQpjX2RhdGEgPC0gZGF0YS5mcmFtZSgpDQpkYXRhIDwtIGFsbGVyZ3lEYXRhKCdwb2xsaW5hdGlvbicsIGN1cnJSZXBvKQ0KaWYobnJvdyhkYXRhKSA+IDApIHsNCmNvbG5hbWVzKGRhdGEpIDwtIGMoJ2RhdGUnLCAncG9sbFR5cGUnLCAncG9sbFBseicsICdpZCcsICdwb2xsaW5hdGlvbicpDQpwX2RhdGEgPC0gZGF0YQ0KZGF0YUNvbmRpdGlvbiA8LSBhbGxlcmd5RGF0YSgnY29uZGl0aW9uJywgY3VyclJlcG8pDQppZihucm93KGRhdGFDb25kaXRpb24pID4gMCkgew0KY29sbmFtZXMoZGF0YUNvbmRpdGlvbikgPC0gYygnZGF0ZScsICdpZCcsICdjb25kaXRpb24nKQ0KY19kYXRhIDwtIGRhdGFDb25kaXRpb24NCmRhdGEgPC0gbWVyZ2UoZGF0YVssICFuYW1lcyhkYXRhKSAlaW4lIGMoJ2lkJyldLCANCmRhdGFDb25kaXRpb25bLCAhbmFtZXMoZGF0YUNvbmRpdGlvbikgJWluJSBjKCdpZCcpXSwNCmJ5PSdkYXRlJywgYWxsPVRSVUUpDQp9DQp9IGVsc2Ugew0KZGF0YSA8LSBhbGxlcmd5RGF0YSgnY29uZGl0aW9uJywgY3VyclJlcG8pDQppZihucm93KGRhdGEpID4gMCl7DQpjb2xuYW1lcyhkYXRhKSA8LSBjKCdkYXRlJywgJ2lkJywgJ2NvbmRpdGlvbicpDQpjX2RhdGEgPC0gZGF0YQ0KfSBlbHNlIHsNCmRhdGEgPC0gZGF0YS5mcmFtZSgpDQp9DQp9DQppZihucm93KGRhdGEpID4gMCkgew0KZGF0YU1lZGludGFrZSA8LSBhbGxlcmd5RGF0YSgnbWVkaW50YWtlJywgY3VyclJlcG8pDQppZihucm93KGRhdGFNZWRpbnRha2UpID4gMCkgew0KY29sbmFtZXMoZGF0YU1lZGludGFrZSkgPC0gYygnZGF0ZScsICdpZCcsICdtZWRpbnRha2UnKQ0KbV9kYXRhIDwtIGRhdGFNZWRpbnRha2UNCm1fZGF0YVt0b2xvd2VyKG1fZGF0YSRtZWRpbnRha2UpID09ICdmYWxzZScsICdtZWRpbnRha2UnXSA8LSBGQUxTRQ0KbV9kYXRhW3RvbG93ZXIobV9kYXRhJG1lZGludGFrZSkgPT0gJ3RydWUnLCAnbWVkaW50YWtlJ10gPC0gVFJVRQ0KZGF0YSA8LSBtZXJnZShkYXRhWywgIW5hbWVzKGRhdGEpICVpbiUgYygnaWQnKV0sIA0KZGF0YU1lZGludGFrZVssICFuYW1lcyhkYXRhTWVkaW50YWtlKSAlaW4lIGMoJ2lkJyldLA0KYnk9J2RhdGUnLCBhbGw9VFJVRSkNCn0NCn0gZWxzZSB7DQpkYXRhIDwtIGFsbGVyZ3lEYXRhKCdtZWRpbnRha2UnLCBjdXJyUmVwbykNCmlmKG5yb3coZGF0YSkgPiAwKXsNCmNvbG5hbWVzKGRhdGEpIDwtIGMoJ2RhdGUnLCAnaWQnLCAnbWVkaW50YWtlJykNCmRhdGEgPC0gZGF0YVssICFuYW1lcyhkYXRhKSAlaW4lIGMoJ2lkJyldDQptX2RhdGEgPC0gZGF0YQ0KfSBlbHNlIHsNCmRhdGEgPC0gZGF0YS5mcmFtZSgpDQp9DQp9DQp9IGVsc2Ugew0KZGF0YSA8LSBkYXRhLmZyYW1lKCkNCn0NCmRhdGENCn0NCg0KZGF0YSA8LSBhbGxBbGxlcmd5RGF0YSgnW1BJQV9VUkxdJywNCidbQVBQX0tFWV0nLA0KJ1tBUFBfU0VDUkVUXScpDQpkYXRhJGRhdGUgPC0gYXMuRGF0ZShkYXRhJGRhdGUpDQpteW1pbiA8LSBhcy5EYXRlKFN5cy5EYXRlKCktMTQsICclWS0lbS0lZCcpDQpteW1heCA8LSBhcy5EYXRlKFN5cy5EYXRlKCkrMiwgJyVZLSVtLSVkJykNCmRhdGVyYW5nZSA8LSBzZXEobXltaW4sIG15bWF4LCAnZGF5cycpDQpkYXRhIDwtIGRhdGFbZGF0YSRkYXRlICVpbiUgZGF0ZXJhbmdlLCBdDQppZihucm93KGRhdGEpID4gMCl7DQpkYXRhIDwtIGRhdGFbd2l0aChkYXRhLCBvcmRlcihkYXRlKSksXQ0KIyBkcmF3IGdyYXBoaWMNCnBhcihtYXI9Yyg1LCA0LCA3LjEsIDYpICsgMC4xKQ0KbV9kYXRhIDwtIGRhdGFbZGF0YSRtZWRpbnRha2UsIF0NCnBsb3QoeD1tX2RhdGEkZGF0ZSwgeT1hcy5pbnRlZ2VyKG1fZGF0YSRtZWRpbnRha2UpLA0KdHlwZT0naCcsIGNvbD0ncmVkJywgbHdkPTEwLCANCnlsaW09YygwLDEpLCB4bGltPWMobXltaW4sIG15bWF4KSwNCmF4ZXM9RkFMU0UsIHhsYWI9JycsIHlsYWI9JycpDQoNCnBhcihuZXc9VFJVRSkNCnBvbHMgPC0gdW5pcXVlKGRhdGEkcG9sbFR5cGUpDQpwbG90U3ltYm9scyA8LSBjKDE1LCA0LCAxNiwgMiwgMTgsIDgpWzE6bGVuZ3RoKHBvbHMpXQ0KbGluZVR5cGUgPC0gcmVwKDEsbGVuZ3RoKHBvbHMpKQ0KZGF0YV93aWRlIDwtIHNwcmVhZChkYXRhLCBwb2xsVHlwZSwgcG9sbGluYXRpb24pDQptYXRwbG90KHg9YXMuRGF0ZShkYXRhX3dpZGUkZGF0ZSksDQp5PWRhdGFfd2lkZVsscG9sc10sDQp0eXBlPSdiJywgbHR5PWxpbmVUeXBlLCBjZXg9MSwNCnBjaD1wbG90U3ltYm9scywgDQpjb2w9J2dyZWVuJywgDQp5bGltPWMoMCw0KSwgeGxpbT1jKG15bWluLCBteW1heCksDQpheGVzPUZBTFNFLCB4bGFiPScnLCB5bGFiPScnKQ0KDQptdGV4dCgnV2VydGUgdm9tIFBvbGxlbndhcm5kaWVuc3QnLCANCnNpZGU9NCwgY29sPSdncmVlbicsIGxpbmU9Mi41KQ0KYXhpcygxLCBhdD1kYXRlcmFuZ2UsIGxhYmVscz1kYXRlcmFuZ2UpDQpheGlzKDQsIHlsaW09YygwLDQpLCBsYXM9MSwgDQpjb2w9J2dyZWVuJywgY29sLmF4aXM9J2dyZWVuJykNCg0KcGFyKG5ldz1UUlVFLCB4cGQ9VFJVRSkNCmNvbkRhdCA8LSBkYXRhJGNvbmRpdGlvbg0KaWYobGVuZ3RoKGNvbkRhdCkgPiAwKSB7DQpwbG90KHg9ZGF0YSRkYXRlWyFpcy5uYShjb25EYXQpXSwgDQp5PWRhdGEkY29uZGl0aW9uWyFpcy5uYShjb25EYXQpXSwNCnR5cGU9J2InLCBwY2g9MTYsIGF4ZXM9RkFMU0UsDQp5bGltPWMoMSwxMCksIHhsaW09YyhteW1pbiwgbXltYXgpLA0KbWFpbj0nZWlnZW5lcyBCZWZpbmRlbiAmIGdlbWVzc2VuZSBQb2xsZW5iZWxhc3R1bmcnLA0KeGxhYj0nJywgeWxhYj0nZWlnZW5lcyBCZWZpbmRlbicpDQp9DQoNCmF4aXMoMiwgY29sPSdibGFjaycsY29sLmF4aXM9J2JsYWNrJyxsYXM9MSkNCmxlZ2VuZCgnYm90dG9tJywgaW5zZXQ9YygwLC0wLjg1KSwgLTEsIA0KYygnVGFnZSBtaXQgQW50aWFsbGVyZ2lrYSBFaW5uYWhtZScsIHBvbHMpLA0KbHdkID0gYygxMCwgcmVwKE5BLGxlbmd0aChwb2xzKSkpLCANCnBjaCA9IGMoTkEsIHBsb3RTeW1ib2xzKSwNCmNvbD1jKCdyZWQnLCByZXAoJ2dyZWVuJywgbGVuZ3RoKHBvbHMpKSksDQpuY29sPTIsYnR5ID0nbicpDQp9DQpgYGANCiINCmNvbnRlbnQgPC0ga25pdHI6OmtuaXQyaHRtbCh0ZXh0ID0gY29udGVudCwgZnJhZ21lbnQub25seSA9IFRSVUUpDQpjb250ZW50IDwtIHBhc3RlMCgiPGRpdj4iLCBjb250ZW50LCAiPC9kaXY+IikNCmNvbnRlbnQgPC0geHBhdGhBcHBseSh4bWxQYXJzZShjb250ZW50KSwgIi8vaW1nIiwgZnVuY3Rpb24oeCl7IHRtcCA8LSB4bWxBdHRycyh4KX0pDQpjb250ZW50IDwtIGNvbnRlbnRbWzFdXVsic3JjIl1bWzFdXQ0KY29udGVudCA8LSBwYXN0ZTAoJzxpbWcgc3JjPSInLCBjb250ZW50LCAnIiwgYWx0PSJncmFmaXNjaGUgWnVzYW1tZW5mYXNzdW5nIGRlciBsZXR6dGVuIDIgV29jaGVuIj4nKQ=="

repo_allergy <- 'eu.ownyourdata.allergy'
repo_condition <- paste0(repo_allergy, '.condition')
repo_medintake <- paste0(repo_allergy, '.medintake')
repo_pollination <- paste0(repo_allergy, '.pollination')

# Shiny Server ============================================
shinyServer(function(input, output, session) {
        output$upgradeLink <- renderText({
                renderUpgrade(session)
        })
        
# Allergy specific functions ==============================
        allergyRepo <- reactive({
                url <- input$allergy_url
                app_key <- input$allergy_app_key
                app_secret <- input$allergy_app_secret
                if(is.null(url) |
                   is.null(app_key) | 
                   is.null(app_secret)) {
                        vector()
                } else {
                        if((nchar(url) > 0) & 
                           (nchar(app_key) > 0) & 
                           (nchar(app_secret) > 0)) {
                                if(input$localAllergySave) {
                                        save(url, 
                                             app_key, 
                                             app_secret, 
                                             file='~/allergyCredentials.RData')
                                } else {
                                        # if (file.exists('~/allergyCredentials.RData'))
                                        #         file.remove('~/allergyCredentials.RData')
                                }
                                getRepo(url, app_key, app_secret)
                        } else {
                                vector()
                        }
                }
        })

        allergyData <- function(category){
                repo <- allergyRepo()
                if(length(repo) > 0) {
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], 
                                               '.',category))
                        piaData <- readItems(repo, url)
                } else {
                        piaData <- data.frame()
                }
                piaData
        }

        allAllergyData <- function(){
                p_data <- data.frame()
                m_data <- data.frame()
                c_data <- data.frame()
                data <- allergyData('pollination')
                if(nrow(data) > 0) {
                        colnames(data) <- c('date', 'pollType', 'pollPlz', 'id', 'pollination')
                        p_data <- data
                        dataCondition <- allergyData('condition')
                        if(nrow(dataCondition) > 0) {
                                colnames(dataCondition) <- c('date', 'id', 'condition')
                                c_data <- dataCondition
                                data <- merge(data[, !names(data) %in% c('id')], 
                                              dataCondition[, !names(dataCondition) %in% c('id')],
                                              by='date', all=TRUE)
                        }
                } else {
                        data <- allergyData('condition')
                        if(nrow(data) > 0){
                                colnames(data) <- c('date', 'id', 'condition')
                                c_data <- data
                        } else {
                                data <- data.frame()
                        }
                }
                if(nrow(data) > 0) {
                        dataMedintake <- allergyData('medintake')
                        if(nrow(dataMedintake) > 0) {
                                colnames(dataMedintake) <- c('date', 'id', 'medintake')
                                m_data <- dataMedintake
                                m_data[tolower(m_data$medintake) == 'false', 'medintake'] <- FALSE
                                m_data[tolower(m_data$medintake) == 'true', 'medintake'] <- TRUE
                                data <- merge(data[, !names(data) %in% c('id')], 
                                              dataMedintake[, !names(dataMedintake) %in% c('id')],
                                              by='date', all=TRUE)
                        }
                } else {
                        data <- allergyData('medintake')
                        if(nrow(data) > 0){
                                colnames(data) <- c('date', 'id', 'medintake')
                                data <- data[, !names(data) %in% c('id')]
                                m_data <- data
                        } else {
                                data <- data.frame()
                        }
                }
                data
        }
        
        plotData <- function(data){
                data$date <- as.Date(data$date)
                allergyMin <- min(data$date)
                allergyMax <- max(data$date)
                mymin <- as.Date(input$dateRange[1], "%Y-%m-%d")
                mymax <- as.Date(input$dateRange[2], "%Y-%m-%d")
                daterange <- seq(mymin, mymax, "days")
                data <- data[data$date %in% daterange, ]
                if(nrow(data) > 0) {
                        closeAlert(session, 'noDataAlert')
                        data <- data[with(data, order(date)),]
                        # draw graphic
                        par(mar=c(5, 4, 6.5, 6) + 0.1)
                        m_data <- data[data$medintake, ]
                        plot(x=m_data$date, y=as.integer(m_data$medintake),
                             type='h', col='red', lwd=10, 
                             ylim=c(0,1), xlim=c(mymin, mymax),
                             axes=FALSE, xlab='', ylab='')
                        
                        par(new=TRUE)
                        pols <- unique(data$pollType)
                        plotSymbols <- c(15, 4, 16, 2, 18, 8)[1:length(pols)]
                        lineType <- rep(1,length(pols))
                        data_wide <- spread(data, pollType, pollination)
                        matplot(x=as.Date(data_wide$date),
                                y=data_wide[,pols],
                                type='b', lty=lineType, cex=1,
                                pch=plotSymbols, 
                                col='green', 
                                ylim=c(0,4), xlim=c(mymin, mymax),
                                axes=FALSE, xlab='', ylab='')

                        mtext('Werte vom Pollenwarndienst', 
                              side=4, col='green', line=2.5)
                        axis(1, at=daterange, labels=daterange)
                        axis(4, ylim=c(0,4), las=1, 
                             col='green', col.axis='green')
                        
                        par(new=TRUE, xpd=TRUE)
                        conDat <- data$condition
                        if(length(conDat) > 0) {
                                plot(x=data$date[!is.na(conDat)], 
                                     y=data$condition[!is.na(conDat)],
                                     type='b', pch=16, axes=FALSE,
                                     ylim=c(1,10), xlim=c(mymin, mymax),
                                     main='eigenes Befinden & gemessene Pollenbelastung',
                                     xlab='', ylab='eigenes Befinden')
                        }
                        
                        axis(2, col='black',col.axis='black',las=1)
                        legend("bottom", inset=c(0,-0.7), -1, 
                               c("Tage mit Antiallergika Einnahme", pols),
                               lwd = c(10, rep(NA,length(pols))), 
                               pch = c(NA, plotSymbols),
                               col=c("red", rep("green", length(pols))),
                               ncol=2,bty ="n")
                } else {
                        createAlert(session, "noData", "noDataAlert", style="warning", title="Keine Daten im ausgewählten Zeitfenster",
                                    content=paste0("Passen sie links die Zeitauswahl an - es stehen Daten zwischen ", 
                                                   format(as.POSIXct(allergyMin, "%Y-%m-%d"), "%d.%m.%Y"), 
                                                   " und ", 
                                                   format(as.POSIXct(allergyMax, "%Y-%m-%d"), "%d.%m.%Y"), 
                                                   " zur Verfügung."))
                }
        }

        savedPia <- eventReactive(input$exportButton, {
                repo <- allergyRepo()
                date <- input$manDate
                
                # Pollination
                if(input$usePollination) {
                        pollination <- input$manPollination
                        pollType <- input$manAllergy
                        pollPlz <- input$manPlz
                        piaData <- allergyData('pollination')
                        existData <- piaData[piaData$date == date &
                                             piaData$pollType == pollType, ]
                        data <- list(date=date, 
                                     value=pollination, 
                                     pollType=pollType,
                                     pollPlz=pollPlz)
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], ".pollination"))
                        if (nrow(existData) > 0) {
                                updateRecord(repo, url, data, existData$id)
                        } else {
                                writeRecord(repo, url, data)
                        }
                }
                
                # Condition
                if(input$useCondition) {
                        condition   <- input$manCondition
                        piaData <- allergyData('condition')
                        existData <- piaData[piaData$date == date, ]
                        data <- list(date=date, 
                                     value=condition)
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], ".condition"))
                        if (nrow(existData) > 0) {
                                updateRecord(repo, url, data, existData$id)
                        } else {
                                writeRecord(repo, url, data)
                        }
                }
                
                # Medicine intake
                if(input$useMedintake) {
                        medintake <- as.numeric(input$manMedintake)
                        piaData <- allergyData('medintake')
                        existData <- piaData[piaData$date == date, ]
                        if(medintake == 1) {
                                data <- list(date=date, 
                                             value=TRUE)
                        } else {
                                data <- list(date=date, 
                                             value=FALSE)
                        }
                        url <- itemsUrl(repo[['url']], 
                                        paste0(repo[['app_key']], ".medintake"))
                        if (nrow(existData) > 0) {
                                updateRecord(repo, url, data, existData$id)
                        } else {
                                writeRecord(repo, url, data)
                        }
                }
                output$plot <- renderPlot(plotData(allAllergyData()))
                paste('<strong>zuletzt aktualisiert:</strong>',
                      format(Sys.time(), '%H:%M:%S'))
        })

        setPollConfig <- function(allergy, plz){
                updateSelectInput(session, 'allergy',
                                  selected=allergy)
                updateTextInput(session, 'plz',
                                value=plz)
                
        }       
        
        getPiaPollConfig <- function(repo){
                url <- itemsUrl(repo[['url']], 
                                schedulerKey())
                retVal <- readItems(repo, url)
                retVal <- retVal[retVal$repo == repo[['app_key']] & 
                                 retVal$task == 'Rscript', ]
                if(length(retVal) > 0 & 
                   nrow(retVal) > 0) {
                        list(id=retVal$id,
                             allergy=retVal$parameters$replace$allergy[1],
                             plz=retVal$parameters$replace$PLZ[1])
                } else {
                        vector()
                }
        }

        writePollConfig <- function(repo, pollConfig){
                replace = list(PLZ=pollConfig[['plz']], 
                               allergy=pollConfig[['allergy']])
                # heute
                r_script <- toString(script_pollenwarndienst)
                pollConfig_fields <- list(
                        date='Date.now',
                        value='Rscript.result(integer)',
                        pollType=pollConfig[['allergy']],
                        pollPlz=pollConfig[['plz']]
                )
                pollConfig_structure <- list(
                        repo=repo_pollination,
                        fields=pollConfig_fields
                )
                response_structure <- list(
                        pollConfig_structure
                )
                parameters <- list(
                        Rscript_base64=r_script,
                        replace=replace,
                        repo_url = repo[['url']],
                        repo_key = repo[['app_key']],
                        repo_secret = repo[['app_secret']],
                        response_structure=response_structure)
                config <- list(repo=repo[['app_key']],
                               time='0 7 * * *',
                               task='Rscript',
                               parameters=parameters)
                if(is.null(pollConfig[['id']])) {
                        writeRecord(repo,
                                    itemsUrl(repo[['url']], schedulerKey()), 
                                    config)
                } else {
                        updateRecord(repo,
                                     itemsUrl(repo[['url']], schedulerKey()),
                                     config,
                                     pollConfig[['id']])
                }
                
                # morgen
                r_script <- toString(script_pollenwarndienst1)
                pollConfig_fields <- list(
                        date='Date.now+1',
                        value='Rscript.result(integer)',
                        pollType=pollConfig[['allergy']],
                        pollPlz=pollConfig[['plz']]
                )
                pollConfig_structure <- list(
                        repo=repo_pollination,
                        fields=pollConfig_fields
                )
                response_structure <- list(
                        pollConfig_structure
                )
                parameters <- list(
                        Rscript_base64=r_script,
                        replace=replace,
                        repo_url = repo[['url']],
                        repo_key = repo[['app_key']],
                        repo_secret = repo[['app_secret']],
                        response_structure=response_structure)
                config <- list(repo=repo[['app_key']],
                               time='0 7 * * *',
                               task='Rscript',
                               parameters=parameters)
                if(is.null(pollConfig[['id']])) {
                        writeRecord(repo,
                                    itemsUrl(repo[['url']], schedulerKey()), 
                                    config)
                } else {
                        updateRecord(repo,
                                     itemsUrl(repo[['url']], schedulerKey()),
                                     config,
                                     pollConfig[['id']])
                }
                
                # übermorgen
                r_script <- toString(script_pollenwarndienst2)
                pollConfig_fields <- list(
                        date='Date.now+2',
                        value='Rscript.result(integer)',
                        pollType=pollConfig[['allergy']],
                        pollPlz=pollConfig[['plz']]
                )
                pollConfig_structure <- list(
                        repo=repo_pollination,
                        fields=pollConfig_fields
                )
                response_structure <- list(
                        pollConfig_structure
                )
                parameters <- list(
                        Rscript_base64=r_script,
                        replace=replace,
                        repo_url = repo[['url']],
                        repo_key = repo[['app_key']],
                        repo_secret = repo[['app_secret']],
                        response_structure=response_structure)
                config <- list(repo=repo[['app_key']],
                               time='0 7 * * *',
                               task='Rscript',
                               parameters=parameters)
                if(is.null(pollConfig[['id']])) {
                        writeRecord(repo,
                                    itemsUrl(repo[['url']], schedulerKey()), 
                                    config)
                } else {
                        updateRecord(repo,
                                     itemsUrl(repo[['url']], schedulerKey()),
                                     config,
                                     pollConfig[['id']])
                }
                
        }
        
        pollinationStatus <- reactive({
                repo <- allergyRepo()
                pollConfig <- getPiaPollConfig(repo)
                localAllergy <- input$allergy
                localPlz <- input$plz
                if (length(pollConfig) > 0) {
                        piaAllergy <- pollConfig[['allergy']]
                        piaPlz <-  pollConfig[['plz']]
                        if((piaAllergy == localAllergy) &
                           (piaPlz == localPlz)) {
                                'config in sync'
                        } else {
                                if (((nchar(localAllergy) == 0) | (localAllergy == 'auswählen...')) &
                                    ((nchar(localPlz) == 0) | (localPlz == ''))) {
                                        setPollConfig(piaAllergy, piaPlz)
                                        'config read'
                                } else {
                                        pollConfig <- list(allergy=localAllergy,
                                                           plz=localPlz,
                                                           id=pollConfig[['id']])
                                        writePollConfig(repo, pollConfig)
                                        'config updated'
                                }
                        }
                } else {
                        if ((localAllergy == 'auswählen...') | 
                            (localPlz == '')) {
                                'no config'
                        } else {
                                pollConfig <- list(allergy=localAllergy,
                                                   plz=localPlz)
                                writePollConfig(repo, pollConfig)
                                'config created'
                        }
                }
        })

# Allergy specific output fields ==========================
        output$plot <- renderPlot({
                input$exportButton
                if(first) {
                        internetAlert(session, 'https://www.ownyourdata.eu/apps/')
                        first <<- FALSE                  
                }
                repo <- allergyRepo()
                if (length(repo)>0) {
                        if (!is.na(repo[['token']])) {
                                closeAlert(session, 'noPIAAlert')
                                data <- allAllergyData()
                                if (nrow(data) > 0) {
                                        plotData(data)
                                }
                        }
                }
        })
        
        output$last_saved <- renderText({
                savedPia()
        })
        
        output$allergy_token <- renderText({
                repo <- allergyRepo()
                if (length(repo) == 0) {
                        '<strong>Token:</strong> nicht verfügbar'
                } else {
                        paste0('<strong>Token:</strong><br><small>', 
                               repo[['token']], '</small>')
                }
        })
        
        output$allergy_records <- renderText({
                data <- allAllergyData()
                paste('<strong>Datensätze:</strong>',
                      nrow(data))
        })
        
        output$pollination_status <- renderText({
                retVal <- pollinationStatus()
                paste('<strong>Status:</strong>',
                      switch(retVal,
                             'no config'      = 'automatische Datensammlung noch nicht konfiguriert',
                             'config read'    = 'automatische Datensammlung aus PIA gelesen',
                             'config created' = 'automatische Datensammlung erfolgreich konfiguriert',
                             'config updated' = 'Konfiguration der Datensammlung aktualisiert',
                             'config in sync' = 'automatische Datensammlung wird durchgeführt'))
        })

# Email reminders =========================================        
        getLocalEmailConfig <- reactive({
                validEmailConfig <- FALSE
                server <- input$mailer_address
                port <- input$mailer_port
                user <- input$mailer_user
                pwd <- input$mailer_password
                if((nchar(server) > 0) & 
                   (nchar(port) > 0) & 
                   (nchar(user) > 0) & 
                   (nchar(pwd) > 0)) {
                        validEmailConfig <- TRUE
                }
                c('valid'=validEmailConfig,
                  'server'=server,
                  'port'=port,
                  'user'=user,
                  'pwd'=pwd)
        })
        
        emailConfigStatus <- function(repo){
                localMailConfig <- getLocalEmailConfig()
                piaMailConfig <- getPiaEmailConfig(repo)
                if (localMailConfig[['valid']]) {
                        # is there already a config in PIA?
                        if (length(piaMailConfig) > 0) {
                                # is it different?
                                if((localMailConfig[['server']] == piaMailConfig[['server']]) &
                                   (localMailConfig[['port']] == piaMailConfig[['port']]) &
                                   (localMailConfig[['user']] == piaMailConfig[['user']]) &
                                   (localMailConfig[['pwd']] == piaMailConfig[['pwd']])) {
                                        'config in sync'
                                } else {
                                        updateEmailConfig(repo, 
                                                          localMailConfig, 
                                                          piaMailConfig[['id']])
                                        'config updated'
                                }
                        } else {
                                writeEmailConfig(repo, localMailConfig)
                                'config saved'
                        }
                } else {
                        # is there already a config in PIA?
                        if (length(piaMailConfig) > 0) {
                                setEmailConfig(session, piaMailConfig)
                                'config loaded' # Mailkonfiguration von PIA gelesen
                        } else {
                                'not configured' # keine Mailkonfiguration vorhanden
                        }
                }
        }
        
        emailReminderStatus <- reactive({
                repo <- allergyRepo()
                piaMailConfig <- getPiaEmailConfig(repo)
                piaSchedulerEmail <- getPiaSchedulerEmail(repo)
                piaEmail <- ''
                piaEmailId <- NA
                if (length(piaMailConfig) == 0) {
                        'no mail config'
                } else {
                        if (length(piaSchedulerEmail) > 0) {
                                piaEmail <- piaSchedulerEmail[['email']]
                                piaEmailId <-  piaSchedulerEmail[['id']]
                        }
                        localEmail <- as.character(input$email)
                        if(validEmail(localEmail)) {
                                if (localEmail == piaEmail) {
                                        'email in sync'
                                } else {
                                        condition_fields <- list(
                                                date='Date.now',
                                                value='line_1(Integer)'
                                        )
                                        condition_structure <- list(
                                                repo=repo_condition,
                                                fields=condition_fields
                                        )
                                        medintake_fields <- list(
                                                date='Date.now',
                                                value='line_2[FALSE](Boolean)'
                                        )
                                        medintake_structure <- list(
                                                repo=repo_medintake,
                                                fields=medintake_fields
                                        )
                                        response_structure <- list(
                                                condition_structure,
                                                medintake_structure
                                        )
                                        summaryPic_replace_structure <- list(
                                                PIA_URL=input$allergy_url,
                                                APP_KEY=input$allergy_app_key,
                                                APP_SECRET=input$allergy_app_secret
                                        )
                                        parameters_structure <- list(
                                                subject='Allergie-Tagebuch',
                                                summaryPic=script_summaryPic,
                                                summaryPic_replace=
                                                        summaryPic_replace_structure
                                        )
                                        if (piaEmail == '') {
                                                writeSchedulerEmail(
                                                        repo,
                                                        localEmail,
                                                        'pollen neu',
                                                        '0 8 * * *',
                                                        response_structure,
                                                        parameters_structure)
                                                'email saved'
                                        } else {
                                                updateSchedulerEmail(
                                                        repo,
                                                        localEmail,
                                                        'pollen neu',
                                                        '0 8 * * *',
                                                        response_structure,
                                                        parameters_structure,
                                                        piaEmailId)
                                                'email updated'
                                        }
                                }
                        } else {
                                if (nchar(localEmail) == 0) {
                                        if (piaEmail == '') {
                                                'missing email'
                                        } else {
                                                setSchedulerEmail(session, piaEmail)
                                                'email loaded'
                                        }
                                } else {
                                        'invalid email'
                                }
                        }
                }
                
        })
        
        output$mail_config <- renderText({
                repo <- allergyRepo()
                retVal <- emailConfigStatus(repo)
                switch(retVal,
                       'config in sync' = 'Benachrichtigungen via Email sind eingerichtet',
                       'not configured' = 'Benachrichtigungen via Email sind noch nicht konfiguiert',
                       'config saved'   = 'Emailkonfiguration in PIA gespeichert',
                       'config updated' = 'Emailkonfiguration in PIA aktualisiert',
                       'config loaded'  = 'Emailkonfiguration aus PIA geladen')
        })
        
        output$email_status <- renderText({
                retVal <- emailReminderStatus()
                paste('<strong>Status:</strong>',
                      switch(retVal,
                             'no mail config' = 'Emailkonfiguration noch nicht vorhanden',
                             'missing email'  = 'fehlende Emailadresse',
                             'invalid email'  = 'ungültige Emailadresse',
                             'email loaded'   = 'Emailadresse aus PIA geladen',
                             'email in sync'  = 'periodische Email-Benachrichtigungen werden versandt',
                             'email saved'    = 'Emailadresse in PIA gespeichert',
                             'email updated'  = 'Emailadresse in PIA aktualisiert'))
        })
})