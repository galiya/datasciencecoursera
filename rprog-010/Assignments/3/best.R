best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = c("NA","Not Available", ""), colClasses = "character")

    listStates <- unique(data[, 7])
    listOutcomes <- c("heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    if (! state %in% listStates)
        stop ("invalid state")
    if (! outcome %in% listOutcomes)
        stop ("invalid outcome")
    
    ## Return hospital name in that state with lowest 30-day death rate
    
    stateData <- subset(data, data[, 7] == state )
    if (outcome == "heart attack")
        stateData[, 11] <-as.numeric(stateData[, 11])
        bestVal <- which( stateData[, 11] == min(stateData[, 11], na.rm = TRUE) )
    
    
    if (outcome == "heart failure")
        stateData[, 17] <-as.numeric(stateData[, 17])
        bestVal <- which( stateData[, 17] == min(stateData[, 17], na.rm = TRUE) )
    
    if (outcome == "pneumonia")
        stateData[, 23] <-as.numeric(stateData[, 23])
        bestVal <- which( stateData[, 23] == min(stateData[, 23], na.rm = TRUE) )
    
    #return (sort(stateData[bestVal, 2])[1])
    return (stateData[bestVal, 2])
    
}