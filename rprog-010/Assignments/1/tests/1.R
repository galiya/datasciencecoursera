test.GetPollutantMeanUsingOneSourceMonitor <- function()
{
  
  testvalue <- pollutantmean("specdata", "nitrate", 23)
  checkEquals(testvalue, 1.281, tolerance = 0.001)
  
}

test.GetPollutantMeanUsingFirstTenSourceMonitors <- function()
{
  testvalue <- pollutantmean("specdata", "sulfate", 1:10)
  checkEquals(testvalue, 4.064, tolerance = 0.001)
}

test.GetPollutantMeanUsingARangeOfSourceMonitors <- function()
{
  testvalue <- pollutantmean("specdata", "nitrate", 70:72)
  checkEquals(testvalue, 1.706, tolerance = 0.001)
}

