test.calculateCorrelationsForThreshold150 <- function() 
{
 # incomplete
  
#   expectedHead <- c(-0.01896,-0.14051,-0.04390,-0.06816,-0.12351,-0.07589)
#   expectedSummary <- c("Min." = -0.2110, "1st Qu." =  -0.0500, "Median" = 0.0946 , "Mean" = 0.1250, "3rd Qu." = 0.2680, "Max." = 0.7630)
#   
#   actual <- corr("specdata", 150)
#   print(head(actual))
#   print(summary(actual))
#   checkEquals(expectedHead, head(actual))
  #checkEquals(expectedSummary, as.vector(summary(actual))
}

# test.calculateCorrelationsForThreshold400 <- function()
# {
#   
#   expectedHead <- c(-0.01896,-0.04390,-0.06816,-0.07589, 0.76313,-0.15783)
#   
#   expectedSummary <- c(-0.1760, -0.0311, 0.1000 , 0.1400, 0.2680, 0.7630)
#   expectedSummary.names <- c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max.")
#   names(expectedSummary) <- expectedSummary.names
#   
#   actual <- corr("specdata", 400)
#   
#   checkEquals(expectedHead, head(actual))
#   checkEquals(expectedSummary, summary(actual))
# }
# 
# test.calculateCorrelationsForThreshold5000 <- function()
# {
#   actual <- corr("specdata", 5000)
#   expected <- vector("numeric", length = 0)
#   checkEquals(expected, actual)
# }
# 
# test.calculateCorrelationsForDefaultThreshold <- function()
# {
#   actual <- corr("specdata")
#   expectedSummary <- c(-0.1760, -0.0311, 0.1000 , 0.1400, 0.2680, 0.7630)
#   expectedSummary.names <- c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max.")
#   names(expectedSummary) <- expectedSummary.names
#   
#   checkEquals(expectedSummary, as.vector(summary(actual)))
#   checkEquals(323, length(actual))
# }