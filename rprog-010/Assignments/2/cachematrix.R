## Programming Assignment 2
## makeCacheMatrix function creates a special type of matrix which also stores its inverted value
## cacheSolve function calculates inverse value for the matrix (either by taking a pre-calculated 
## value from cache, or calculating it using R function solve()

## makeCacheMatrix function allows to get/set data matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  inverted <- NULL
  
  set <- function(value) {
    x <<- value
    inverted <<- NULL
  }
  
  get <- function() x
  
  setinverted <- function(value) inverted <<- value
  getinverted <- function() inverted
  
  list(set = set, get = get,
       setinverted = setinverted,
       getinverted = getinverted)
}


## cacheSolve function allows to calculate inverse matrix by using a cache 
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverted <- x$getinverted()
  if(!is.null(inverted)) {
    message("getting cached inverse matrix")
    return(inverted)
  }
  data <- x$get()
  inverted <- solve(data, ...)
  x$setinverted(inverted)
  inverted
}
