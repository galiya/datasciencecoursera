#The American Community Survey distributes downloadable data about United States #communities. Download the 2006 microdata survey about housing for the state of #Idaho using download.file() from here: 
    
#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

#and load the data into R. The code book, describing the variable names is here: 
    
#3    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

setwd("/Users//galiya/Projects//datasciencecoursera/getdata-011/")
if (!file.exists("data")){
    dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/IdahoStateCommunity.csv", method = "curl")
dateDownloaded <- date()

quiz1_1 <- read.table("./data/IdahoStateCommunity.csv", sep = ",", header = TRUE)
head(quiz1_1)

#How many properties are worth $1,000,000 or more?
length(which(quiz1_1$VAL == 24))
#53

#Download the Excel spreadsheet on Natural Gas Aquisition Program here: 

#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 

#Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#    dat 
#What is the value of:
#    sum(dat$Zip*dat$Ext,na.rm=T) 
#(original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/NaturalGas.xlsx", method = "curl")

#install.packages("xlsx")
library(xlsx)

rows <- 18:23 
columns <- 7:15

dat <- read.xlsx("./data/NaturalGas.xlsx", sheetIndex = 1, header = TRUE, colIndex = columns, rowIndex = rows)
sum(dat$Zip*dat$Ext,na.rm=T) 
#36534720

#Read the XML data on Baltimore restaurants from here: 
#install.packages("XML")    
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)

#How many restaurants have zipcode 21231?
length(which(xpathSApply(rootNode, "//zipcode", xmlValue) == 21231))
#127

#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
    
#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 

#using the fread() command load the data into an R object
#DT 
#Which of the following is the fastest way to calculate the average value of the variable
#pwgtp15 
#broken down by sex using the data.table package?
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/IdahoStateCommunity2006.csv", method = "curl")
dateDownloaded <- date()

DT <- read.table("./data/IdahoStateCommunity2006.csv", sep = ",", header = TRUE)
mean(DT$pwgtp15, by=DT$SEX)
tapply(DT$pwgtp15, DT$SEX, mean)
sapply(split(DT$pwgtp15, DT$SEX), mean)
