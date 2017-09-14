
#birthData.R

#Download Birth Weight Data table from online

data = read.csv("http://www.biostatisticien.eu/springeR/Weight_birth.csv", sep="")

#Determine the mean birth weight of infants whose mothers smoked
#Determine the mean birth weight of infants whose mothers did not smoke

#Create variable of mean birth weight of child born to smoking mothers
SmokeWeight <- mean(data[which(data$SMOKE > 0), 10])

#Create variable of mean birth weight of child born to non-smoking mothers
NoSmokeWeight <- mean(data[which(data$SMOKE < 1), 10])

#Prints out the mean birth weight for children born to mothers who had smoked
cat("The mean weight of children born to smoking mothers is", SmokeWeight,"grams.", "\n")

#Prints out the mean birth weight for children born to mothers who had not smoked
cat("The mean weight of children born to non-smoking mothers is", NoSmokeWeight,"grams.", "\n")

#Solve for SD of BW for children born to mothers who had already had a premature birth
BWSDPre <- sd(data[which(data$PTL > 0), 10])

#Prints out the standard deviation of children born to mothers who have had a premature birth
cat("The standard deviation of the birth weight of children born to mothers who had already had a premature birth is", BWSDPre, "\n"  )

#Solve for SD of BW for children born to mothers who had not already had a premature birth
BWSDNoPre <- sd(dBWSDPre <- data[which(data$PTL < 1), 10])

#Prints out the standard deviation of children born to mothers who have not had a premature birth
cat("The standard deviation of the birth weight of children born to mothers who had already had a premature birth is", BWSDNoPre, "\n"  )

#Prints out the fraction of smoking mothers which have already had premature births

#Set variable for PTL from smoking mothers
Smothers <- c(data[which(data$SMOKE >0), 6])

#Calculate percentage of Smoking mothers who have had a PTL
PerSmokePre <- (sum(Smothers > 0))/(length(Smothers))

cat("The fraction of smoking mothers which have previously had premature births is", PerSmokePre, "\n")
