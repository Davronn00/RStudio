library(data.table)
library(ggplot2)

RawData <- readRDS(url("https://tinyurl.com/y6c2vvwv"))
RawData$Sex <- ifelse(RawData$Sex == "Férfi", "Male", "Female")
RawData
RawData[Year == 2010 & County == "Budapest" & Sex == "Male" & ICDCode == "C18", 
        .(Inc = sum(N)/sum(Population)*1e5),
        .(Age)]

#scenario 1 : Specific male
ggplot(RawData[Year == 2010 & County == "Budapest" & Sex == "Male" & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age)], aes(x = Age, y = Inc)) + geom_line()

#scenario 2: Sex sum, both male and female 
ggplot(RawData[Year == 2010 & County == "Budapest"  & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age)], aes(x = Age, y = Inc)) + geom_line()

#scenario 3: sum the year, incalculated into the Inc
ggplot(RawData[County == "Budapest"  & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age)], aes(x = Age, y = Inc)) + geom_line()

#scenario 4: same plot, different color
RawData[County == "Budapest"  & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, Sex)]

ggplot(RawData[County == "Budapest"  & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, Sex)],
       aes(x=Age, y=Inc, color=Sex))+geom_line()

#                  year             county            sex               type of cancer
#scenario 1       Filter            Filter            Filter            Filter
#scenario 2       Filter            Filter            sum               Filter
#scenario 3       sum               Filter            sum               Filter
#scenario 4       sum               Filter            color             Filter
#scenario 5       Filter            color             sum               Filter
#scenario 6       Color(ordinal)    Filter            sum               Filter
#scenario 7       Filter
#scenario 8       Filter            filter            lineplot          filter
#scenario 9       lineplot          filter            differ            filter
#scenario 10      differ            filter            filter            filter



#scenario 5
ggplot(RawData[Year == 2010 & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, County)], aes(x = Age, y = Inc, colour = County)) + geom_line()

  #scenario 6: 

ggplot(RawData[County== "Budapest" & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, Year)], aes(x = Age, y = Inc, colour = Year, group = Year)) + geom_line() 


#scenario 7

ggplot(RawData[Year == 2010 & ICDCode == "C18" & County %in% c("Budapest", "Vas megye", 
                                                               "Zala megye"),
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, County, Sex)], aes(x = Age, y = Inc, colour = interaction(County, Sex),
                                         color = interaction(County, Sex))) + geom_line()

#scenario 8
ggplot(RawData[Year == 2010 & ICDCode == "C18" & County %in% c("Budapest", "Vas megye", 
                                                               "Zala megye"),
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, County, Sex)], aes(x = Age, y = Inc, colour = County, 
                                         linetype = Sex)) + geom_line()

#scenario 9

ggplot(RawData[County== "Budapest"  & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age, Sex)], aes(x = Inc, y = Age)) + facet_wrap(~Sex)+geom_line()

#scenario 10

ggplot(RawData[County== "Budapest"  & Sex == "Male" & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age,Year)], aes(x = Age, y = Inc)) + facet_wrap(~Year)+geom_line()

#scenario 11

ggplot(RawData[County== "Budapest" & ICDCode == "C18",
               .(Inc = sum(N)/sum(Population)*1e5),
               .(Age,Year, Sex)], aes(x = Age, y = Inc,color =  Sex)) + facet_wrap(~Year)+geom_line()






