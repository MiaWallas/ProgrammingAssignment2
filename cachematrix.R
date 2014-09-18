## Put comments here that give an overall description of what yourfunctions do

## Write a short comment describing this function


## 1. assign a matrix to local variable 'x' (e.g. x<-matrix(c(1,2,3,4),2,2) )

x<-matrix(c(1,2,3,4),2,2)


## 2. create a function called makeCacheMatrix, where 'x' is defined as a matrix. 

makeCacheMatrix <- function(x = matrix()) {
        
         
## 3. create a new variable (i) that represents the inverse of the matrix and set it to NULL.
        
        i <- NULL
        
        
## 4. define a new function in order to set the matrix 'X' to a new matrix 'y' and set the inverse (i) to NULL again.
        
        set <- function(y) {
                
                x <<- y
                i <<- NULL
        }
        

## 5.get the value of the matrix
        
        get <- function() x
        

## 6.set the value of the inverse (i) by means of the function 'solve'
        
        setsolve <- function(solve) i <<- solve
        
        
## 7.get the value of the inverse (i)
        
        getsolve <- function() i
        
        
## 8. return the matrix containing all the functions above defined
        
        list(set = set, 
             get = get,
             setsolve = setsolve,
             getsolve = getsolve)

}


## Write a short comment describing this function

## 1. create a function called cachesolve

cacheSolve <- function(x, ...) {

        
## 2. get the value of the inverse (i) from the cache
        
        i <- x$getsolve()
        
        
## and return 'i' if it is not NULL
        
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        
## 3. If the inverse has not been calculated yet, 
## calculate the inverse of the matrix and sets the value of the inverse in the cache
## by means of the setsolve function.
        
        matrix <- x$get()
        i <- solve(matrix, ...)
        x$setsolve(i)
        i
        
}


## Return a matrix that is the inverse of 'x'

makeCacheMatrix(x)
cacheSolve(makeCacheMatrix(x))
