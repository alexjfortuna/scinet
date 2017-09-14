#MyDivision.R

#This function is to determine if x is divisible evenly by y

divisible.by <- function(x,y) {
x %% y == 0
}

# ##########################################################

#This is a function to determine where in range (x:y) variable z divides evenly into

divisible.within.range <- function(x,y,z){
mylist <- list()
for (i in c(x:y)){
   if(divisible.by(i,z))
     mylist <- c(mylist,i)
}
return(mylist)
}
