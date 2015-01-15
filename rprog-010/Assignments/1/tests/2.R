test.NumberOfCompletedCasesInDataFileOne <- function()
{
  expected <- data.frame(matrix(c(1,117), nrow = 1, ncol = 2, byrow = TRUE))
  colnames(expected) <- c("id", "nobs")
  actual <- complete("specdata", 1)
  
  if (!isTRUE(all.equal(expected, actual)))
  {
    cat("\n", "class(expected)", class(expected), " vs.", "class(actual)", class(actual), "\n")
    print(head(expected))
    print(head(actual))
  }
  
  checkEquals(expected, actual)
}

test.NumberOfCompletedCasesInDataFileThree <- function()
{
  expected <- data.frame(matrix(c(3,243), nrow = 1, ncol = 2, byrow = TRUE))
  colnames(expected) <- c("id", "nobs")
  actual <- complete("specdata", 3)
  
  if (!isTRUE(all.equal(expected, actual)))
  {
    cat("\n", "class(expected)", class(expected), " vs.", "class(actual)", class(actual), "\n")
    print(head(expected))
    print(head(actual))
  }
  checkEquals(expected, actual)
}

test.NumberOfCompletedCasesInFiveDataFiles <- function()
{
  expected <- data.frame(matrix(c(2, 1041,4,474,8,192,10,148,12,96), nrow = 5, ncol = 2, byrow = TRUE))
  colnames(expected) <- c("id", "nobs")
  actual <- complete("specdata", c(2, 4, 8, 10, 12))
  
  if (!isTRUE(all.equal(expected, actual)))
  {
    cat("\n", "class(expected)", class(expected), " vs.", "class(actual)", class(actual), "\n")
    print(head(expected))
    print(head(actual))
  }
  checkEquals(expected, actual)
}

test.NumberOfCompletedCasesInRangeOfDataFiles <- function()
{
  expected <- data.frame(matrix(c(30, 932, 29, 711, 28, 475, 27, 338, 26, 586, 25, 463), nrow = 6, ncol = 2, byrow = TRUE))
  colnames(expected) <- c("id", "nobs")
  actual <- complete("specdata", 30:25)
  
  if (!isTRUE(all.equal(expected, actual)))
  {
    cat("\n", "class(expected)", class(expected), " vs.", "class(actual)", class(actual), "\n")
    print(head(expected))
    print(head(actual))
  }
  checkEquals(expected, actual)
}

