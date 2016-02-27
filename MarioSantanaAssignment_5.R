print("Mario Santana")
print(1293498)
print("msantan1@ucsc.edu")

install.packages("ggplot2")
library(ggplot2)
diamonds <- diamonds

diamonds$lprice <- log(diamonds$price)
diamonds$x_y_z <- diamonds$x*diamonds$y*diamonds$z
#qplot(x_y_z, price, data = diamonds, size = carat, colour = clarity, scale_x_log10(x_y_z), scale_y_log10(price))

#############
# Problem 1 #
#############

# part a #
##########
p <- ggplot(data = diamonds, aes(x_y_z, price, colour = clarity, size = carat)) + 
  geom_point(alpha = (1/2))

p + scale_size(range = c(4, 10)) + 
  scale_x_log10() + scale_y_log10()

# part b #
##########
q <- ggplot(diamonds, aes(carat, ..density.., fill = clarity)) +  
  geom_histogram(binwidth = .2)

q + facet_grid(cut ~ .)

# part c #
##########
r <- ggplot(diamonds, aes(cut, price)) + 
  geom_jitter(shape=1, alpha = .1)

r + geom_violin(alpha = .1)

#############
# Problem 2 #
#############

# part a #
##########
library(foreign)
org_example <- read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")

library(ggplot2)
library(dplyr)

new_org_example <- org_example %>% 
  mutate(
    date = paste(year, month,"01",sep="-"),
    date = as.Date(date,format = "%Y-%m-%d")
  ) %>%
  group_by(date) %>%
  summarise(
    Median.RW = median(rw, na.rm=T),
    frst_quant =quantile(rw, c(0.25), na.rm=T),
    thrd_quant = quantile(rw, c(0.75), na.rm=T),
    frst_dcl = quantile(rw, c(0.1), na.rm=T),
    nnth_dcl = quantile(rw, c(0.9), na.rm=T)
  )

s <- ggplot(new_org_example, aes(x = date, y = Median.RW) )

s + geom_line(alpha = 1) +
  geom_ribbon(ymin = new_org_example$frst_quant, ymax = new_org_example$thrd_quant, alpha = .7) +
  geom_ribbon(ymin = new_org_example$frst_dcl, ymax = new_org_example$nnth_dcl, alpha = .2) +
  ylim(0,50)

# part b #
##########
new_org_example2 <- org_example %>%
  mutate(
    date = paste(year,month,"01",sep="-"),
    date = as.Date(date,format = "%Y-%m-%d")
  ) %>%
  group_by(date,educ) %>%
  summarise(
    Median.RW = median(rw,na.rm=T)
  )

t <- ggplot(new_org_example2, aes(x = date, y = Median.RW, color = educ) )

t + geom_line(size=1)