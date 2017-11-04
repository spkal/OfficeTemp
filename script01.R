library("lubridate")
library("dplyr")
library("ggplot2")
d <- read.csv("LOGGER00.CSV", stringsAsFactors=FALSE)
d$datetime <- as.POSIXct(d$datetime)
d %>% ggplot(aes(x=datetime, y=temp)) + geom_point(size=0.5)
d$month <- ordered(lubridate::month(d$datetime),
  labels=month.abb[unique(lubridate::month(d$datetime))])
d %>% ggplot(aes(x=datetime, y=temp)) + geom_line() +
  facet_wrap(~ month, scales="free_x")


