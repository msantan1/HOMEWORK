#' ---
# title: Assignment 2 script. 
# author: "Curtis Kephart"
# date: "Winter 2016"
# assignment: https://github.com/EconomiCurtis/econ294_2015/blob/master/Assignments/Econ_294_Assignment_2.pdf
# ---

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

# Problem 1 #
library(repmis)
df.flights <- source_data(
  "https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/flights.csv", sep = ",", stringsAsFactors = TRUE 
)

df.planes <- source_data(
  "https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/planes.csv", sep = ",", stringsAsFactors = TRUE
)

df.weather <- source_data(
  "https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/weather.csv", sep = ",", stringsAsFactors = TRUE
)

df.airports <- source_data(
  "https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/airports.csv", sep = ",", stringsAsFactors = TRUE
)

class(df.flights)
class(df.planes)
class(df.weather)
class(df.airports)

# Problem 2 #
class(df.flights$date)
# "character" #
df.flights$date <- as.Date(df.flights$date)
class(df.weather$date)
# "Date" #

class(df.weather$date)
# "character" #
df.weather$date <- as.Date(df.weather$date)
class(df.weather$date)
# "Date" #

# Problem 3 #
unique(df.flights$dest)
# SFO AND OAK
flights.2a <- subset(df.flights, dest == "SFO" | dest == "OAK")
print(nrow(flights.2a))

summary(df.flights)
# dep_delay
flights.2b <- subset(df.flights, dep_delay >= 60)
print(nrow(flights.2b))

# dep_delay and arr_delay
flights.2c<-subset(df.flights, arr_delay > dep_delay*2)
print(nrow(flights.2c))

# Problem 4 #
library(dplyr)
# since they both end with delay we cannot use the starts_with()
dplyr::select(df.flights, ends_with("delay"))
dplyr::select(df.flights, contains("delay"))
dplyr::select(df.flights, matches("delay"))
dplyr::select(df.flights, dep_delay, arr_delay)

# Problem 5 #
# part a) #


# Problem 6 #
df.flights <-  df.flights %>% 
  mutate(speed = dist / (time/60) )

df.flights <-  df.flights %>% 
  mutate(delta = dep_delay-arr_delay)

# part a) #
df.flights <- df.flights %>%
  arrange(desc(speed))
head(df.flights$speed, n=5)

# part b) #
df.flights <- df.flights %>%
        arrange(desc(delta))
head(df.flights$speed, n=5)

# part a) #
df.flights <- df.flights %>%
  arrange((delta))
head(df.flights$speed, n=5)

# Problem 7 #
flights.7a <- df.flights%>%
  group_by(carrier) %>%
  summarise(ttl.cn = sum(cancelled),
            ttl.fl = n(),
            prcnt.cn = ttl.cn/ttl.fl,
            m.delta = min(delta, na.rm=T), 
            frt.quant = quantile(delta,prob=c(0.25),na.rm=T),
            md.delta = median(delta,na.rm=T),
            mn.delta = mean(delta,na.rm=T),
            trd.quant = quantile(delta,prob=c(0.75),na.rm=T),
            mx.delta = max(delta,na.rm=T)
            )

flights.7a <- flights.7a %>%
  arrange(desc(prcnt.cn))
          
print(flights.7a)


day_delay <- dplyr::filter(
  summarize(
    group_by(
      dplyr::filter(
        df.flights,
        !is.na(dep_delay)
      ),
      date
    ),
    delay = mean(dep_delay),
    n = n()
  ),
  n > 10
) 

cat("we are getting the total number and the 
    the mean dep_delay of flights for each day")

# Problem 8 #
day_delay <- day_delay %>%
          arrange((date))

day_delay$lag <- lag(day_delay$delay, n =1L)

day_delay <- day_delay %>%
  arrange(desc(lag))

head(day_delay$lag, n=5)
