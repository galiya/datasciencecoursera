source("Complete.R")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  fileList <- list.files(directory, full.names=TRUE)
  result <- vector("numeric")
  
  for (fileId in seq_along(fileList)){
    file <- fileList[fileId]
    numObs <- complete("specdata", fileId)[, 2]
    if (numObs >= threshold)
    {
      dataset <- read.csv(file, header = TRUE)
      corValue <- cor(dataset$sulfate, dataset$nitrate, use = "p")
      result <- c(result, corValue)
    }
    else
    {
      result <- c(result, NA)
    }
  }
    
  
  #result <- c(-0.1760, -0.0311, 0.1000 , 0.1400, 0.2680, 0.7630)
  
  return(result[!is.na(result)])
}