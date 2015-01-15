library('RUnit')

source('pollutantmean.R')
source('complete.R')
source('corr.R')
test.suite <- defineTestSuite("ProgrammingAssignment1",
                              dirs = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

#provides detailed information on test execution
#printTextProtocol(test.result)