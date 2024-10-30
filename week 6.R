library(data.table)

#data table is improved data frame. Data.table is able to read 100 billions 
#of rows and columns. first thing is speed and size, second is comfort.
# third is you can't do smth with data frame but you can do it with data table

RawData <- readRDS(url("https://tinyurl.com/y6c2vvwv"))

# RDS is faster and easy to use compared to CSV.

RawDataDF <- data.frame(RawData)

RawData

RawDataDF
RawDataDF$Sex <- ifelse(RawDataDF$Sex == "Férfi", "Male", "Female")
RawData$Sex <- ifelse(RawData$Sex == "Férfi", "Male", "Female")

RawDataDF

str(RawDataDF)

RawDataDF[RawDataDF$Year == 2010 & RawDataDF$Age == 40 & RawDataDF$Sex == "Male" 
          & RawDataDF$ICDCode == "C18" & RawDataDF$County == "Budapest",]

RawData[Year == 2010 & Age == 40 & Sex == "Male" & 
          ICDCode == "C18" & County == "Budapest"]

RawData[Age == 40 & Sex == "Male" & ICDCode == "C18" & County == "Budapest"]

RawData[Age == 40 & Sex == "Male" & ICDCode == "C18" & County == "Budapest", 
        .(Year, N, Population, Inc = N / Population * 1e5)]

RawData[Age == 40 & Sex == "Male" & ICDCode == "C18" & County == "Budapest", 
        .(N = sum(N)/sum(Population) * 1e5)]

RawData[Age == 40 & Sex == "Male" & County == "Budapest", 
        .(N = sum(N)/sum(Population) * 1e6), .(ICDCode)]
RawData[Year == 2010 & Sex == "Male" & ICDCode == "C18" & County == "Budapest", 
        .(N = sum(N)/sum(Population) * 1e5, Age)]
#in the first we can't  change sex or other columns here  

RawData[Year == 2010 & Sex == "Male" & ICDCode == "C18" & County == "Budapest",
        .(Age, Inc = N/Population * 1e5)]

#in the second one we can change every columns and parts

RawData[Year == 2010 & Sex == "Male" & ICDCode == "C18" & County == "Budapest", 
        .(N = sum(N)/sum(Population) * 1e5), 
        .(Age)]




