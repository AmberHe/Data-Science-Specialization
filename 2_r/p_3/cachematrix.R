## makeCacheMatrix():create a special "matrix" object that can cache its inverse.
## cacheSolve():computes the inverse of the special "matrix" returned by makeCacheMatrix 
##              above. If the inverse has already been calculated (and the matrix has 
##              not changed), then the cachesolve should retrieve the inverse from the cache.

## Make a special matrix that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
    }
    get <- function() x
    
    setInver <- function(inver) i <<- inver
    getInver <- function() i
    list(set = set, get = get, setInver = setInver, getInver = getInver)
}


## Compute the special matrix made by makeCacheMatrix
cacheSolve <- function(x, ...) {
    i <- x$getInver()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    matrix <- x$get()
    
    #Calculate the inverse of x
    i <- solve(matrix, ...)
    x$setInver(i)
    i
}
