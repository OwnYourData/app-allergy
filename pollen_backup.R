# read Pollen
pia_url <- 'https://anni.datentresor.org'
app_key <- 'eu.ownyourdata.allergy'
app_secret <- 'fS3WryVY1MlXGNfXraik'
app <- setupApp(pia_url, app_key, app_secret)
url <- itemsUrl(pia_url, 'eu.ownyourdata.allergy.pollination_A-2540')
pollen <- readItems(app, url)
save(pollen, file='backupPollen-A_2540.RData')

# write Pollen
pia_url <- 'https://anni.datentresor.org'
app_key <- 'eu.ownyourdata.allergy'
app_secret <- 'gLq7EwPnphFQWb6cieGy'
app <- setupApp(pia_url, app_key, app_secret)
url <- itemsUrl(pia_url, 'eu.ownyourdata.allergy.pollination_A-2540')
for(i in 1:nrow(pollen)){
        url <- itemsUrl(pia_url, 'eu.ownyourdata.allergy.pollination_A-2540')
        data <- list(
                timestamp = pollen[i, 'timestamp'],
                value = pollen[i, 'value'],
                pollType = pollen[i, 'pollType']
        )
        writeItem(app, url, data)
}
