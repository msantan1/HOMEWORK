#' Curtis Kephart
#' Winter 2016
#' 


# Problem 0 #
print("Mario Santana")
print(1293498)
print("msantan1@ucsc.edu")

# Problem 1 #
library(foreign)
df.ex <- read.dta(
  "https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta"
)
#loaded this way, it's a data frae
class(df.ex)

# Problem 2 #
library(dplyr)
df.ex.2a <- df.ex %>%
  dplyr::filter(
    year == 2013 & month == 12
  )
print(nrow(df.ex.2a))

df.ex.2b <- df.ex %>%
  dplyr::filter(
    year == 2013 & (month == 7 | month == 8 | month == 9)
  )
print(nrow(df.ex.2b))

# Problem 3 #
df.ex.3a <- 
  df.ex %>%
  dplyr::arrange(
    year, 
    month
  )

# Problem 4 #
df.ex.4a <- 
  select(df.ex, 
         year, 
         age
  )

df.ex.4b <- 
  select(df.ex, 
         year, 
         month,
         starts_with("i")
  )
# Problem 5 #
stndz <- function(x){
  (x - mean(x, na.rm = T))  /  sd(x, na.rm = T)
}

nrmlz <- function(x){
  (x - min(x, na.rm = T)) / (max(x, na.rm = T) - min(x, na.rm = T))
}

df.ex.5a <- df.ex %>%
  dplyr::mutate(
    rw.stndz = stndz(rw),
    rw.nrmlz = nrmlz(rw),
  )

df.ex.5a <- select(df.ex.5a,
                   rw.stndz, 
                   rw.nrmlz
)

df.ex.5b <- df.ex %>%
  dplyr::group_by(year, month) %>%
  dplyr::mutate(
    rw.stndz = stndz(rw),
    rw.nrmlz = nrmlz(rw),
    count    = n()
  )

df.ex.5b <- select(df.ex.5b,
                   rw.stndz, 
                   rw.nrmlz,
                   count
)
# Problem 6 #
df.ex.6 <- df.ex %>%
  dplyr::group_by(year, month, state) %>%
  dplyr::summarise(
    rw.min = min(rw, na.rm = T),
    rw.1stq = quantile(rw, 0.25, na.rm = T),
    rw.mean = mean(rw, na.rm = T),
    rw.median = median(rw, na.rm = T),
    rw.3rdq = quantile(rw, 0.75, na.rm = T),
    rw.max = max(rw, na.rm = T),
    count = n()
  )

print(nrow(df.ex.6))

summary(df.ex.6$rw.mean)
'40.63'

max.rw.mean <- max(df.ex.6$rw.mean)

Highest_Mean_Range <- df.ex.6 %>% 
  select(year, month, state, rw.mean) %>%
  filter( rw.mean == max.rw.mean)

print(Highest_Mean_Range)


