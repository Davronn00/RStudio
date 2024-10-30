list <- list(number =4.5,
                    numvector= c(1,2.3,-7),
                    char = "text",
                    df = RawData[RawData$Price < 40,])
examplelist
str(examplelist)
examplelist[1]
examplelist[[1]]

examplelist$number

t.test(Price ~ Heating, data=RawData)
ttest1 <- t.test(Price ~ Heating, data=RawData)
ttest1
str(ttest1)
print(ttest1)
print(examplelist)
stats ::: peint.ttest[]

###own functions, apply###

mean(RawData[RawData$Condition == 1,]$Price)
mean(RawData[RawData$Condition == 2,]$Price)
mean(RawData[RawData$Condition == 3,]$Price)

condavgprice <- function(cond) {
  mean(RawData[RawData$Condition == cond,]$Price)
}

condavgprice("1")
condavgprice("2")
condavgprice("Below average")

RawData <- read.csv2("Zuglo.csv")
head(RawData)

RawData$Condition <- factor(RawData$Condition, c(1,2,3), c("Below average", 
                                                           "Average", 
                                                           "Above average"),)
mean(RawData[RawData$Condition == "Below average",]$Price)
mean(RawData[RawData$Condition == "Average",]$Price)
mean(RawData[RawData$Condition == "Above average",]$Price)

condstatprice <- function(cond, stat) {
  return(stat(RawData[RawData$Condition == cond,]$Price))
}

condstatprice("Below average", mean)
condavgprice("Average")
condavgprice("Above average")

sapply(c("Below average", "Average", "Above average"), condavgprice)
sapply(levels(RawData$Condition), condavgprice)

tapply(RawData$Price, RawData$Condition,mean)

