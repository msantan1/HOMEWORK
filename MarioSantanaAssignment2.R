#' ---
# title: Assignment 2 script. 
# author: "Curtis Kephart"
# date: "Winter 2016"
# assignment: https://github.com/EconomiCurtis/econ294_2015/blob/master/Assignments/Econ_294_Assignment_2.pdf
# ---

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Question 0

MarioSantanaAssignment2 <- list(
  firstName = "Mario",
  lastName  = "Santana",
  email     = "msantan1@ucsc.edu",
  studentID = 1293498
)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Question 1
install.packages("repmis")
library("repmis")
source_data("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/diamonds.RData")

MarioSantanaAssignment2$s1a <- nrow(diamonds)
MarioSantanaAssignment2$s1b <- ncol(diamonds)
MarioSantanaAssignment2$s1c <- names(diamonds)
MarioSantanaAssignment2$s1d <- summary(diamonds$price)

# Question 2
DATA <- source_data("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt", sep = "\t")

MarioSantanaAssignment2$s2a <-  nrow(DATA)
MarioSantanaAssignment2$s2b <-  ncol(DATA)
MarioSantanaAssignment2$s2c <-  names(DATA)
MarioSantanaAssignment2$s2d <-  mean(DATA$weight)
MarioSantanaAssignment2$s2e <-  median(DATA$weight)

sum(is.na(DATA$weight))
'[0]'
sum(DATA$weight > 995)
'[536]'
DATA$weight = ifelse(DATA$weight >= 996, NA, DATA$weight )
sum(is.na(DATA$weight))
'[536]'

utils::str(hist(DATA$weight, col = "gray", labels = TRUE))

t <- table(DATA$weight)
names(t)[1] = 'weight'
t
't is a table weight column and Frequency column'

MarioSantanaAssignment2$s2f <-  mean(DATA$weight, na.rm = TRUE)
MarioSantanaAssignment2$s2g <-  median(DATA$weight, na.rm = TRUE)
MarioSantanaAssignment2$s2h <-  summary(DATA$weight[DATA$SEX == 1])
MarioSantanaAssignment2$s2i <-  summary(DATA$weight[DATA$SEX == 2])

# Question 3

vec <- c(letters,LETTERS)
paste(vec[c(39,1,18)], collapse="")

MarioSantanaAssignment2$s3a <-  vec[1:26*2]
MarioSantanaAssignment2$s3b <-  paste(vec[c(39,1,18)], collapse="")

arr <- array( c(letters,LETTERS), dim = c(3,3,3))

paste(arr[1,2,2],arr[1,1,1],arr[3,3,2], sep = "")

MarioSantanaAssignment2$s3c <-  arr[,1,2]
MarioSantanaAssignment2$s3d <-  arr[2,2,]
MarioSantanaAssignment2$s3e <-  paste(arr[1,2,2],arr[1,1,1],arr[3,3,2], sep = "")
