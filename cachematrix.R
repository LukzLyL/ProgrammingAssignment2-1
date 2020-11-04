#=============================Comments========================================

#solve() was used to limit the matrix and
#Take a look: inverse matrix is only solved if matrix is squared

my_matrix = matrix(1:10, nrow= 2, ncol= 2) #Squared matrix

solve(my_matrix) #this is my inverse matrix

my_nonsquaredmatrix = matrix(1:10, nrow= 2, ncol= 5) #non squared matrix

solve(my_nonsquaredmatrix) #Results an error, because this operation cannot be accomplish due matrix is non-squared

#=============================================================================
 makeCachematrix = function(x = matrix()) {
    inversematrix = NULL 
    
    setmatrix <- function(y) { # setting the matrix
        x <<- y #storage the matrix
        inversematrix <<- NULL #stocking up the inverse matrix 
    }
    
    getmatrix = function() x #getting the matrix
    setinverse = function(inverse) inversematrix <<- inverse #storage the inverse matrix (I'll set soon in 'cachefunc')
    getinverse = function() inversematrix  #I'll get soon as well
    list(setmatrix = setmatrix, getmatrix = getmatrix,
         setinverse = setinverse,
         getinverse = getinverse)}

#Using the function to cap the inverse

cachefunc = makeCachematrix() #cachefunc  is my  cache function
my_matrix = matrix(1:10, nrow= 2, ncol= 2) #create a matrix

cachefunc$setmatrix(my_matrix) #Setting my matrix 
cachefunc$getmatrix() #Seeing my matrix

cachefunc$setinverse() #Look: return error, but i'll use this in the next function (cacheinverse)
cachefunc$getinverse() #Look: return NULL, but i'll use this in the next function (cacheinverse)

cacheinverse = function(x, ...) {
    inversematrix = x$getinverse()
    if(!is.null(inversematrix)) { #If inverse matrix was set (but i set: inversematrix <<- NULL)
        message("getting inverse in cached data")
        return(inversematrix)
    }
    data = x$getmatrix() #attribute the matrix for data
    inverse = solve(data) #calculate the inverse matrix and attribute for inverse variable
    x$setinverse(inverse) #setting the inverse matrix
    message("The inverse matrix is:")
        return(x$getinverse()) 
}

#=============================================================================================================
#First execute
cacheinverse(func)
#The inverse is NULL, else will calculate and return the matrix (will jump the "if(!is.null(inversematrix))")
#Second execute
cacheinverse(func)
#The inverse isn't NULL (in storage), else will return the inverse matrix
#=============================================================================================================

#Lucas Leite Llorente
