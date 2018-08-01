## create inverse of matrix, or if already cached retrieve the cached inverse
## functions do

## Creates a list of functions. You run makeCacheMatrix(x) with x the function you want cached. Save the function.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setinverse <- function(solve) {
    m <<- solve 
  }
  
  getinverse <- function() {
    m
  }
  
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Run result of makeCacheMatrix through the function below, to get either cached version of it or it will calculate it on spot


cacheSolve <- function(x, ...) {  #import list resultaat van MakeVector
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  else {
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  }
}

