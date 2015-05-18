\name{plot.BMLGrid}
\alias{plot.BMLGrid}

\title{

This function is to disply a grids with BMLGrid class. 
}
\description{

Display a grid with BMLGrid class. 
}
\usage{
## BMLGrid S3 method:
plot.BMLGrid(x,...)
}

\arguments{
  \item{x}{

a grid created by 'createBMLGrid' or 'BML'.
}
  \item{...}{
  other graphical parameters
  }
}

\author{

Xu Han
}

\examples{

g = createBMLGrid(r = 10, c=12 , ncars=c(6,7))
plot.BMLGrid(g)

}