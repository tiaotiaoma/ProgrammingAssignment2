## This pair of functions is to cache the inverse of a matrix


## This function creates a specal "matrix" object that can caches its inverse

makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
        
}


## this function computes the inverse of the specail " matrix" returned by makeCacheMatrix above. If 
## the inverse has already been calculated (and the matrix has not changed), then the cachecolve should retrive the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m   ## Return a matrix that is the inverse of 'x'
        
}

