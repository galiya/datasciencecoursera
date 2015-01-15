complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  fileList <- list.files(directory, full.names=TRUE)[id]
  result <- data.frame()
  
  
  for (file in fileList){
    
    dataset <- read.csv(file, header = TRUE)
    id <- unique(dataset[, "ID"])
    numCases <- nrow(na.omit(dataset))
    result<-rbind(result, data.frame(matrix(c(id,numCases),ncol = 2 )))
  } 
  colnames(result) <- c("id", "nobs")

  return(result)
}