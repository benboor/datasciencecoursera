complete <- function(directory, id = 1:332) {
 
 
# 		this  sets directory. hopefully avoid problem from pollutantmean.
	directory <- paste(directory,"/",sep="")
  
#		this creates vector of csv data files
	csvdatafiles <- vector(mode="character")
	csvdatafiles <- c(csvdatafiles,(paste(directory, 
					formatC(id, width=3, digits=0, format="d", flag="0"),".csv", sep="")))
  
#		this assigns a data frame for each variable in csvdatafiles
	datafilesdataframe <- data.frame()
		for(i in csvdatafiles) 
			{datafilesdataframe <- rbind(datafilesdataframe, na.omit(read.csv(i, header=TRUE, sep=",")))
}

#			this assigns the character vector containing the collumn names to datafilesdataframe	
	colnames(datafilesdataframe) <- c('Date', 'sulfate', 'nitrate', 'ID') 
		
#		this names files in directory and then outputs within for these within loop
	output <- data.frame()
		for(files in id){
			output <- rbind(output,(c(files,(nrow(subset(datafilesdataframe, ID == files, select = ID))))))
}

#		this assigns character vector to output
	names(output) <- c("id","nobs")
	output
}