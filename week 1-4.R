rnorm(10) # Generating random variates

### ASSIGNMENT, VARIABLES ###

a <- 1

# ...

a <- "text"

a <- rnorm(10)
set.seed(1)
rnorm(10)

rnorm(10)
a <- .Last.value

### DATA TYPES ###

# Numeric

numvar <- 4.2
numvar
?rnorm
str(numvar)
.Machine

numvar <- 3
str(numvar)

intvar <- 3L
intvar
str(intvar)

typeof(numvar)
typeof(intvar)
class(numvar)
class(intvar)

numvar <- 4t
str(intvar)
?intvar
??intvar
?numvar
?class

??numvar
# Character

stringvar <- "text"
stringvar
str(stringvar)

"1"

# Logical

logvar <- TRUE
logvar
str(logvar)
logvar <- FALSE
logvar
str(logvar)

# Others

# is.<type>(varname)

is.character(numvar)
is.logical(logvar)

# as.<type>(varname)

as.character(numvar)
as.numeric(stringvar)
as.numeric("5.6")

as.numeric(T)
as.numeric(F)

as.logical(1)
as.logical(0)
as.logical(0.1)
as.logical(-0.1)

# Others #2

NA
NULL
NaN

### DATA STRUCTURES ###

# Vector

numvector <- c(1, 5, -6.7, 8.5, 10)
numvector

numvector2 <- rnorm(100)
numvector2

numvar

seq(3, 17, 2)
3:17

seq(13, 44, 5)

charvector <- c("a", "b", "cd")
charvector

c(1, "a")

namedvector <- c(first = 5, second = 7,
                 third = -8.4)
namedvector
names(namedvector)

numvector

numvector[2]
numvector[c(1, 3, 4)]
?c
numvector[c(1, 3, 4, 1, 1, 5, 3, 2)]
mini(numvector)
which.max(numvector)
numvector[which.max(numvector)]
numvector[10]

numvector[c(1, 2, 3, 5)]
numvector[c(T, T, F, T, F)]

?vector

numvector > 3

numvector[numvector > 3]


numvector[-c(1, 2)]


namedvector[c("first", "third")]


numvector
numvector[2]

numvector[2] <- 999
numvector

numvector <- numvector[-5]
numvector

numvector[10] <- 111

numvector

numvector <- c(2, 5, 6, 3, 2, 7)
numvector

numvector[3:6]

numvector(3:)

c(numvector, c(-2, 3, 8))

##### FUNCTIONS #####

rnorm(10)

?rnorm

rnorm()

rnorm(2, 20, 3)
rnorm(10, 20, 3)rnorm(10, 20, 3)
rnorm(n = 3, mean = 50,
      sd = 3)

rnorm(4, sd = 5)

rnorm

numvector <- c(2, 5, 6, 3, 2, 7)
numvector

numvector == 5

log(numvector)

numvector + 1

2 + 3

`+`(2, 3)
"*, *"(3, 4, 5)

numvector
print(numvector)

length(numvector)
?length
length("text")
nchar("text")

object.size(numvector)

is.na(c(2, 3, NA, 4, NA, NA, 5, 6, NA))
c(2, 3, NA, 4, NA, NA, 5, 6, NA) == NA
is.na(c(2, 3, NA, 5, 6, NA, 8, 9))
log(NA)

TRUE & NA
FALSE & NA
?rmvnorm
rmvnorm(10, c(0, 0))

mvtnorm::rmvnorm(10, c(0, 0))

library(mvtnorm)
rmvnorm(10, c(0, 0))

##### DATA STRUCTURES II. #####

# Factor (not actually a data structure)

RawData <- read.csv2("Zuglo.csv")
head(RawData)
View(RawData)
View(Zuglo.csv)
library(readxl)
Data1 <- read.csv2("Zuglo.csv")


View(RawData$Condition)
glimpse(RawData)
mean(RawData$Condition)

RawData$Condition <- factor(
  RawData$Condition, c(1, 2, 3),
  c("Below average", "Average", "Above average"))
?factor
table(RawData$Condition)
mean(RawData$Condition)

# Data frame

dfdata <- data.frame(
  ptname = c("A", "B", "C", "D", "E"),
  bg = c(5.6, 7.8, 3.9, 5, 8.1),
  pregnant = c(FALSE, FALSE, TRUE, TRUE, FALSE)
)
?data.frame
dfdata

