# part(0) #
first_name <- "Mario"
last_name <- "Santana"
ID <- 1293498
# Printing each object individually
print(first_name)
print(last_name)
print(ID)
# Print all 3 objects together
print(paste(first_name,last_name,ID))

# part(1) #
df.dta <- read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta")
#I couldn't get these to work two forms to work so I downloaded the files and loaded them manually
#df.csv <- read.csv("https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/NHIS_2007_CSV.csv")
#df.td <- read.table("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt")
df.csv <- read.csv("~/Desktop/R_Lab/HW1/NHIS_2007_CSV.csv")
df.td <- read.table("~/Desktop/R_Lab/HW1/NHIS_2007_TSV.txt")
load("~/Desktop/R_Lab/HW1/NHIS_2007_RData.RData")
#The name of the RData is 'NHIS_2007_RData'

# part(2) #
# df.dta is 197 KB
# df.csv is 143 KB
# df.td is 143 KB
# NHIS_2007_RDATA is 49 KB

# part(3) #
typeof(NHIS_2007_RData)
# the type of storage mode for the data set NHIS_2007_RData is "list"
class(NHIS_2007_RData)
# the class for the data set NHIS_2007_RData is "data.frame"
summary(NHIS_2007_RData)
# HHX             FMX             FPX             SEX       
# Min.   :   16   Min.   :1.000   Min.   :1.000   Min.   :1.000  
# 1st Qu.:13404   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000  
# Median :27527   Median :1.000   Median :1.000   Median :2.000  
# Mean   :27009   Mean   :1.019   Mean   :1.359   Mean   :1.549  
# 3rd Qu.:40192   3rd Qu.:1.000   3rd Qu.:2.000   3rd Qu.:2.000  
# Max.   :53955   Max.   :6.000   Max.   :8.000   Max.   :2.000  
# BMI            SLEEP             educ           height     
# Min.   :12.91   Min.   : 3.000   Min.   : 0.00   Min.   :59.00  
# 1st Qu.:23.63   1st Qu.: 6.000   1st Qu.:12.00   1st Qu.:64.00  
# Median :26.97   Median : 7.000   Median :13.00   Median :67.00  
# Mean   :31.73   Mean   : 9.507   Mean   :14.25   Mean   :69.58  
# 3rd Qu.:31.51   3rd Qu.: 8.000   3rd Qu.:16.00   3rd Qu.:71.00  
# Max.   :99.99   Max.   :99.000   Max.   :99.00   Max.   :99.00  
# weight     
# Min.   :100.0  
# 1st Qu.:149.0  
# Median :175.0  
# Mean   :266.2  
# 3rd Qu.:215.0  
# Max.   :999.0 
length(NHIS_2007_RData)
# the length of the vectores in the data set NHIS_2007_RData is 9
nrow(NHIS_2007_RData)
# the number of rows in the data set NHIS_2007_RData is 4785
ncol(NHIS_2007_RData)
# the number of columns in the data set NHIS_2007_RData is 9
dim(NHIS_2007_RData)
# the dimensions of the data set is 4785 by 9

# part 4) #
df<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")
str(df)
# 'data.frame':	1119754 obs. of  30 variables:
summary(df$rw)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
# 1.8    10.7    15.9    19.8    24.4   354.8  521279 

# part 5) #
v = c(1,2,3,4,5,6,7,4,NULL,NA)
length(v)
# the length of vector v is 9
" the reason why the reported lenght is different from the 
actual length is because the NULL is excluded from the 
count. NULL is ignored where as NA is counted but the 
the value is observed as missing."
mean(v, na.rm = TRUE)
# the mean of the vectore v is 4

# part 6) #
x <- matrix( c(1,4,7,2,5,8,3,6,9), ncol=3, nrow=3)
print(x)
t(x)
eigen(x)
y <- matrix( c(1,3,2,2,2,3,3,1,0), ncol=3, nrow=3)
print(y)
# Inverse
solve(y)
# Similarly
ginv(y)
# Check
solve(y)%*%y
ginv(y)%*%y
# This new matrix is called the Identity matrix

# part 7) #
carat <- c(5,2,0.5,1.5,5,NA,3)
cut <- c("fair","good","very good","good","fair","Ideal","fair")  
clarity <- c("SI1","I1","VI1","VS1","IF","VVS2",NA)
price <- c(850,450,450,0,750,980,420)
diamonds <- data.frame(carat,cut,clarity,price)
mean(diamonds$price)
# The mean price of the diamonds is $557.1429
aggregate(diamonds$price, list(diamonds$cut), FUN=mean)
# The mean price for diamonds with a fair cut is $673.3333
# The mean price for diamonds with a good is $225.0000
# The mean price for diamonds with a Ideal is $980.0000
# The mean price for diamonds with a very good is $450.0000

carat_2 <- subset(diamonds, (carat > 2 | cut == "Ideal" | cut == "very good"))
print(carat_2)
mean(carat_2$price)
# The mean price for diamonds with carats > 2 or cut = "Ideal" or cut = "very good" is 690

carat__2 <- subset(diamonds, carat > 2, cut == "Ideal" | cut == "very good")
print(carat__2)
mean(carat__2$price)
# The mean price for diamonds with carats > 2 and (cut = "Ideal" or cut = "very good") does not exist
#     since there is no diamonds with these characteristics