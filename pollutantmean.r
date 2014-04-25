pollutantmean <- function(directory, pollutant, id = 1:332) {


setwd("C:/Users/Ben/Desktop/Data Science certification/R programming/programming assignment 1/specdata")
# 		this deals with that directory variable in the main function
	directory <- "C:/Users/Ben/Desktop/Data Science certification/R programming/programming assignment 1/specdata"
	variable <- dir()
	dataset  <- variable[id]

# 		loads the csv files
	variablelist <- lapply(dataset, read.csv)
 	a  <- do.call("rbind", variablelist)
	
#		remove the nulls from the csv and assigns to b
	b <- !is.na(a[pollutant])
	
# 		assign nitrate or sulfate
	c <- a[pollutant]
	mean(c[b])
	
#		deals with floating point problem	
	specify_decimal <- function(x, k) format(round(x, k), nsmall=k)
	
	
setwd("C:/Users/Ben/Desktop/Data Science certification/R programming/programming assignment 1")

#		deals with quotations, class problems
	as.numeric(noquote(specify_decimal(mean(c[b]), 3)))
	
	
	
}