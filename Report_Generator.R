# Run this script to generate all the country PDF reports and load them into the 
# read folder of the shinyTCMN app
##################################
# setwd() to handle images and other files
setwd('/Users/asanchez3/Desktop/Work/reportGenerator360/')
source('generic_functions.R') # data and functions needed
source('helper_functions.R') # charts and table functions needed
# Create the data reports --------------------------------------
#for (c in c("Sint Maarten (Dutch part)")){
#for (c in c("Antigua and Barbuda")) {
#for (c in c("Channel Islands")) {
exclude <- c("Channel Islands","Virgin Islands (U.S.)","Northern Mariana Islands",
             "Marshall Islands","Greenland","Gibraltar","Cayman Islands","British Virgin Islands",
             "St. Martin (French part)","Sint Maarten (Dutch part)")
processed <- c()
#for (c in filter(countries, !(name %in% exclude))$name) {
for (c in c("Japan")) {
  if (!(substr(c,1,1)=="(") & !(filter(countries, name==c)$iso3=="")){
    iso3 <- .getCountryCode(c)
    knit2pdf('PDF_LaTeX.Rnw', clean = TRUE,
             encoding = "UTF-8",
             output = paste0("sampleReport_",iso3,".tex"))
    # copy file to pdf directory
    file.copy(paste0("sampleReport_",iso3,".pdf"), "/Users/asanchez3/Desktop/Work/reportGenerator360/final_pdf/",overwrite=TRUE)
    file.remove(paste0("/Users/asanchez3/Desktop/Work/reportGenerator360/","sampleReport_",iso3,".pdf"))
    file.remove(paste0("/Users/asanchez3/Desktop/Work/reportGenerator360/","sampleReport_",iso3,".tex"))
    processed <- c(processed,c)
  }
}
