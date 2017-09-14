# Assignment 2 Part 1

#create vector for heights
heights = c(27.75,24.5,25.5,26,25,27.75,26.5,27,26.75,26.75,27.5)

#create vector for circumference
circ = c(17.5,17.1,17.1,17.3,16.9,17.6,17.3,17.5,17.3,17.5,17.5)

#create data frame for heights vs. circumference
h.circ = data.frame(heights,circ)

#1a Inspect data graphically to check for insights into their relationship
plot(h.circ)
#Initial inspections reveals a linear relationship between the two variables

#Quantify this relationship by computing covariance and correlation
cov(heights, circ) #0.2188636
cor(heights, circ) #0.9110727
cor.test(h.circ$heights,h.circ$circ)
#There is a positive covariance and the variables are highly correlated

#fiting a linear model with lm
lm(h.circ$circ~h.circ$heights)
#Coefficients
#Intercept = 12.4932
#h.circ$heights = 0.1827
cat("Original linear model Circumference = 12.4932 + (0.1927 X height)")

m <- lm(circ~heights, data = h.circ)

plot(h.circ)
abline(m)

#resulting fit is okay, but does not pass through any points in the graph

#investigate which points have the ability to move the regression model
m1 <- lm(circ~heights, data = h.circ)
lev = hat(model.matrix(m1))
plot(lev)

#retain list of points with leverage > 0.15
h.circ[lev>0.15,]

> cookDist = cooks.distance(m1)
> plot(cookDist,ylab="Cook's_Distance")

#remove the "suspicious" data points
cleanData = h.circ[-c(2,3,5),]

#generate new model based on cleanData set
lm(circ~heights, data = cleanData)
#linear model from cleaned Data Circumference = 13.2648 + (0.1545 X height)
m2 <- lm(circ~heights, data = cleanData)

#visual new linear model against original data
plot(h.circ)
abline(m2)

#Investigate residuals in new linear model
m2$res
rstudent(m2)

#plots of residuals vs. predicted and explanatory vars
par(mfrow=c(1,3))
plot(cleanData$heights,m2$res)
plot(cleanData$circ,m2$res)
plot(m2$fitted,m2$res)

#Derived plots are randomly scattered about 0, widths are however not equal

m1.Rs=rstudent(m1)
par(mfrow=c(1,3))
plot(cleanData$heights, m2$m1.Rs)
plot(cleanData$circ, m2$m1.Rs)
plot(m2$fitted,m2$m1.Rs)

#derived plots using student residuals randomly scattered about 0, equal width
#Due to these observations the model as written is valid

#Fit a quadratic model
Heights2 <- h.circ$heights^2
m3 <- lm(circ~heights+Heights2, data = h.circ)
m3
plot(h.circ$heights, h.circ$circ)
abline(m3)
