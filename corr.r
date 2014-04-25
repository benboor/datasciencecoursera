corr <- function(directory, threshold = 0) {
  
#		this finds data where na values aren't within directory so that they can be used 
	workingdata <- complete(directory)

#		this subsets the working data function so things can be called by row
	subsetworkingdata <-subset(workingdata, nobs > threshold, select = id)
  
# 		this ensures the output function is numeric so I don't have to use as.numeric() again
	output <- vector(mode="numeric")
	if(nrow(subsetworkingdata) > 0) {

#		this command borrowed from complete.r, negates upload problems from pollutionmean.r
    directory <- paste(directory,"/",sep="")
	
#		these functions create vector of csv files the same as complete.r
    csvdatafiles <- vector(mode="character")	
    csvdatafiles <- c(csvdatafiles,(paste(directory, formatC(subsetworkingdata$id, width=3, digits=0, format="d", flag="0"),".csv", sep="")))
    
#		this does the legwork for output	
    for(i in csvdatafiles) {
        uniondata <- na.omit(read.csv(i, header=TRUE, sep=","))
        colnames(uniondata) <- c('Date', 'sulfate', 'nitrate', 'ID') 
        namesmatrixdata <- c('sulfate','nitrate')
        uniondata <- uniondata[namesmatrixdata]

#		this outputs the union of either sulfate and nitrate in a vector		
    output <- c(output, cor(uniondata$sulfate, uniondata$nitrate))
		
}
} 
  output
}