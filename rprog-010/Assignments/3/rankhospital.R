rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = c("NA","Not Available", ""), colClasses = "character")

    listStates <- unique(data[, 7])
    listOutcomes <- c("heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    if (! state %in% listStates)
        stop ("invalid state")
    if (! outcome %in% listOutcomes)
        stop ("invalid outcome")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rates
    
    stateData <- subset(data, data[, 7] == state )
    
    if (outcome == "heart attack")
        stateData[, 11] <-as.numeric(stateData[, 11])
        
        rankVal <- stateData[order(stateData[, 11], stateData[, 2]), ][ ,2]
    
    if (outcome == "heart failure")
        stateData[, 17] <-as.numeric(stateData[, 17])
        rankVal <- stateData[order(stateData[, 17], stateData[, 2]), ][ ,2]
    
    if (outcome == "pneumonia")
        stateData[, 23] <-as.numeric(stateData[, 23])
        rankVal <- stateData[order(stateData[, 23], stateData[, 2]), ][ ,2]
    
    #return (sort(stateData[bestVal, 2])[1])
    if (num == "best")
        return (rankVal[1])
    if (num == "worst")
        return (rankVal[length(rankVal)])
    if (num > length(rankVal))
        return (NA)
    return (rankVal[num])
    
}