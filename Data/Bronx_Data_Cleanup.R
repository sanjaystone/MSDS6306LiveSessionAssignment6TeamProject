
# Author: Benjamin Reddy
# Taken from pages 49-50 of O'Neil and Schutt
# Data found in the following website:
# http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page

#this requires the plyr package.  Install, if not yet added to your R library

install.packages("plyr")
library(plyr)

#raw data location
bronx.file <- "https://raw.githubusercontent.com/sanjaystone/MSDS6306LiveSessionAssignment6TeamProject/master/Data/rollingsales_bronx.csv"

# read csv file
bronx <- read.csv(bronx.file,skip=4,header=TRUE)

## Check the data
head(bronx)
summary(bronx)
#Compactly display the internal structure of an R object.
str(bronx) 



## clean/format the data with regular expressions
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.
bronx$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bronx$SALE.PRICE))
count(is.na(bronx$SALE.PRICE.N))

names(bronx) <- tolower(names(bronx)) # make all variable names lower case

## Get rid of leading digits
bronx$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bronx$gross.square.feet))
bronx$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bronx$land.square.feet))
bronx$year.built <- as.numeric(as.character(bronx$year.built))

## exploration to ensure sale prices are cleaned
attach(bronx)
hist(sale.price.n) 
detach(bronx)


## keep only the actual sales, removing data without sale price
bronx.sale <- bronx[bronx$sale.price.n!=0,]
plot(bronx.sale$gross.sqft,bronx.sale$sale.price.n)
plot(log10(bronx.sale$gross.sqft),log10(bronx.sale$sale.price.n))

## We will look at 1-, 2-, and 3-family homes
bronx.homes <- bronx.sale[which(grepl("FAMILY",bronx.sale$building.class.category)),]
dim(bronx.homes)

#logarithm base 10 plot of sq ft and sales price
plot(log10(bronx.homes$gross.sqft),log10(bronx.homes$sale.price.n))
#Summary of Bronx Homes with sale price less than $100,000
summary(bronx.homes[which(bronx.homes$sale.price.n<100000),])


## remove outliers that seem like they weren't actual sales
bronx.homes$outliers <- (log10(bronx.homes$sale.price.n) <=5) + 0
bronx.homes <- bronx.homes[which(bronx.homes$outliers==0),]
#logarithm plot of sale price v gross sq-ft
plot(log10(bronx.homes$gross.sqft),log10(bronx.homes$sale.price.n))
