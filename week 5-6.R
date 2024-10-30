InflData <- data.frame(eurostat::get_eurostat("prc_hicp_manr"))
head(InflData)       

InflData <- InflData[InflData$geo %in% c("HU", "AT"),]
InflData <- InflData[InflData$TIME_PERIOD >= "2024-07-01" & InflData$TIME_PERIOD <= "2024-08-01",]
InflData <- InflData[nchar(InflData$coicop)== 4 & substring(InflData$coicop, 1, 2) == "CP",]

InflDataWide <- reshape2::dcast(InflData, coicop + TIME_PERIOD ~ geo, value.var = "values")

InflDataWide
plot(InflDataWide$HU, InflDataWide$AT)
abline(0,1, col = "red")

plot(InflDataWide[InflDataWide$TIME_PERIOD == "2024-07-01",]$HU,
     InflDataWide[InflDataWide$TIME_PERIOD == "2024-07-01",]$AT, 
     col = "blue", xlim = c(-1, 13), ylim = c(-6, 7))

points(InflDataWide[InflDataWide$TIME_PERIOD == "2024-08-01",]$HU,
     InflDataWide[InflDataWide$TIME_PERIOD == "2024-08-01",]$AT, 
     col = "orange",xlim = c(-1, 13), ylim = c(-6, 7))
legend('center', legend = c("July", "August"), fill = c( "blue","orange"))


#### GGPLOT2 ####

library(ggplot2)

?geom_point

ggplot(InflDataWide, aes(x = HU, y = AT)) + 
  geom_point()

ggplot(InflDataWide,
       aes(x = HU, y = AT, colour = factor(coicop), shape = factor(TIME_PERIOD))) +
  geom_point() + geom_abline()

p <- ggplot(InflDataWide,
       aes(x = HU, y = AT, colour = factor(coicop), shape = factor(TIME_PERIOD))) +
  geom_point() + 
  labs(color = "Item group", shape = "Month")
ggplot(InflDataWide, aes(y = AT, x=HU, color =factor(coicop), shape = factor()) )
dev.off()
dev.off()

str(p)

p

p + geom_abline()

ggplot(InflDataWide, 
       aes(x=HU, y=AT)) + geom_point()

ggplot(InflDataWide, 
       aes(x=HU, y=AT)) + geom_point() + facet_wrap(~TIME_PERIOD) + geom_abline()
 dev.off()

ggsave('Exampleplot1.png', width = 16, height = 9)
 
ggsave('Exampleplot1.pdf', width = 16, height = 9, device = cairo_pdf)

dev.off()

ggsave('Exampleplot1.png', p, width = 16, height = 9)

ggsave('Exampleplot1.pdf', width = 16, height = 9, device = cairo_pdf)


