\name{createBMLGrid}
\alias{createBMLGrid}

\title{

createBMLGrid
}
\description{

create a grid with red cars and blue cars randomly placed on it.
}
\usage{
createBMLGrid(r,c, ncars)
}

\arguments{
  \item{r}{

the desired number of rows
}
  \item{c}{

the desired number of columns
}

 \item{ncars}{

an vector specifying nummber of red and blue cars. The first argument in the vector is 
number of red cars, the second is the number of blue cars
}
}
\details{

It will creat a r*c matrix, the location of cars is randomly sampling from the index of  matrix.

if one of the r or c is not given, function stops.

if number of cars is greater the number of spaces of matrix, function stops.


}

\author{

Xu Han
}

\examples{

createBMLGrid(r = 10, c=12 , ncars=c(5,6))

}