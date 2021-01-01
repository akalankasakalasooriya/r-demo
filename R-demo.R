# setting path

setwd("D:\\akalanka\\projects to try\\R demo")
getwd()

# load default dataset

library(datasets)
iris
head(iris)
summary(iris)
plot(iris$Sepal.Length,iris$Sepal.Width)

# detach dataset

detach("package:datasets" , unload = TRUE)

# ctrl + l to cls console
# clear plots
dev.off()

# install package (packman)

install.packages("pacman")

# add to env

require(pacman)

#get help
? plot()

# basic x y plotting

plot(iris$Species)
plot(iris$Petal.Length,iris$Petal.Width)

# plot with extra pram
plot(iris$Petal.Length,iris$Petal.Width,
             col="#ee0011",
             pch=4,
             main = "plot",
             xlab = "x",
             ylab = "y")

# standard plots
plot(cos, 1,5*pi)
plot(exp,1,5)
plot(dnorm,-4,+4)

#bar charts
head(mtcars)
summary(mtcars)
freqcyl<-table(mtcars$cyl) #use table to make frequency table
barplot(freqcyl,col = "#990055")

# histograms 

summary(iris)
par(mfrow=c(3,1))
hist(iris$Petal.Width [iris$Species=="setosa"],
     xlim = c(0,3),
     col = "#ff0000",
     breaks = 9
     )

hist(iris$Petal.Width [iris$Species=="versicolor"],
     xlim = c(0,3),
     col = "#00ff00",
     breaks = 9
)
hist(iris$Petal.Width [iris$Species=="virginica"],
     xlim = c(0,3),
     col = "#0000ff",
     breaks = 9
)

temp<-hist(1:5 , breaks = seq(1,6,length=6))
temp$breaks
summary(temp)

# scatterplot 

head(mtcars)
summary(mtcars)
plot(mtcars$mpg,mtcars$wt, cex=1.5)#cex is size of dot/point

#overlaying plots

head(lynx)
hist(lynx,
     breaks=14,
     freq = FALSE,
     )
curve(dnorm(x,mean = mean(lynx),sd=sd(lynx)),
      lwd=2,add = TRUE)
# add kernel density estimators
lines(density(lynx),col="blue",lwd=2)
lines(density(lynx,adjust = 3),col="#ee0000",lwd=2)

# rug plot

rug(lynx,lwd=2,col = "pink")

# describe

head(iris)
p_load(psych)#need pacman
describe(iris$Sepal.Length)
describe(iris)
iris$Species

# selectors
par(mfrow=c(3,1))
hist(iris$Petal.Length[iris$Species == "setosa"])
hist(iris$Petal.Length[iris$Species == "virginica"])
hist(iris$Petal.Length[iris$Species == "versicolor"])

# multiple selectors
par(mfrow=c(1,1))
hist(iris$Petal.Length[iris$Species == "virginica" & iris$Species == "virginica"])
i.setosa <- iris[iris$Species=="setosa",]

# converting data types
n1 <- 15
typeof(n1)
c1<-"aac"
typeof(c1)
l1<- TRUE
typeof(l1)

# matrix
m1<- matrix(c(1,2,3,4,5,6),ncol = 3,byrow = TRUE)
m1

vnum<-c(1,2,3)
vchar<-c("a","b","c")
vlog<-c(T,F,T)
dfa1<-cbind(vnum,vchar,vlog)
dfa1 #all are char to avoid that use..

dfa2 <- as.data.frame(cbind(vnum,vchar,vlog))
dfa2

#rename header
names(dfa2) <- c("vNUM","vCHAR","vLOG")
dfa2

#rename data
dfa2$vNUM <- factor(dfa2$vNUM,c(1,2,3),c("male","female","other"))
dfa2

#structure
str(dfa2)
typeof(dfa2$vNUM)

# rep 
rep(c("a"),each=5)

# sequence
seq(12,9,-2)

# import data
# install rio
p_load(rio)
data <- import("mbb.txt")
head(data)
View(data)

# hierarchical clustering
head(mtcars)
p_load(dplyr)

#get small data set
cars <- mtcars[,c(1:4,6:7,9:11)]
head(cars)
# get similarity
hc<- 
   cars %>% #get car data
   dist %>% # compute distance matrix
   hclust   #get hierarchical clustering

# draw plot
plot(hc)
#draw border for group
rect.hclust(hc,k=2,border = "#33ff11")
rect.hclust(hc,k=3,border = "#990000")

# principal anyl
cars <- mtcars[,c(1:4,6:7,9:11)]
head(cars)
pc<- prcomp(cars,
            center = T,
            scale = T)
plot(pc)

# regression
head(USJudgeRatings)
data<- USJudgeRatings
x<- as.matrix(data[-12])
y<-data[,12]
reg1<-lm(y~x)
plot(reg1)
summary(reg1)
anova(reg1)


