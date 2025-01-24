EPI_data <- read.csv("/Users/sutherlandbrown/Downloads/epi2024results06022024.csv") 
setwd("/Users/sutherlandbrown/SouthVS/Data_Analytics/Labs")
View(EPI_data)
attach(EPI_data)
EPI.new

NAs <- is.na(EPI.new)
EPI.new.noNAs <- EPI.new[!NAs] 
summary(EPI.new)
fivenum(EPI.new,na.rm=TRUE) 
stem(EPI.new) # stem and leaf plot 
hist(EPI.new) 
hist(EPI.new, seq(20., 80., 1.0), prob=TRUE) 
lines(density(EPI.new,na.rm=TRUE,bw=1.)) # or try bw=“SJ” 
rug(EPI.new)
boxplot(EPI.new, APO.new) 
hist(EPI.new, seq(20., 80., 1.0), prob=TRUE)
lines(density(EPI.new,na.rm=TRUE,bw=1.))
rug(EPI.new)
x<-seq(20,80,1) 
q<- dnorm(x,mean=42, sd=5,log=FALSE) 
lines(x,q)
lines(x,.4*q)
q<-dnorm(x,mean=65, sd=5,log=FALSE) 
lines(x,.12*q) 
plot(ecdf(EPI.new), do.points=FALSE, verticals=TRUE)
qqnorm(EPI.new); qqline(EPI.new)
qqplot(rnorm(250), EPI.new, xlab = "Q-Q plot for norm dsn") 
qqline(EPI.new)
qqplot(rt(250, df = 5), EPI.new, xlab = "Q-Q plot for t dsn") 
qqline(EPI.new)


#Next variable
EPI_data <- read.csv("/Users/sutherlandbrown/Downloads/epi2024results06022024.csv") 
setwd("/Users/sutherlandbrown/SouthVS/Data_Analytics/Labs")
View(EPI_data)
attach(EPI_data)
EPI.old

NAs <- is.na(EPI.old)
EPI.old.noNAs <- EPI.old[!NAs] 
summary(EPI.old)
fivenum(EPI.old,na.rm=TRUE) 
stem(EPI.old) # stem and leaf plot 
hist(EPI.old) 
hist(EPI.old, seq(10., 100., 1.0), prob=TRUE) 
lines(density(EPI.old,na.rm=TRUE,bw=1.)) # or try bw=“SJ” 
rug(EPI.old)
boxplot(EPI.old, APO.new) 
hist(EPI.old, seq(10., 100., 1.0), prob=TRUE)
lines(density(EPI.old,na.rm=TRUE,bw=1.))
rug(EPI.old)
x<-seq(10,80,1) 
q<- dnorm(x,mean=42, sd=5,log=FALSE) 
lines(x,q)
lines(x,.4*q)
q<-dnorm(x,mean=65, sd=5,log=FALSE) 
lines(x,.12*q) 
plot(ecdf(EPI.old), do.points=FALSE, verticals=TRUE)
qqnorm(EPI.old); qqline(EPI.old)
qqplot(rnorm(250), EPI.old, xlab = "Q-Q plot for norm dsn") 
qqline(EPI.old)
qqplot(rt(250, df = 5), EPI.old, xlab = "Q-Q plot for t dsn") 
qqline(EPI.old)

#next variable
EPI_data <- read.csv("/Users/sutherlandbrown/Downloads/epi2024results06022024.csv") 
setwd("/Users/sutherlandbrown/SouthVS/Data_Analytics/Labs")
View(EPI_data)
attach(EPI_data)
SPI.new

NAs <- is.na(SPI.new)
SPI.new.noNAs <- SPI.new[!NAs] 
summary(SPI.new)
fivenum(SPI.new,na.rm=TRUE) 
stem(SPI.new) # stem and leaf plot 
hist(SPI.new) 
hist(SPI.new, seq(10., 80., 1.0), prob=TRUE) 
lines(density(SPI.new,na.rm=TRUE,bw=1.)) # or try bw=“SJ” 
rug(SPI.new)
boxplot(SPI.new, APO.new) 
hist(SPI.new, seq(10., 80., 1.0), prob=TRUE)
lines(density(SPI.new,na.rm=TRUE,bw=1.))
rug(SPI.new)
x<-seq(10,80,1) 
q<- dnorm(x,mean=42, sd=5,log=FALSE) 
lines(x,q)
lines(x,.4*q)
q<-dnorm(x,mean=65, sd=5,log=FALSE) 
lines(x,.12*q) 
plot(ecdf(SPI.new), do.points=FALSE, verticals=TRUE)
qqnorm(SPI.new); qqline(SPI.new)
qqplot(rnorm(250), SPI.new, xlab = "Q-Q plot for norm dsn") 
qqline(SPI.new)
qqplot(rt(250, df = 5), SPI.new, xlab = "Q-Q plot for t dsn") 
qqline(SPI.new)





