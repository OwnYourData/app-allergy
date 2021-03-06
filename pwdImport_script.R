library(RCurl)
library(XML)
library(httr)
pollenListAT<-c('Zypressengewächse (Cupressaceae)','Erle (Alnus)','Hasel (Corylus)','Esche (Fraxinus)','Birke (Betula)','Platane (Platanus)','Gräser (Poaceae)','Roggen (Secale)','Nessel- und Glaskraut (Urticaceae)','Ölbaum (Olea)','Beifuß (Artemisia)','Ragweed (Ambrosia)','Pilzsporen (Alternaria)')
pollenListDE<-c('Erle (Alnus)','Hasel (Corylus)','Esche (Fraxinus)','Birke (Betula)','Gräser (Poaceae)','Roggen (Secale)','Beifuß (Artemisia)','Ragweed (Ambrosia)')
pollenListCH<-c('alder (Alnus)','hazel (Corylus)','ash (Fraxinus)','birch (Betula)','Plane tree (Platanus)','Beech (Fagus)','Oak (Quercus)','grasses (Poaceae)','mugwort (Artemisia)','ragweed (Ambrosia)')
defaultHeaders<-function(token){
c('Accept'='*/*','Content-Type'='application/json','Authorization'=paste('Bearer',token))}
itemsUrl<-function(url,repo_name){
paste0(url,'/api/repos/',repo_name,'/items')}
getToken<-function(pia_url,app_key,app_secret){
auth_url<-paste0(pia_url,'/oauth/token')
optTimeout<-RCurl::curlOptions(connecttimeout=10)
response<-tryCatch(
RCurl::postForm(auth_url,client_id=app_key,client_secret=app_secret,grant_type='client_credentials',.opts=optTimeout),
error=function(e){return(NA)})
if(is.na(response)){
return(NA)
}else{
if(jsonlite::validate(response[1])){
return(rjson::fromJSON(response[1])$access_token)
}else{
return(NA)}}}
setupApp<-function(pia_url,app_key,app_secret){
app_token<-getToken(pia_url,app_key,app_secret)
if(is.na(app_token)){
vector()
}else{
c('url'=pia_url,'app_key'=app_key,'app_secret'=app_secret,'token'=app_token)}}
r2d<-function(response){
if(is.na(response)){
data.frame()
}else{
if(nchar(response)>0){
retVal<-rjson::fromJSON(response)
if(length(retVal)==0){
data.frame()
}else{
if('error'%in%names(retVal)){
data.frame()
}else{
if(!is.null(retVal$message)){
if(retVal$message=='error.accessDenied'){
data.frame()
}else{
do.call(rbind,lapply(retVal,data.frame))}
}else{
do.call(rbind,lapply(retVal,data.frame))}}}
}else{
data.frame()}}}
readItems<-function(app,repo_url){
if(length(app)==0){
data.frame()
return()}
headers<-defaultHeaders(app[['token']])
url_data<-paste0(repo_url,'?size=2000')
header<-RCurl::basicHeaderGatherer()
doc<-tryCatch(
RCurl::getURI(url_data,.opts=list(httpheader=headers),headerfunction=header$update),
error=function(e){return(NA)})
response<-NA
respData<-data.frame()
if(!is.na(doc)){
recs<-tryCatch(
as.integer(header$value()[['X-Total-Count']]),
error=function(e){return(0)})
if(recs>2000){
for(page in 0:floor(recs/2000)){
url_data<-paste0(repo_url,
'?page=',page,
'&size=2000')
response<-tryCatch(
RCurl::getURL(url_data,
.opts=list(httpheader=headers)),
error=function(e){return(NA)})
subData<-r2d(response)
if(nrow(respData)>0){
respData<-rbind(respData,subData)
}else{
respData<-subData}}
}else{
response<-tryCatch(
RCurl::getURL(url_data,.opts=list(httpheader=headers)),
error=function(e){return(NA)})
respData<-r2d(response)}}
respData}
writeItem<-function(app,repo_url,item){
headers<-defaultHeaders(app[['token']])
data<-rjson::toJSON(item)
response<-tryCatch(
RCurl::postForm(repo_url,.opts=list(httpheader=headers,postfields=data)),
error=function(e){
return(NA)})
response}
updateItem<-function(app,repo_url,item,id){
headers<-defaultHeaders(app[['token']])
item<-c(item,c(id=as.numeric(id)))
data<-rjson::toJSON(item)
response<-tryCatch(
RCurl::postForm(repo_url,.opts=list(httpheader=headers,postfields=data)),
error=function(e){return(NA)})
response}
deleteItem<-function(app,repo_url,id){
headers<-defaultHeaders(app[['token']])
item_url<-paste0(repo_url,'/',id)
response<-tryCatch(
httr::DELETE(item_url,httr::add_headers(headers)),
error=function(e){
return(NA)})
response}
plz<-'[plz]'
country<-'[country]'
repoName<-'[repo_name]'
pia_url<-'[pia_url]'
app_key<-'[app_key]'
app_secret<-'[app_secret]'
app<-setupApp(pia_url,app_key,app_secret)
url<-itemsUrl(pia_url,paste0('eu.ownyourdata.allergy.pollination_',switch(country,'Österreich'='A','Deutschland'='D','Schweiz'='CH'),'-',plz))
allItems<-readItems(app,url)
rm<-allItems[as.numeric(allItems$timestamp)>as.numeric(Sys.time()),]
lapply(rm$id,function(x)deleteItem(app,url,x))
if(country=='Österreich'){webpage<-getURL(paste0('https://www.polleninfo.org/AT/de/prognose/3-tages-prognose.html?tx_scload_load%5B__referrer%5D%5B%40extension%5D=ScLoad&tx_scload_load%5B__referrer%5D%5B%40vendor%5D=Screencode&tx_scload_load%5B__referrer%5D%5B%40controller%5D=Load&tx_scload_load%5B__referrer%5D%5B%40action%5D=startpagesearchform&tx_scload_load%5B__referrer%5D%5Barguments%5D=YTowOnt931f91268ac9faaadcce4fa5ba74b5e8759ba6f42&tx_scload_load%5B__referrer%5D%5B%40request%5D=a%3A4%3A%7Bs%3A10%3A%22%40extension%22%3Bs%3A6%3A%22ScLoad%22%3Bs%3A11%3A%22%40controller%22%3Bs%3A4%3A%22Load%22%3Bs%3A7%3A%22%40action%22%3Bs%3A19%3A%22startpagesearchform%22%3Bs%3A7%3A%22%40vendor%22%3Bs%3A10%3A%22Screencode%22%3B%7Db59e46bfea0c592a055e15c7d7da9ee1687a0e5a&tx_scload_load%5B__trustedProperties%5D=a%3A2%3A%7Bs%3A3%3A%22zip%22%3Bi%3A1%3Bs%3A4%3A%22city%22%3Bi%3A1%3B%7D6b8fc83a8d914cb886de83aad1219b2fee8bf357&tx_scload_load%5Bzip%5D=',plz,'&tx_scload_load%5Bcity%5D=#breadcrumb'))}
if(country=='Deutschland'){webpage<-getURL(paste0('https://www.polleninfo.org/DE/de/prognose/3-tages-prognose.html?tx_scload_load%5B__referrer%5D%5B%40extension%5D=ScLoad&tx_scload_load%5B__referrer%5D%5B%40vendor%5D=Screencode&tx_scload_load%5B__referrer%5D%5B%40controller%5D=Load&tx_scload_load%5B__referrer%5D%5B%40action%5D=startpagesearchform&tx_scload_load%5B__referrer%5D%5Barguments%5D=YTowOnt931f91268ac9faaadcce4fa5ba74b5e8759ba6f42&tx_scload_load%5B__referrer%5D%5B%40request%5D=a%3A4%3A%7Bs%3A10%3A%22%40extension%22%3Bs%3A6%3A%22ScLoad%22%3Bs%3A11%3A%22%40controller%22%3Bs%3A4%3A%22Load%22%3Bs%3A7%3A%22%40action%22%3Bs%3A19%3A%22startpagesearchform%22%3Bs%3A7%3A%22%40vendor%22%3Bs%3A10%3A%22Screencode%22%3B%7Db59e46bfea0c592a055e15c7d7da9ee1687a0e5a&tx_scload_load%5B__trustedProperties%5D=a%3A2%3A%7Bs%3A3%3A%22zip%22%3Bi%3A1%3Bs%3A4%3A%22city%22%3Bi%3A1%3B%7D6b8fc83a8d914cb886de83aad1219b2fee8bf357&tx_scload_load%5Bzip%5D=',plz,'&tx_scload_load%5Bcity%5D=#breadcrumb'))}
if(country=='Schweiz'){webpage<-getURL(paste0('https://www.polleninfo.org/CH/en/prognosis/pollen-load.html?tx_scload_load%5B__referrer%5D%5B%40extension%5D=ScLoad&tx_scload_load%5B__referrer%5D%5B%40vendor%5D=Screencode&tx_scload_load%5B__referrer%5D%5B%40controller%5D=Load&tx_scload_load%5B__referrer%5D%5B%40action%5D=load&tx_scload_load%5B__referrer%5D%5Barguments%5D=YToyOntzOjM6InppcCI7czo0OiI3MjAxIjtzOjQ6ImNpdHkiO3M6MDoiIjt9fa9edbc6de03ddd75385f8af571454ef71c68649&tx_scload_load%5B__referrer%5D%5B%40request%5D=a%3A4%3A%7Bs%3A10%3A%22%40extension%22%3Bs%3A6%3A%22ScLoad%22%3Bs%3A11%3A%22%40controller%22%3Bs%3A4%3A%22Load%22%3Bs%3A7%3A%22%40action%22%3Bs%3A4%3A%22load%22%3Bs%3A7%3A%22%40vendor%22%3Bs%3A10%3A%22Screencode%22%3B%7D4f2c15ba3615707dd0a4bef151f1fd8f14c36921&tx_scload_load%5B__trustedProperties%5D=a%3A2%3A%7Bs%3A3%3A%22zip%22%3Bi%3A1%3Bs%3A4%3A%22city%22%3Bi%3A1%3B%7D6b8fc83a8d914cb886de83aad1219b2fee8bf357&tx_scload_load%5Bzip%5D=&tx_scload_load%5Bcity%5D=',plz,'#breadcrumb'))}
webpage<-readLines(tc<-textConnection(webpage));close(tc)
pagetree<-htmlTreeParse(webpage,useInternalNodes=TRUE)
pollenList<-switch(country,'Österreich'=pollenListAT,'Deutschland'=pollenListDE,'Schweiz'=pollenListCH)
lapply(pollenList,function(x){
xPathStr<-paste0("//h3[@class='polltitle'andcontains(text(),'",x,"')]/..//span[@class='invisible']")
for(i in 1:3){
belastung<-tolower(trimws(xpathSApply(pagetree,xPathStr,xmlValue)[i]))
result<-switch(belastung,'keine belastung'=0,'no allergy risk'=0,'niedrig'=1,'low'=1,'mittel'=2,'moderate'=2,'hoch'=3,'high'=3,'sehr hoch'=4,'very high'=4,{-1})
if(result>0){
if(i==1){
record<-list(timestamp=as.numeric(Sys.time()),pollType=x,value=result,'_oydRepoName'=repoName)
}else{
myDat<-xpathSApply(pagetree,paste0("//h3[@class='polltitle'andcontains(text(),'",x,"')]/..//div[@class='date']"),xmlValue)[i]
myDat<-sub('Jänner','January',myDat)
myDat<-sub('Februar','February',myDat)
myDat<-sub('März','March',myDat)
myDat<-sub('Mai','May',myDat)
myDat<-sub('Juni','June',myDat)
myDat<-sub('Juli','July',myDat)
myDat<-sub('Oktober','October',myDat)
myDat<-sub('Dezember','December',myDat)
ts<-as.POSIXct(paste(as.Date(gsub('.*,(.*)','\\1',myDat),'%d. %B'),"12:00"))
record<-list(timestamp=as.numeric(ts),pollType=x,value=result,'_oydRepoName'=repoName)}
writeItem(app,url,record)}}})
