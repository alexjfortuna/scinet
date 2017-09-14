#Import csv file containing data into R

basketball = read.csv("C:/Users/AlexFortuna/Desktop/RaptorsShots40.csv", header = TRUE)

#plot basketball scatter plot of shot locations
pdf(file = "basketball.pdf")
plot(basketball, xlab = "Court width (ft)", ylab = "Court length (ft)", main =
location of basketball shots", pch = 4, col ="red")
dev.off()

#Animate graph using package and plotly

#load plotly library
library(plotly)

#create data frame variable for graphical data
df <- data.frame(basketball)

#create scatter plot for data
p <- plot_ly(df, x =~x, y=~y, type ="scatter")

#Save graph and upload to plotly account
chart_post = plotly_POST(p, filename='bball')
chart_post
