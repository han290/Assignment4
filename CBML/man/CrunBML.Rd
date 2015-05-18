\name{CrunBML}
\alias{CrunBML}

\title{

Simulate Biham-Middleton-Levine traffic model
}
\description{

BML is used to simulate Biham-Middleton-Levine traffic model. It will calculate the grid after t time. The output of grid can be plot by 'plot.BMLGrid' and get summaries by 'summary.BMLGrid' 
}
\usage{
CrunBML(grids, numSteps)
}

\arguments{
  \item{grids}{

A grid created by 'createBMLGrid'
}
  \item{numSteps}{

An integer which indicates the number of time steps.
}
}


\author{

Xu Han
}

\examples{

g = createBMLGrid(r = 10, c=12 , ncars=c(5,6))

CrunBML(grids = g, numSteps = 10)

}