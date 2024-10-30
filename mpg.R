library(tidyverse)
data()
view(mpg)
?mpg
?mean
glimpse
glimpse()
glimpse(mpg)
?filter
?sort
filter(mpg, cty >= 20)
mpg_efficient <- filter(mpg, cty >= 20)
view(mpg_efficient)
library(tidyverse)


mpg_ford <- filter(mpg, manufacturer == "ford")
view(mpg_ford)

mpg_metric <- mutate(mpg, cty_metric = 0.425144*cty)
glimpse(mpg_metric)