str(dfdata)

dfdata[c(T, T, F, T, F), -3]
?dfdata

dfdata[, "bg"]
dfdata$bg

dfdata[ dfdata$bg > 5.5,]

dfdata[ dfdata$bg < 5 & dfdata$pregnant == TRUE,]

dfdata[ dfdata$bg < 5 & dfdata$pregnant == FALSE,]

getwd()

InflData <- data.frame(readxl::read_excel(
  "prc_hicp_manr_page_spreadsheet_ES.xlsx",
  sheet = 3, skip = 8))

View(InflData)



colnames(InflData) <- c("country", "allitem",
                        "food", "alcohol",
                        "clothing", "housing")
?colnames

InflData
str(InflData)
View(InflData)

InflData[InflData$allitem > 3 &
           InflData$alcohol < 4,]

sort(InflData$allitem)

InflData$allitem

order(InflData$allitem)

InflData[order(InflData$allitem),]
InflData[order(InflData$allitem,
               decreasing = TRUE),]

head(InflData)

reshape::cast(InflData, id.vars = "country")
?melt
?id.vars
?cast
dag <- library(eurostat)


InflData2 <- data.frame(
  eurostat::get_eurostat("prc_hicp_manr")
)
head(InflData2)

eurostat::search_eurostat("GDP")
head("GDP")
View(inf)
# List

examplelist <- list(number = 4.5,
                    numvector = c(1, 2.3, -7),
                    char = "text",
                    df = RawData[RawData$Price < 40, ])
?df
?number
examplelist
str(examplelist)
??examplelist

examplelist[1]
examplelist[[1]]

examplelist$number

t.test(Price ~ Heating, data = RawData)

ttest1 <- t.test(Price ~ Heating, data = RawData)
?ttest1
?t.test()
str(ttest1)

print(ttest1)
print(examplelist)

stats:::print.htest

##### OWN FUNCTIONS, APPLY #####

mean(RawData[RawData$Condition == "pass",]$Price)
mean(RawData[RawData$Condition == "o'rta",]$Price)
mean(RawData[RawData$Condition == "baland",]$Price)

condavgprice <- function(cond) {
  return(mean(RawData[RawData$Condition == cond,]$Price))
}

condavgprice("Pass")
condavgprice("O'rta")
condavgprice("Baland")

colnames(RawData) <- c("Narx", "O'lcham", "Xonalar", "Qavat", "Isitish", "Holat")
RawData$Holat <- factor(RawData$Holat, c(1,2,3), c("Pass", "O'rta", "Baland"))
View(RawData)
RawData
RawData[, "Price"]
RawData$Price

RawData[,c("Price", "Size")]

RawData[ RawData$Price > 50,]
RawData[ RawData$Price < 50 & RawData$Size > 40, ]
RawData[ RawData$Price < 50 & RawData$Size > 40 &
           RawData$Condition == "Average" &
           RawData$Heating == 1, ]
RawData[,"Heating"]<- factor(RawData$Heating, c(0,1), c("off", "on"))
RawData
RawData[,"Rooms"] <- factor(RawData$Rooms,  c("small", "bigger",
                                              "big", "very_big", c(1, 2, 3, 4)))
sort(RawData$Size) 
RawData[order(RawData$Size, decreasing = TRUE,)]
sort(RawData$Size < 50)
RawData[order(RawData$Size < 50)]
View(order(RawData$Size < 50))
RawData[RawData$Size <50,]
table(RawData$Rooms)

?nrow
RawData(RawData$Rooms > 1,)
RawData

RawData[ (RawData$Price < 30 | RawData$Size > 60) &
           RawData$Condition == "Above average",]

RawData[ (RawData$Price < 30 | RawData$Size > 60) &
           RawData$Condition == "Above average",
         c("Rooms", "Floor")]

RawData[ RawData$Price / RawData$Size < 0.7,]

RawData[ RawData$Price / RawData$Size >= 0.7,]
RawData[ !(RawData$Price / RawData$Size < 0.7),]

RawData[, "Price"/"Size"]

sort(RawData$Size)
order(RawData$Size)
table[order(RawData$Size)]
RawData[order(RawData$Size),]

RawData2 <- RawData[RawData$Price < 40,]
RawData2[order(RawData2$Size),]

# RawData[RawData$Price < 40,][order(RawData$Size),]

set.seed(1); rnorm(10)
